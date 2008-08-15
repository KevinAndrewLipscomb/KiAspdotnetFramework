<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_role.pas" Inherits="UserControl_role.TWebUserControl_role"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<div id="Div_print_area">
  <table cellspacing="0" cellpadding="5" width="100%" border="0">
    <tr>
      <td valign="top">
        <table cellspacing="0" cellpadding="5" border="0">
          <tr>
            <td valign="top"><font class="">Title:</font></td>
            <td valign="top"><font class="">
                <ASP:TextBox id="TextBox_name" runat="server" cssclass="" maxlength="63" columns="63"></ASP:TextBox>&nbsp;&nbsp;&nbsp;&nbsp; <ASP:LinkButton id="LinkButton_search" runat="server"
                                font-bold="True" causesvalidation="False">Lookup</ASP:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp; <ASP:LinkButton id="LinkButton_reset" runat="server"
                                causesvalidation="False">Reset</ASP:LinkButton><br>
                <ASP:DropDownList id="DropDownList_name" runat="server" autopostback="True" visible="False"></ASP:DropDownList><br>
              </font></td>
            <td valign="top">
              <ASP:RequiredFieldValidator id="RequiredFieldValidator_name" runat="server" font-bold="True" display="Dynamic" controltovalidate="TextBox_name" errormessage="Please enter Name.">!ERR!</ASP:RequiredFieldValidator></td>
          </tr>
          <tr id="TableRow_pecking_order" runat="server" visible="False">
            <td><font class="">Pecking order:</font></td>
            <td><font class="">
                <ASP:TextBox id="TextBox_pecking_order" runat="server" cssclass="" maxlength="10" columns="10"></ASP:TextBox>
              </font></td>
            <td>
              <asp:RequiredFieldValidator id="RequiredFieldValidator_pecking_order" runat="server" font-bold="True" display="Dynamic" controltovalidate="TextBox_pecking_order" errormessage="Please enter Pecking order.">!ERR!</asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator id="RegularExpressionValidator_pecking_order" runat="server" font-bold="True" display="Dynamic" controltovalidate="TextBox_pecking_order" errormessage="Please enter a valid Pecking order." validationexpression="\d{1,10}">!ERR!</asp:RegularExpressionValidator></td>
          </tr>
          <tr id="TableRow_soft_hyphenation_text" runat="server" visible="False">
            <td><font class="">Soft hyphenation text:</font></td>
            <td><font class="">
                <ASP:TextBox id="TextBox_soft_hyphenation_text" runat="server" cssclass="" maxlength="127" columns="72"></ASP:TextBox>
              </font></td>
            <td>
              <ASP:RequiredFieldValidator id="RequiredFieldValidator_soft_hyphenation_text" runat="server" font-bold="True" display="Dynamic" controltovalidate="TextBox_soft_hyphenation_text" errormessage="Please enter Soft hyphenation text.">!ERR!</ASP:RequiredFieldValidator></td>
          </tr>
        </table></td>
    </tr>
  </table>
<ASP:Button id="Button_submit" runat="server" enabled="False" text="Submit"></ASP:Button>&nbsp;&nbsp;
<ASP:Button id="Button_delete" runat="server" enabled="False" text="Delete"></ASP:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="Anchor_quick_message_shortcut" runat="server" visible="False">QuickMessage</a>
<p>
  <table id="Table_holders" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" runat="server" visible="False">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="10" border="0">
          <tr>
            <td bgcolor="whitesmoke"><strong>Holders&nbsp;(
                <asp:Label id="Label_num_rows" runat="server"></asp:Label>)
              </strong></td>
          </tr>
          <tr>
            <td>
              <asp:GridView id="GridView_holders" runat="server" borderstyle="None" cellpadding="5" allowsorting="True" gridlines="None" autogeneratecolumns="False">
                <Columns>
                  <asp:BoundField datafield="member_name" headertext="Name" sortexpression="member_name%">
                    <ItemStyle wrap="False" font-size="X-Small"></ItemStyle>
                  </asp:BoundField>
                  <asp:BoundField datafield="email_address"></asp:BoundField>
                </Columns>
              </asp:GridView></td>
          </tr>
        </table></td>
    </tr>
  </table>
</p>
</div>
<p>
  <table id="Table_quick_message" bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" width="100%" border="1" runat="server" visible="False">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="10" width="100%" border="0">
          <tr>
            <td bgcolor="#f5f5f5"><a id="QuickMessage"><strong>QuickMessage</strong>
              </a></td>
          </tr>
          <tr>
            <td>
              <table cellspacing="0" cellpadding="10" width="100%" border="0">
                <tr>
                  <td>To:</td>
                  <td>The parties shown in the adjacent table (see below for resolution)</td>
                  <td></td>
                </tr>
                <tr>
                  <td>Bcc:</td>
                  <td>
                    <ASP:Label id="Label_author_email_address" runat="server"></ASP:Label></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Subject:</td>
                  <td>
                    <ASP:TextBox id="TextBox_quick_message_subject" runat="server" maxlength="255" columns="72"></ASP:TextBox></td>
                  <td></td>
                </tr>
                <tr>
                  <td valign="top">Body:</td>
                  <td>
                    <ASP:TextBox id="TextBox_quick_message_body" runat="server" columns="72" textmode="MultiLine" rows="18"></ASP:TextBox></td>
                  <td valign="top" nowrap="true">
                    <ASP:RequiredFieldValidator id="RequiredFieldValidator_quick_message_body" runat="server" font-bold="True" display="Dynamic" controltovalidate="TextBox_quick_message_body" errormessage="Please enter a message body." validationgroup="QuickMessage">!ERR!</ASP:RequiredFieldValidator></td>
                </tr>
                <tr>
                  <td></td>
                  <td>
                    <ASP:Button id="Button_send" runat="server" text="Send" validationgroup="QuickMessage"></ASP:Button></td>
                  <td></td>
                </tr>
                <tr>
                  <td valign="top">
                    <small><font color="#c0c0c0">Resolves to:
                    </small></font></td>
                  <td valign="top">
                    <small>
                      <ASP:Label id="Label_distribution_list" runat="server" forecolor="Silver"></ASP:Label>
                    </small></td>
                  <td></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</p>

