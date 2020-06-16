<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RQ2.aspx.cs" Inherits="WebF.RQ2" %>

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

    <style type="text/css">
        .auto-style1 {
            height: 18px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div>
      
<!--   Content           -->
    <main>
          

          
 
          

    
 
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
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
                            </div>
                            <div class="col-xl-3 col-md-6"">
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
                        </div>



                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>Query Room List</div>
                        </div>
                                           <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" >
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
         </main>

                                
                            </div>
                       
                                                   
        
        <br/>
         <br/>
         <br/> <br/>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="價錢從低到高" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="價錢從高到低" />
         <br/>

            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged1">
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label5" runat="server"></asp:Label>
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="查詢可預定房型" />
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="下一頁" />
            <br />
            <asp:Label ID="Label2" runat="server" Text="按下一頁確認付款資訊"></asp:Label>

  
  
<!--   /Content   fin     -->
      
       
        
        
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
       

    </form>
</body>
</html>
