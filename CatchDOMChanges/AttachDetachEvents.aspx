<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AttachDetachEvents.aspx.cs"
	Inherits="AttachDetachEvents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">
	document.getElementByIdOld = document.getElementById;
	document.getElementById = function (str) {
		return this.getElementByIdOld(str);
	}
	
</script>
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<asp:ScriptManager ID="theScriptManager" runat="server" ScriptMode="Debug" />
	<div id="buttonContainer" style="color: Green; font-weight: bold; font-size: 24px;">
		<input id="button1" type="button" value="Leak" />
		<div id='id1' onclick="someHandler(); return false;">
			<p id='p1'>
				Static HTML 1
			</p>
			Static HTML 2
		</div>
	</div>
	<script type="text/javascript">

		function pageLoad() {
			var t = document.getElementById("tt");

			var button1 = $get("button1");
			$addHandler($get("button1"), "click", causeLeak);
			function causeLeak() {

				var container = $get("buttonContainer");
				container.innerHTML = "<div id='id1' style='color:Red;'><p id='p1'>Dynamic HTML inserted 1.</p><div id='div2'>Empty div 2</div>New HTML 3</div>";
			}
		}
	</script>
	</form>
</body>
</html>
