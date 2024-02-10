<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/TMS.Master" AutoEventWireup="true" CodeBehind="AddEditUser.aspx.cs" Inherits="TaskManagmentSystem.UI.Pages.AddEditUser.AddEditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="AddEditUser.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <!--tabs-->
            <div class="container">
                <div class="col-md-4 ">
                </div>
                <div class="col-md-12 ">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <i class="glyphicon glyphicon-user"></i>Informations
                                <hr />
                            </div>
                        </div>
                        <div class="panel-body">

                            <form method="post" id="userForm" class="form form-vertical">
                                <input type="hidden" id="hdn_id" />
                                <div class="control-group col-md-6">
                                    <label>Name</label>
                                    <div class="controls">
                                        <input type="text" name="Name" id="Name" class="form-control" placeholder="Enter Name">
                                    </div>
                                </div>
                                <div class="control-group col-md-6">
                                    <label>Password</label>
                                    <div class="controls">
                                        <input type="password" name="Password" id="Password" class="form-control" placeholder="Password">
                                    </div>
                                </div>
                                <div class="control-group col-md-6">
                                    <label>Address</label>
                                    <div class="controls">
                                        <input type="text" id="Address" class="form-control" placeholder="Enter Address">
                                    </div>
                                </div>
                                <div class="control-group col-md-6">
                                    <label>Type</label>
                                    <div class="controls">
                                        <select id="Type" class="form-control">
                                            <option value="1">Employee</option>
                                            <option value="2">Manager</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group col-md-6">
                                    <label>Email</label>
                                    <div class="controls">
                                        <input type="email" id="Email" name="Email" class="form-control" placeholder="Enter Email">
                                    </div>
                                </div>
                                <hr />

                                <div class="control-group col-md-12">
                                    <label></label>
                                    <div class="controls">
                                        <button type="button" onclick="Save();" class="btn btn-primary">
                                            Save
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
</asp:Content>
