<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UserControl_role_notification_mapping.ascx.cs" Inherits="UserControl_role_notification_mapping.TWebUserControl_role_notification_mapping"%>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<table cellspacing="0" cellpadding="10" border="0">
  <tr>
    <td valign="top">
      <asp:GridView id="GridView_control" runat="server" gridlines="Horizontal" cellpadding="5" allowsorting="True" emptydatatext="No mappings" bordercolor="Gainsboro" borderstyle="Solid" borderwidth="1px" autogeneratecolumns="False">
        <RowStyle font-size="Small"></RowStyle>
        <Columns>
          <asp:CommandField causesvalidation="False" deleteimageurl="~/protected/image/delete_x16_h.png" deletetext="Unmap" showdeletebutton="True" buttontype="Image">
            <ItemStyle horizontalalign="Right"></ItemStyle>
          </asp:CommandField>
          <asp:BoundField datafield="role_id"></asp:BoundField>
          <asp:BoundField datafield="role_pecking_order"></asp:BoundField>
          <asp:BoundField datafield="role_name" headertext="Role" sortexpression="role_pecking_order%,notification_name">
            <HeaderStyle horizontalalign="Left"></HeaderStyle>
            <ItemStyle horizontalalign="Left"></ItemStyle>
          </asp:BoundField>
          <asp:BoundField datafield="notification_name" headertext="Notification" sortexpression="notification_name%,role_pecking_order">
            <HeaderStyle horizontalalign="Left"></HeaderStyle>
            <ItemStyle horizontalalign="Left"></ItemStyle>
          </asp:BoundField>
          <asp:BoundField datafield="notification_id"></asp:BoundField>
        </Columns>
        <HeaderStyle backcolor="WhiteSmoke"></HeaderStyle>
      </asp:GridView>
    </td>
    <td id="TableCell_add_mapping" runat="server" valign="top" visible="false">
      <table cellspacing="0" cellpadding="2" border="0">
        <tr>
          <td>
            <asp:DropDownList id="DropDownList_role" runat="server" font-size="Small" datavaluefield="id" datatextfield="name" appenddatabounditems="True">
              <asp:ListItem selected="True">-- Role --</asp:ListItem>
            </asp:DropDownList>
          </td>
          <td><asp:RequiredFieldValidator id="RequiredFieldValidator_role" runat="server" errormessage="Please select a Role." font-bold="True" controltovalidate="DropDownList_role" setfocusonerror="True" display="Dynamic">!ERR!</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
          <td>
            <asp:DropDownList id="DropDownList_notification" runat="server" datatextfield="notification_name" datavaluefield="notification_id" font-size="Small" appenddatabounditems="True">
              <asp:ListItem selected="True">-- Notification --</asp:ListItem>
            </asp:DropDownList>
          </td>
          <td><asp:RequiredFieldValidator id="RequiredFieldValidator_notification" runat="server" errormessage="Please select a Notification." font-bold="True" controltovalidate="DropDownList_notification" setfocusonerror="True" display="Dynamic">!ERR!</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
          <td><asp:Button id="Button_add" runat="server" text="<--&nbsp;Add" onclick="Button_add_Click"></asp:Button></td>
          <td></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
