$(function () {
    GetAllTasks();
    $(document).delegate(".btnEditTask", 'click', (function () {
        var id = $(this).data("id");
        btnEditTask_Click(id);
    }));
});


function GetAllTasks() {
    var data = JSON.parse(sessionStorage.getItem("currentUser"));
    var userid = data.ID;
    $.get("../../../api/Task/GetTaskByUserID", { UserID: userid }, function (data, status) {
        TasksDB = data;
        bindTasks();
    });
}

function bindTasks() {
    $('#tbl_Tasks').DataTable({
        data: TasksDB,
        columns: [

        ],
        "aoColumns": [
                {
                    "mRender": function (data, type, row) {
                        str = "<span>" + row["Name"]
                            + "</span>";
                        return str;
                    }
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
                }
        ]
    });

}

function btnEditTask_Click(id) {
    window.location = "../AddEditTask/AddEditTask.aspx?id=" + id;
}