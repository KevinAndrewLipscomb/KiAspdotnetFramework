<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_template_tabstripped_multipage.pas" Inherits="UserControl_template_tabstripped_multipage.TWebUserControl_template_tabstripped_multipage"%>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls, Version=1.0.2.226, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Register TagPrefix="uc1" TagName="UserControl1" Src="~/usercontrol/app/UserControl1.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl2" Src="~/usercontrol/app/UserControl2.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl3" Src="~/usercontrol/app/UserControl3.ascx" %>
<%@ Import namespace="Microsoft.Web.UI.WebControls"%>
  <table cellspacing="0" cellpadding="0" border="0">
	  <tr>
		<td>
		  <iewc:TabStrip id="TabStrip1" runat="server" tabselectedstyle="padding:10;border-top:thin solid silver;border-left:thin solid silver;border-right:thin solid silver;background-color:white;font-weight:bold;"
			   tabdefaultstyle="padding:10;border-top:thin solid white;border-left:thin solid white;border-right:thin solid white;background-color:silver;" targetid="MultiPage1" forecolor="Blue" tabhoverstyle="background-color:gainsboro;">
  <iewc:Tab text="Tab 1"></iewc:Tab>
  <iewc:Tab text="Tab 2"></iewc:Tab>
  <iewc:Tab text="Tab 3"></iewc:Tab>
		  </iewc:TabStrip>
		</td>
	  </tr>
	  <tr>
		<td style="BORDER-RIGHT: silver thin solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: silver thin solid; PADDING-TOP: 10px; BORDER-BOTTOM: silver thin solid">
		  <iewc:MultiPage id="MultiPage1" runat="server">
			 <iewc:pageview>
			   <uc1:UserControl1 id="UserControl1" runat="server"></uc1:UserControl1>
			 </iewc:pageview>
			 <iewc:pageview>
			   <uc1:UserControl2 id="UserControl2" runat="server"></uc1:UserControl2>
			 </iewc:pageview>
			 <iewc:pageview>
			   <uc1:UserControl3 id="UserControl3" runat="server"></uc1:UserControl3>
			 </iewc:pageview>
		  </iewc:MultiPage>
		</td>
	  </tr>
  </table>
