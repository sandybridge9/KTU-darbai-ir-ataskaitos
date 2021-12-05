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
        <br />
        <asp:Label ID="Label2" runat="server" BorderStyle="Dashed" Text="Mygtukas, kuris iraso rezultatus i faila." ViewStateMode="Disabled"></asp:Label>
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Rezultatai i faila" Height="51px" Width="234px" />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" BackColor="#CCCCFF" Text="Mygtukas, kuris iraso rezultatus i lentele grafineje sasajoje"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" BackColor="#CCCCFF" BorderColor="#000066" BorderStyle="Ridge" BorderWidth="5px" OnClick="Button1_Click" Text="Rezultatai i lentele" Width="342px" Height="68px" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Rezultatu lentele:"></asp:Label>
        <asp:Table ID="Table1" runat="server" Height="194px" Width="232px">
        </asp:Table>
        <br />
    
    </div>
    </form>
</body>
</html>
