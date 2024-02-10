<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/TMS.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="TaskManagmentSystem.UI.Pages.LogIn.LogIn" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
    <script src="login.js"></script>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="PageContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <!--tabs-->
            <div class="container">
                <div class="col-md-4 ">
                </div>
                <div class="col-md-4 ">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <i class="glyphicon glyphicon-user pull-right"></i>
                                <h2>Sign In</h2>
                                <hr />
                            </div>
                        </div>
                        <div class="panel-body">

                            <form method="post" class="form form-vertical">

                                <div class="control-group">
                                    <label>Name</label>
                                    <div class="controls">
                                        <input type="text" id="Name" class="form-control" placeholder="Enter Name">
                                    </div>
                                </div>
                                <hr />
                                <div class="control-group">
                                    <label>Password</label>
                                    <div class="controls">
                                        <input type="password" id="Password" class="form-control" placeholder="Password">
                                    </div>
                                </div>
                                <hr />
                                <div class="control-group">
                                    <label></label>
                                    <div class="controls">
                                        <button type="button" onclick="logIn();" class="btn btn-primary">
                                            Sign In
                                        </button>
                                    </div>
                                </div>

                            </form>

                        </div>
                        <!--/panel content-->
                    </div>
                    <!--/panel-->



                </div>
            </div>
            <!--/tabs-->


            <hr>
        </div>

    </div>
    <!-- Modal -->
    <div class="modal fade" id="errorModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header alert-danger">
                    <button type="button" class="close" onclick="closeErrorModal();" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title ">Error</h4>
                </div>
                <div class="modal-body">
                    <p>Wrong User Name or Password.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" onclick="closeErrorModal();" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
