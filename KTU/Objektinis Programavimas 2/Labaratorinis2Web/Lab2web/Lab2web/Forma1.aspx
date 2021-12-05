<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forma1.aspx.cs" Inherits="Lab2web.Forma1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" BackColor="#CC66FF" BorderColor="Yellow" BorderStyle="Ridge" BorderWidth="5px" ForeColor="White" Text="Paspauskite mygtuką, kad paleistumėte programą."></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" BackColor="Red" BorderColor="Yellow" BorderStyle="Dotted" OnClick="Button1_Click" Text="Mygtukas" />
    
    </div>
        <asp:Table ID="Table1" runat="server" Height="181px" Width="312px">
        </asp:Table>
    </form>
</body>
</html>
