<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeReg.aspx.cs" Inherits="MIS_VersionM.EmployeeReg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style
        {
            color: #497496;
            white-space: nowrap;
        }
        ::placeholder
        {
            color: #afb4bc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table class="" style="width:61%;">
        <tr>
            <td class="style">Employee ID</td>
            <td> <asp:TextBox ID="txtEmpID" runat="server"  placeholder="Employee ID"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="style">Employee Name</td>
            <td> <asp:TextBox ID="TextBox0" runat="server"  placeholder="Employee Name"  ></asp:TextBox></td>
        </tr>
        <tr>
            <td class="style">Employee Email</td>
            <td> <asp:TextBox ID="TextBox1" runat="server"  placeholder="example@domain.com"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="style">Employee Address</td>
            <td> <asp:TextBox ID="TextBox2" runat="server"  placeholder="Employee Address"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="style">Employee Phone</td>
            <td> <asp:TextBox ID="TextBox3" runat="server" placeholder="Employee Phone"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Button ID="btnSave" runat="server" Text="Save"  
                    style="background-color:#4CAF50; padding:10px 16px 10px 16px ; border:none; color:White; margin:12px; font-size:medium" 
                    onclick="btnSave_Click"/></td>
        </tr>
    </table>
    </div>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        onrowcommand="GridView1_RowCommand">
        <AlternatingRowStyle BackColor="#999999" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="EMPID" HeaderText="EMPID" SortExpression="EMPID" />
            <asp:BoundField DataField="EmpName" HeaderText="EmpName" 
                SortExpression="EmpName" />
            <asp:BoundField DataField="EmpEmail" HeaderText="EmpEmail" 
                SortExpression="EmpEmail" />
            <asp:BoundField DataField="EmpAddress" HeaderText="EmpAddress" 
                SortExpression="EmpAddress" />
            <asp:BoundField DataField="EmpPhone" HeaderText="EmpPhone" 
                SortExpression="EmpPhone" />
            <asp:ButtonField ButtonType="Link" CommandName="DeleteRow" Text="Delete" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#4caf50" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MIS_VersionMConnectionString5 %>" 
        SelectCommand="SELECT * FROM [Employee]" ></asp:SqlDataSource>
    </form>
</body>
</html>
