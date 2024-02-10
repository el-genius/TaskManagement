<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/TMS.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TaskManagmentSystem.UI.Pages.Home.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />


    <script type="text/javascript" src="https://cdn.datatables.net/t/dt/dt-1.10.11/datatables.min.js"></script>
    <script src="home.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <!--tabs-->
            <div class="container">
                <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a href="#employees" data-toggle="tab">Employees</a></li>
                    <li><a href="#tasks" data-toggle="tab">Tasks</a></li>
                    <li><a href="#report" data-toggle="tab">Report</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="employees">
                        <div class="pull-right">
                            <h4>
                                <button type="button" value="Create" onclick="AddUser();">Create <i class="glyphicon glyphicon-user"></i></button>
                            </h4>
                        </div>
                        <table id="tbl_Users" class="display"></table>
                    </div>
                    <div class="row tab-pane" id="tasks">
                        <div class="pull-right">
                            <h4>
                                <button type="button" value="Create" onclick="AddTask();">Create <i class="glyphicon glyphicon-tasks"></i></button>
                            </h4>
                        </div>
                        <div class="row">
                            <table id="tbl_Tasks" class="display" style="width: 100%"></table>
                        </div>
                    </div>
                    <div class="tab-pane" id="report">
                        <h4><i class="glyphicon glyphicon-cog"></i></h4>
                        Tasks Master Report
                            <p>
                                Report Shows All Tasks With Its Status,Employee Assigned To And All Its Comments.
                            </p>
                        <div class="row">
                            <h4>
                                <button type="button" value="Create" onclick="window.location='../Report/ReportPage.aspx'">Create <i class="glyphicon glyphicon-tasks"></i></button>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
            <!--/tabs-->


            <hr>
        </div>
    </div>
</asp:Content>
