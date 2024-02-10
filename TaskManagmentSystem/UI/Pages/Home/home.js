$(function () {
    var UsersDB = [], TasksDB = [];
    // Globals variables
    GetAllUsers();
    $(document).delegate(".btnEditUser", 'click', (function () {
        var id = $(this).data("id");
        btnEditEmp_Click(id);
    }));

    GetAllTasks();
    $(document).delegate(".btnEditTask", 'click', (function () {
        var id = $(this).data("id");
        btnEditTask_Click(id);
    }));
    $(document).delegate(".btnDeleteTask", 'click', (function () {
        var id = $(this).data("id");
        btnDeleteTask_Click(id);
    }));
});

function GetAllUsers() {
    $.get("../../../api/User/GetUsersTable", function (data, status) {
        UsersDB = data;
        bindUsers();
    });
}

function bindUsers() {
    $('#tbl_Users').DataTable({
        data: UsersDB,
        columns: [

        ],
        "aoColumns": [

        {
            title: 'Name',
            mData: 'Name'
        }
                    ,
        {
            title: 'Email',
            mData: 'Email'
        },
        {
            title: 'Address',
            mData: 'Address'
        },
        {
            title: 'Type',
            mData: 'UserType'
        },
                {
                    "mRender": function (data, type, row) {
                        str = "<a class='btnEditUser' data-id='" + row["ID"] + "' href='#'>";
                        str += "<i class='glyphicon glyphicon-edit'></i>";
                        str += "</a>";
                        return str;
                    }
                }
        ]
    });

}

function btnEditEmp_Click(id) {
    window.location = "../AddEditUser/AddEditUser.aspx?id=" + id;
}

function AddUser() {
    window.location = "../AddEditUser/AddEditUser.aspx?id=-1";
}

function GetAllTasks() {
 
    $.get("../../../api/Task/GetTasks", function (data, status) {
        TasksDB = data;
        bindTasks();
    });
}

function bindTasks() {
    $('#tbl_Tasks').DataTable({
        data: TasksDB,
        "bDestroy": true,
        columns: [

        ],
        "aoColumns": [
                 {
                     title: 'Name',
                     mData: 'Name'
                 }

                    ,
                {
                    title: 'Description',
                    mData: 'Description'
                },
                {
                    title: 'Status',
                    mData: 'Status'
                },
                {
                    title: 'User',
                    mData: 'TaskUser'
                },
                        {
                            "mRender": function (data, type, row) {
                                str = "<a class='btnEditTask' data-id='" + row["ID"] + "' href='#'>";
                                str += "<i class='glyphicon glyphicon-edit'></i>";
                                str += "</a>";
                                return str;
                            }
                        },
                {
                    "mRender": function (data, type, row) {
                        str = "<a class='btnDeleteTask' data-id='" + row["ID"] + "' style='color:red' href='#'>";
                        str += "<i class='glyphicon glyphicon-remove'></i>";
                        str += "</a>";
                        return str;
                    }
                }
        ]
    });

}

function AddTask() {
    window.location = "../AddEditTask/AddEditTask.aspx?id=-1";
}

function btnEditTask_Click(id) {
    window.location = "../AddEditTask/AddEditTask.aspx?id=" + id;
}

function btnDeleteTask_Click(id) {
    $.ajax({
        url: "../../../api/Task/DeleteTask?ID=" + id,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: id,
        success: function (data, status) {
            $('#myModal').modal("show");
            GetAllTasks();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert("request failed");
        }
    });
}