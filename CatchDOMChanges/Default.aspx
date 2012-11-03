<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script src="jQuery/jquery-1.8.2.min.js" type="text/javascript"></script>
</head>
<body onload="onLoad();">
	<form id="form1" runat="server">
	<asp:ScriptManager ID="Scriptmanager1" runat="server" />
	<input type="button" onclick="AddHTML(); return false;" value="Modify DOM" />
	<script type="text/javascript">
	//<![CDATA[
		var i = 0;
		function AddHTML()
		{
			var span1 = $("#span1")[0];
			i++;
			span1.innerHTML = "<div style='color:green;'>DIV inserted with JavaScript i=" + i + "</div>";
		}

		function onLoad()
		{
			var documentElmenet = document.documentElement;
			// select the target node
			var target = $("#span1")[0]; //  documentElmenet; // document.querySelector('#some-id');

			// create an observer instance
			var observer = new MutationObserver(function (mutations)
			{
				mutations.forEach(function (mutation)
				{
					onMutation(mutation);
				});
			});

			// configuration of the observer:
			var config = { attributes: true, childList: true, characterData: true };

			// pass in the target node, as well as the observer options
			observer.observe(target, config);

			// later, you can stop observing
			//observer.disconnect();
		}

		function onMutation(mutation)
		{
			console.log(mutation.type);

			$("#divAdded")[0].innerHTML = htmlEncode(mutation.addedNodes[0].outerHTML);
			$("#divRemoved")[0].innerHTML = htmlEncode(mutation.removedNodes[0].outerHTML);
		}

		function htmlEncode(value)
		{
			return $('<div/>').text(value).html();
		}

		//]]>
	</script>
	<div>
	</div>
	<span id="span1" style="color: Red;"><span>This is the initial content.
		<asp:UpdatePanel ID="Updatepanel1" runat="server">
			<ContentTemplate>
				<asp:Button ID="Button1" Text="Change Something" runat="server" 
					onclick="Button1_Click" />
			</ContentTemplate>
		</asp:UpdatePanel>
	</span></span>
	<h3>
		Added HTML
	</h3>
	<div id="divAdded" style="color: Green;">
	</div>
	<h3>
		Removed HTML
	</h3>
	<div id="divRemoved" style="color: Red">
	</div>
	</form>
</body>
</html>
