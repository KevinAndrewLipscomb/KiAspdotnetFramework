<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_member_binder.pas" Inherits="UserControl_member_binder.TWebUserControl_member_binder"%>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:UpdatePanel id="UpdatePanel_control" runat="server" updatemode="Conditional">
  <ContentTemplate>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
      <tr>
        <td>
          <cc1:TabContainer id="TabContainer_control" runat="server" autopostback="True">
            <!-- cssclass attribute must not be present on the TabContainer element if custom CSS code is to work -->
            <cc1:TabPanel runat="server" headertext="Resources" id="TabPanel_resources"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="Config" enabled="False" id="TabPanel_config"></cc1:TabPanel>
            <cc1:TabPanel runat="server" headertext="About" id="TabPanel_about"></cc1:TabPanel>
          </cc1:TabContainer>
        </td>
      </tr>
      <tr>
        <td style="BORDER-RIGHT: #999999 1px solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #999999 1px solid; PADDING-TOP: 10px; BORDER-BOTTOM: #999999 1px solid">
          <ASP:PlaceHolder id="PlaceHolder_content" runat="server"></ASP:PlaceHolder>
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
