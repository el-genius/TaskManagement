$(function () {
    $('#taskForm').validate({
        rules: {
            Name: {
                minlength: 2,
                required: true
            },
            Description: {
                minlength: 2,
                required: true
            }
        },
        highlight: function (element) {
            $(element).closest('.control-group').removeClass('has-success').addClass('has-error');
        },
        success: function (element) {
            element.addClass('valid')
                .closest('.control-group').removeClass('has-error').addClass('has-success');
        }
    });
    manageTaskStatus();
    var UsersDB = [];

    getUsers();

    var id = getUrlParameter('id');
    if (id != -1)
        getTaskData();

    var userdata = JSON.parse(sessionStorage.getItem("currentUser"));
    if (userdata.UserTypeID == EmpTyps.Manger) {
        $("#dv_attachment").hide();
    }

    getTaskComments();
});
var CurrentUser = JSON.parse(sessionStorage.getItem("currentUser"));
var id = getUrlParameter('id');
var EmpTyps = {
    Employee: 1,
    Manger: 2
};

var TaskStatus = {
    Assigned: 1,
    InProgress: 2,
    Pending: 3,
    Completed: 4
};
var EmpTypes = {
    Employee: 1,
    Manager: 2
};

function manageTaskStatus() {

    var ID = getUrlParameter('id');
    if (ID == -1 && CurrentUser.UserTypeID == EmpTypes.Manager)// adding
    {
        $('#dv_status').hide();
    }
    else if (ID != -1 && CurrentUser.UserTypeID == EmpTypes.Manager) {// manger edit to complete
        $('#lbl_status').text('Completed');
    }
    else if (ID != -1 && CurrentUser.UserTypeID == EmpTypes.Employee) {
        $('#lbl_status').text('Pending');

        // disablig emp to edit
        $('#Name').prop('disabled', true);
        $('#Description').prop('disabled', true);
    }
}



function getUsers() {
    $.get("../../../api/User/GetUsersTable", function (data, status) {
        UsersDB = data;
        bindUsers();
    });
}

function bindUsers() {
    for (var i = 0; i < UsersDB.length; i++) {
        var opt = $('<option>');
        opt.attr("value", UsersDB[i].ID);
        opt.text(UsersDB[i].Name);
        opt.appendTo($('#User'));
    }
}

function Save(frombutton) {
    if ($('#taskForm').valid() == true) {
        var name = $('#Name').val();
        var desc = $('#Description').val();
        var user = $('#User').val();
        var status = $('#Status').val();
        var attach = $('#AttachFile').val();

        var obj = new Object();
        obj.Name = name;
        obj.Description = desc;
        obj.User = user;
        obj.ID = id;


        var file;
        var filecontrol = $("#AttachFile");
        if (filecontrol.length > 0) {
            file = filecontrol[0].files[0];
            obj.Attachment = file.name;
        }
        var CurrentUser = JSON.parse(sessionStorage.getItem("currentUser"))

        if (obj.ID == -1 && CurrentUser.UserTypeID == EmpTypes.Manager)// adding
            obj.TaskStatus = TaskStatus.Assigned;
        else if (obj.ID != -1 && CurrentUser.UserTypeID == EmpTypes.Manager) {
            if ($('#cb_status').is(":checked"))
                obj.TaskStatus = TaskStatus.Completed;
        }
        else if (obj.ID != -1 && CurrentUser.UserTypeID == EmpTypes.Employee) {
            if ($('#cb_status').is(":checked"))
                obj.TaskStatus = TaskStatus.Pending;
            else
                obj.TaskStatus = TaskStatus.InProgress;
        }

        var postdata = new FormData();
        postdata.append("file", file);

        $.ajax({
            url: "../../../api/Task/UploadFile",
            type: "POST",
            contentType: false,
            processData: false,
            data: postdata,
            success: function (data, status) {

                $.ajax({
                    url: "../../../api/Task/AddEditTask?str_NewTaskModel=" + JSON.stringify(obj),
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: obj,
                    success: function (data, status) {

                        if (frombutton) {
                            $('#myModal').modal("show");

                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert("request failed");

                    }
                });
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert("request failed");

            }
        });


    }
}

function closeModal() {
    if (CurrentUser.UserTypeID == EmpTyps.Manger) {
        window.location = "../Home/Home.aspx";
    } else {
        //employee
        window.location = "../EmployeeHome/EmployeeHome.aspx";
    }
}

function getTaskData() {
    var id = getUrlParameter('id');
    $.get("../../../api/Task/GetTaskByID", { ID: id }, function (data, status) {
        $('#Name').val(data.Name);
        $('#Description').val(data.Description)
        $('#User').val(data.User.ID);

        var userdata = JSON.parse(sessionStorage.getItem("currentUser"));
        if (data.LKP_TaskStatus.ID != TaskStatus.Assigned || userdata.UserTypeID == EmpTyps.Employee) {
            $('#User').prop('disabled', true);
        }

        if (userdata.UserTypeID == EmpTyps.Employee) {
            if (data.LKP_TaskStatus.ID == TaskStatus.Assigned) {
                Save(false);
            } else if (data.LKP_TaskStatus.ID == TaskStatus.Pending) {
                $('#cb_status').prop('checked', true);
                $('#cb_status').prop('disabled', true);

            }

            if (id != -1 && data.Attachment != null) {
                $('#dv_attachment').hide();
                $('#dv_downloadAttachment').show();

                $('#lbl_attachment').text(data.Attachment);
                $('#downloadLink').attr('href', "../../../UploadedFiles/" + data.Attachment);
            } else {
                $('#dv_attachment').show();
                $('#dv_downloadAttachment').hide();
            }
        }
        else {//manager
            if (data.LKP_TaskStatus.ID == TaskStatus.Completed) {
                $('#cb_status').prop('checked', true);
                $('#cb_status').prop('disabled', true);
            }

            if (id != -1 && data.Attachment != null) {
                $('#dv_downloadAttachment').show();

                $('#lbl_attachment').text(data.Attachment);
            }
        }
    });
}

function AddComment() {

    if (id != -1) {
        var box = $('#commentBox');

        box.html('<div class="col-sm-1"><div class="thumbnail"><img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">'
    + '</div></div><div class="col-sm-10"><div class="panel panel-default"><div class="panel-heading"><strong>' + CurrentUser.Name + '</strong> '
    + '</div><textarea cols="40" rows="5" id="commentContent" class="form-control" ></textarea></div></div><div class="controls"><button type="button" onclick="SaveComment();" class="btn btn-group-sm center-block">Save Comment</button></div> ');

    }
}

function SaveComment() {
    var commentBody = $('#commentContent').val();

    var obj = new Object();
    obj.Body = commentBody;
    obj.TaskID = id;
    obj.UserID = CurrentUser.ID;

    if (commentBody.trim() != '') {
        $.ajax({
            url: "../../../api/Comment/AddComment?str_NewCommentModel=" + JSON.stringify(obj),
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: obj,
            success: function (data, status) {

                // reload to show the comment
                getTaskComments();
                $('#commentBox').hide();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert("request failed");
            }
        });
    }
}

function getTaskComments() {

    $.get("../../../api/Comment/GetCommentByTask", { TaskID: id }, function (data, status) {
        if (data && data.length > 0) {
            var box = $('.TaskComments');
            box.html('');
            for (var i = 0; i < data.length; i++) {
                box.append('<div class="row"> <div class="col-sm-1"><div class="thumbnail"><img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">'
            + '</div></div><div class="col-sm-10"><div class="panel panel-default"><div class="panel-heading"><strong>' + data[i].User.Name + '</strong> '
            + '</div><div class="panel-body">' + data[i].Body + '</div></div></div><div class="controls"></div></div> ');

            }

        }
    });
}