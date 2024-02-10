<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/TMS.Master" AutoEventWireup="true" CodeBehind="AddEditTask.aspx.cs" Inherits="TaskManagmentSystem.UI.Pages.AddEditTask.AddEditTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="AddEditTask.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="server">
    <div class="row">
        <div class="col-md-12">

            <div class="container">
                <div class="col-md-4 ">
                </div>
                <div class="col-md-12 ">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <i class="glyphicon glyphicon-tasks"></i> Task Informations
                                <hr />
                            </div>
                        </div>
                        <div class="panel-body">

                            <form class="form form-vertical" data-ajax="false" name="taskForm" id="taskForm" method="post" enctype="multipart/form-data">
                                <input type="hidden" id="hdn_id" />
                                <div class="control-group col-md-6">
                                    <label>Name</label>
                                    <div class="controls">
                                        <input type="text" id="Name" name="Name" class="form-control" placeholder="Enter Name" />
                                    </div>
                                </div>

                                <div class="control-group col-md-6">
                                    <label>User</label>
                                    <div class="controls">
                                        <select id="User" class="form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group col-md-12" id="dv_status">

                                    <div class="controls">
                                        <label>Task Status</label>
                                        <input id="cb_status" type="checkbox" />
                                        <label id="lbl_status"></label>

                                    </div>
                                </div>
                                <div id="dv_attachment" class="control-group col-md-12">
                                    <label>Attachment</label>
                                    <div class="controls">
                                        <input class="form-control" id="AttachFile" name="AttachFile" type="file" />
                                        <%--<asp:FileUpload ID="AttachFile" runat="server" />--%>
                                    </div>
                                </div>
                                <div id="dv_downloadAttachment" class="control-group col-md-12">


                                    <div class="controls">
                                        <label id="lbl_attachment"></label>
                                        <a href="#" id="downloadLink">Download</a>
                                        <%--<asp:FileUpload ID="AttachFile" runat="server" />--%>
                                    </div>
                                </div>
                                <div class="control-group col-md-12">
                                    <label>Description</label>
                                    <div class="controls">
                                        <textarea cols="40"
                                            rows="5" id="Description" name="Description" class="form-control" placeholder="Description"></textarea>
                                    </div>
                                </div>
                                <hr />

                                <div class="control-group col-md-12">
                                    <div class="controls">
                                        <button type="button" onclick="Save(true);" class="btn btn-primary ">
                                            Save
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!--/panel content-->
                    </div>
                    <!--/panel-->

                    <div class="panel panel-default">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-2">
                                    <h3>Comments</h3>
                                </div>
                                <br />
                                <div class="row CommentBtn col-sm-8">
                                    <div class="col-sm-12">
                                        <div class="controls">
                                            <button type="button" onclick="AddComment()" class="btn btn-primary">
                                                Add Comment
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /col-sm-12 -->
                            </div>
                            <hr />
                            <div class="row" id="commentBox">
                            </div>
                            <!-- /row -->
                            <div class="TaskComments">
                                <%--           <div class="col-sm-1">
                                    <div class="thumbnail">
                                        <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_1x.png">
                                    </div>
                                    <!-- /thumbnail -->
                                </div>
                                <!-- /col-sm-1 -->

                                <div class="col-sm-5">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <strong>myusername</strong> <span class="text-muted">replied</span>
                                        </div>
                                        <div class="panel-body">
                                            Panel content
                                        </div>
                                        <!-- /panel-body -->
                                    </div>
                                    <!-- /panel panel-default -->
                                </div>
                                <!-- /col-sm-5 -->--%>
                            </div>
                        </div>
                        <!-- /container -->
                    </div>
                </div>

            </div>

        </div>
</asp:Content>
