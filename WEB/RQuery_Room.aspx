﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RQuery_Room.aspx.cs" Inherits="WebF.RQuery_Room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
          <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>


</head>
<body>
   <form id="form1" runat="server">    
 
      <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.html">Start Bootstrap</a><button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button
            ><!-- Navbar Search-->
<!--            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
-->
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                   <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
<!--                        <a class="dropdown-item" href="#">Settings</a><a class="dropdown-item" href="#">Activity Log</a>
-->
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="login.html">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link" href="index.aspx"
                                ><div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Home</a>
                            
<!--                            <div class="sb-sidenav-menu-heading">Interface</div>
-->
<!--                             <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts" > 
-->                            
                             <a class="nav-link" href="RQuery_Room.aspx">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Reservation 
<!--                               <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div >
-->   
                            </a>
<!--                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a></nav>
                            </div>
-->
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"
                                ><div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Member Area
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div
                            ></a>
                            <div class="nav-link" >
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
    
                                    <a class="nav-link collapsed" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="true" aria-controls="pagesCollapseAuth">  
                                    </a>
                                        <a class="nav-link" href="login.aspx">Login</a>
                                        <a class="nav-link" href="Member.aspx">Member Data</a>
                                        <a class="nav-link" href="RQuery_check.aspx">Order Tracking</a>
                                        <div class="sb-sidenav-collapse-arrow"><i class=""></i></div>
<!--                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="true" aria-controls="pagesCollapseAuth"
                                        >Member Data
                                        <div class="sb-sidenav-collapse-arrow"><i class=""></i></div
                                    ></a>
                                  <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="login.html">Login</a><a class="nav-link" href="register.html">Register</a><a class="nav-link" href="password.html">Forgot Password</a></nav>
                                    </div>

                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="true" aria-controls="pagesCollapseError"
                                        >Order Tracking
                                        <div class="sb-sidenav-collapse-arrow"><i class=""></i></div
                                    ></a>
--><!--                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="401.html">401 Page</a><a class="nav-link" href="404.html">404 Page</a><a class="nav-link" href="500.html">500 Page</a></nav>
                                    </div>
--> 
                                </nav>

                           </div>
                             <div class="sb-sidenav-menu-heading">Contact US</div>
                            <a class="nav-link" href="Message_index.aspx">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                FAQs</a>
<!--                           <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables</a>
-->                     
                                </div>

                             </div>


                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
<!--   Content           -->
             
                <main>
                    <div class="container-fluid">
                      <h1 class="mt-4">Reservation</h1>
                        <ol class="breadcrumb mb-4">

                        </ol>
                        <asp:Label ID="Label3" runat="server" Text="Step.1 請選擇入住和退房日期："></asp:Label>
                              <div class="row">
                           
                                <div class="card mb-4">
                                    <div class="card-header"><i class="fas fa-table mr-1"></i>    請選擇入住日期</div>   
                                    <div class="card-body align-items-center justify-content-between">
                                       <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                                           <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                           <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                           <OtherMonthDayStyle ForeColor="#999999" />
                                           <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                           <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                           <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                    </div>
                                </div>
                         
                           
                                <div class="card mb-4">
                                   <div class="card-header"><i class="fas fa-table mr-1"></i>    請選擇退房日期</div>  
                                    <div class="card-body align-items-center justify-content-between">
                                    <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged1" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                        <OtherMonthDayStyle ForeColor="#999999" />
                                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                        <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                    </div>
                                </div>
                            </div>
                        



                        <asp:Label ID="Label1" runat="server" Text="Step2. 請按以下按鈕，進行空房房型查詢："></asp:Label>            
<div class="card mb-4">
             <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查詢可預訂房型(價錢從低到高)" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查詢可預訂房型(價錢從高到低)" />
                
    </div>
    <div class="card mb-4">
        <div class="card-header"><i class="fas fa-table mr-1"></i>Query Room List</div>
                        <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="90%" >
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
 
                            </asp:GridView>    


        </div>
    <asp:Label ID="Label4" runat="server" Text="Step3. 請選擇希望預定的房型："></asp:Label>
    <div class="card mb-4">
             <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged1" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
            <asp:Label ID="Label5" runat="server"></asp:Label>
        </div>
    <asp:Label ID="Label2" runat="server" Text="Step4. 按下一頁進入確認訂房資訊 & 付款資訊"></asp:Label>
    <div class="card mb-4">
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="下一頁" />
            
    </div>
   
</div>
                      
</main>
                   
 
                
<!--   /Content   fin     -->
                <footer class="py-4 bg-dark mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2019</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
  
   </form>   
</body>
</html>

