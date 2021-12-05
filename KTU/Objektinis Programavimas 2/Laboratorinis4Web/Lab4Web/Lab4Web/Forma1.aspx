<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forma1.aspx.cs" Inherits="Lab4Web.Forma1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" BackColor="#CCCCFF" BorderColor="#0066FF" BorderStyle="Groove" BorderWidth="10px" Text="Paspaudus mygtuka, programa suras pelningiausius leidejus, atsizvelgdama i prenumeratorius ir ju uzsisakytus leidinius."></asp:Label>
        <br />
    
        <asp:Button ID="Button1" runat="server" BackColor="#CCCCFF" BorderColor="#000066" BorderStyle="Ridge" BorderWidth="5px" OnClick="Button1_Click" Text="Mygtukas" Width="120px" />
        <asp:Table ID="Table1" runat="server" Height="194px" Width="232px">
        </asp:Table>
        <br />
    
    </div>
    </form>
</body>
</html>
