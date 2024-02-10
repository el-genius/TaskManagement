$(function () {
    $('#userForm').validate({
        rules: {
            Name: {
                minlength: 2,
                required: true
            },
            Password: {
                minlength: 2,
                required: true
            }
            ,
            Email: {
                email: true
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

    var id = getUrlParameter('id');
    if (id != -1) {
        getUserData();
    }


});

function getUserData() {

    var id = getUrlParameter('id');
    $.get("../../../api/User/GetUserByID", { ID: id }, function (data, status) {

        $('#Name').val(data.Name);
        //$('#Password').val(data.Password);
        $('#Password').prop('disabled', true);
        $('#Email').val(data.Email);
        $('#Address').val(data.Address);
        $('#Type').val(data.LKP_UserType.ID);
    });
}

function Save() {
    if ($('#userForm').valid() == true) {
        var name = $('#Name').val();
        var Pass = $('#Password').val();
        var email = $('#Email').val();
        var address = $('#Address').val();
        var Type = $('#Type').val();
        var obj = new Object();
        obj.Name = name;
        obj.Password = Pass;
        obj.Address = address;
        obj.Email = email;
        obj.UserType = Type;
        obj.ID = getUrlParameter('id');
        $.ajax({
            url: "../../../api/User/Register?str_RegistrationParams=" + JSON.stringify(obj),
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: obj,
            success: function (data, status) {
                $('#myModal').modal("show");
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert("request failed");
            }
        });
    }
}
function closeModal() {

    window.location = "../Home/Home.aspx";

}