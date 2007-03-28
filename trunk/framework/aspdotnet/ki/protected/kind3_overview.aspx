<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="kind3_overview.pas" AutoEventWireup="false" Inherits="kind3_overview.TWebForm_kind3_overview" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
	<title id="Title" runat="server"></title>
	<!-- $Id$ -->
  </head>

  <body>
     <form runat="server">
      <p>
      <asp:placeholder id="PlaceHolder_precontent" runat="server">
      </asp:placeholder></p>
	  <p>
		  <table cellspacing="0" cellpadding="0" width="100%" border="0">
			  <tr>
				<td><small>[
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;] [ Change your
		<asp:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False">password</asp:LinkButton>
		|
		<asp:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False">email address</asp:LinkButton>&nbsp;]</small>
	  </td><td align="right">
				  <uc1:UserControl_print_div id="UserControl1" runat="server"></uc1:UserControl_print_div></td>
			  </tr>
		  </table></p>
<div id="Div_print_area">
		  <p>
		<ASP:Label id="Label_kind3_name" runat="server" font-bold="True" font-size="Large"></ASP:Label>&nbsp;<ASP:Label id="Label_literal_kind3" runat="server" font-bold="True" font-size="Large">Kind3</ASP:Label></p>
</div>
    <asp:placeholder id="PlaceHolder_postcontent" runat="server">
    </asp:placeholder>
     <sstchur:SmartScroller runat="server" /></form>
  </body>
</html>
