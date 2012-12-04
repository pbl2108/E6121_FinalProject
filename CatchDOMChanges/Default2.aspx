<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<asp:ScriptManager ID="Scriptmanager1" runat="server" />
	<span>
		<asp:UpdatePanel ID="Updatepanel2" runat="server" RenderMode="Inline">
			<ContentTemplate>
				<asp:Button ID="Button1" Text="Update Me" runat="server" 
					onclick="Button1_Click" />
			</ContentTemplate>
		</asp:UpdatePanel>
	</span>
	</form>
</body>
</html>
