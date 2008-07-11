<%@ Page language="c#" Debug="true" Codebehind="overview.pas" AutoEventWireup="false" Inherits="overview.TWebForm_overview"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_precontent" Src="~/usercontrol/app/UserControl_precontent.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_postcontent" Src="~/usercontrol/app/UserControl_postcontent.ascx" %>
<%@ Register TagPrefix="sstchur" Namespace="sstchur.web.SmartNav" Assembly="sstchur.web.smartnav" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title id="Title" runat="server"></title>
    <link REL="StyleSheet" HREF="../standard.css" TYPE="text/css" />
    <!-- $Id$ -->
  </head>
  <body bgcolor="white">
    <form runat="server">
      <uc1:UserControl_precontent id="UserControl_precontent" runat="server"></uc1:UserControl_precontent>
      <p><uc1:UserControl_print_div id="UserControl_print_div" runat="server" visible="False"></uc1:UserControl_print_div></p>
      <p><ASP:PlaceHolder id="PlaceHolder_establish_membership" runat="server"></ASP:PlaceHolder><ASP:PlaceHolder id="PlaceHolder_member_binder" runat="server"></ASP:PlaceHolder></p>
      <uc1:UserControl_postcontent id="UserControl_postcontent" runat="server"></uc1:UserControl_postcontent>
      <p><sstchur:SmartScroller runat="server" /></p>
    </form>
  </body>
</html>
