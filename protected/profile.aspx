<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %><%@ Page language="c#" Debug="true" Codebehind="profile.pas" AutoEventWireup="false" Inherits="profile.TWebForm_profile" %>
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
		  <ASP:LinkButton id="LinkButton_logout" runat="server" causesvalidation="False">Logout</ASP:LinkButton>&nbsp;] [ Back to <ASP:LinkButton id="LinkButton_kind1_overview" runat="server" causesvalidation="False">kind1 overview</ASP:LinkButton>&nbsp;form ]
		  [ Change your KiAspdotnetFramework
		<ASP:LinkButton id="LinkButton_change_password" runat="server" causesvalidation="False">password</ASP:LinkButton>&nbsp;| <ASP:LinkButton id="LinkButton_change_email_address" runat="server" causesvalidation="False">email address</ASP:LinkButton>&nbsp;]</small>
		</td><td align="right">
				  <uc1:UserControl_print_div id="UserControl1" runat="server"></uc1:UserControl_print_div></td>
			  </tr>
		  </table></p>
<div id="Div_print_area">
	  <p>
		<ASP:Label id="Label_kind1_name" runat="server" font-bold="True" font-size="Large"></ASP:Label></p>
<p><strong>
		  <ASP:Label id="Label_application_name" runat="server"></ASP:Label>&nbsp;profile</strong></p>
<p>
		<table cellspacing="0" cellpadding="0" width="%" border="1">
			<tr><td>
				<table cellspacing="0" cellpadding="5" width="%" border="0">
	  <tr>
		<td nowrap="true">
						<p align="right">Kind1 name:</p></td>
		<td>
						<ASP:TextBox id="TextBox_kind1_name" runat="server" maxlength="127"></ASP:TextBox></td>
					  <td><ASP:RequiredFieldValidator id="RequiredFieldValidator_kind1_name" runat="server" errormessage="Kind1 name is required." controltovalidate="TextBox_kind1_name" font-bold="True">!ERR!</ASP:RequiredFieldValidator><ASP:RegularExpressionValidator id="RegularExpressionValidator_kind1_name" runat="server" errormessage="Please leave disallowed punctuation out of your kind1 name." font-bold="True" controltovalidate="TextBox_kind1_name" validationexpression="[0-9a-zA-z\.,'#%&amp;()-_ ]+">!ERR!</ASP:RegularExpressionValidator></td>
	  </tr>
					<tr>
					  <td></td>
					  <td>
				<ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button></td>
					  <td></td>
					</tr></table></td></tr></table></p>
</div>
	<asp:placeholder id="PlaceHolder_postcontent" runat="server">
	</asp:placeholder><sstchur:SmartScroller runat="server" /></form></body></html>
