<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CircularReferences.aspx.cs"
	Inherits="LeakPatterns_CircularReferences" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">
		var myGlobalObject;
		function SetupLeak()
		{
			// First set up the script scope to element reference
			myGlobalObject = document.getElementById("LeakedDiv");

			// Next set up the element to script scope reference
			document.getElementById("LeakedDiv").expandoProperty =
			myGlobalObject;
		}
	</script>
	<script type="text/javascript">
		function LeakMemory()
		{
			var hostElement = document.getElementById("hostElement");

			// Do it a lot, look at Task Manager for memory response

			for (i = 0; i < 5000; i++)
			{
				var parentDiv =
                    document.createElement("<div onClick='foo()'>");
				var childDiv =
                    document.createElement("<div onClick='foo()'>");

				// This will leak a temporary object
				parentDiv.appendChild(childDiv);
				hostElement.appendChild(parentDiv);
				hostElement.removeChild(parentDiv);
				parentDiv.removeChild(childDiv);
				parentDiv = null;
				childDiv = null;
			}
			hostElement = null;
		}
	</script>


		function AttachEvents(element)
		{
			// This structure causes element to ref ClickEventHandler
			element.attachEvent("onclick", ClickEventHandler);

			function ClickEventHandler()
			{
				// This closure refs element
				document.getElementById("LeakedDiv").innerHTML = "";
			}
		}

		function SetupLeak()
		{
			// The leak happens all at once
			AttachEvents(document.getElementById("leakedButton"));
		}

		function BreakLeak()
		{
		}
	</script>
</head>
<body onload="SetupLeak()">
	<form id="form1" runat="server">
	<asp:ScriptManager ID="Scriptmanager1" runat="server" />
	<div>
		<div id="buttonContainer">
			<button onclick="LeakMemory()">Memory Leaking Insert</button>
			<input id="leakedButton" type="button"  value="Leak" />
		</div>
	</div>
	</form>
</body>
</html>
