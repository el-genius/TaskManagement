<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/TMS.Master" AutoEventWireup="true" CodeBehind="EmployeeHome.aspx.cs" Inherits="TaskManagmentSystem.UI.Pages.EmployeeHome.EmployeeHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />


        <script type="text/javascript" src="https://cdn.datatables.net/t/dt/dt-1.10.11/datatables.min.js"></script>
    <script src="EmployeeHome.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <!--tabs-->
            <div class="container">

                <div class="row" id="tasks">
                    <div class="row">
                        <table id="tbl_Tasks" class="display" style="width: 100%"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
