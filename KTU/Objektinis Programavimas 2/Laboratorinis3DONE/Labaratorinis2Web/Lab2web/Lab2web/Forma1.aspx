<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forma1.aspx.cs" Inherits="Lab2web.Forma1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" BackColor="#CC66FF" BorderColor="Yellow" BorderStyle="Ridge" BorderWidth="5px" ForeColor="White" Text="Mygtukas vykdantis programa"></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" BackColor="Red" BorderColor="Yellow" BorderStyle="Dotted" OnClick="Button1_Click" Text="Vykdyti" />
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label3" runat="server" ForeColor="#CC99FF" Text="Pasirinkti itaisu duomenu faila (&quot;U24a.txt&quot;)."></asp:Label>
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="#FF9933" />
        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="#FF99FF" Text="Pasirinkti itaisu duomenu faila (&quot;U24a.txt&quot;)."></asp:Label>
        <br />
        <asp:FileUpload ID="FileUpload2" runat="server" ForeColor="#FF9933" />
        <br />
        <asp:Table ID="Table1" runat="server">
        </asp:Table>
    
    </div>
    </form>
</body>
</html>
