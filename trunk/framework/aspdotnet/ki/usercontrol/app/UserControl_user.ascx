<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_user.pas" Inherits="UserControl_user.TWebUserControl_user"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserControl_drop_down_date" Src="~/usercontrol/ki/UserControl_drop_down_date.ascx" %>
<uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div>
<div id="Div_print_area">
<table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>
    <td valign="top">
      <table cellspacing="0" cellpadding="0" border="0">
  <tr>
    <td>Username:</td>
    <td>
      <ASP:TextBox id="TextBox_username" runat="server"></ASP:TextBox>
      &nbsp;&nbsp;&nbsp;
      <ASP:LinkButton id="LinkButton_search" runat="server" causesvalidation="False">Lookup</ASP:LinkButton>
      &nbsp;&nbsp;&nbsp;
      <ASP:LinkButton id="LinkButton_reset" runat="server" causesvalidation="False">Reset</ASP:LinkButton><br>
      <ASP:DropDownList id="DropDownList_username" runat="server" visible="False" autopostback="True"></ASP:DropDownList>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_username" runat="server" errormessage="Please enter Username." font-bold="True" controltovalidate="TextBox_username">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>Encoded password:</td>
    <td>
      <ASP:TextBox id="TextBox_encoded_password" runat="server"></ASP:TextBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Be stale password:</td>
    <td>
      <ASP:CheckBox id="CheckBox_be_stale_password" runat="server"></ASP:CheckBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Password reset email address:</td>
    <td>
      <ASP:TextBox id="TextBox_password_reset_email_address" runat="server"></ASP:TextBox>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_password_reset_email_address" runat="server" errormessage="Please enter Password reset email address." font-bold="True" controltovalidate="TextBox_password_reset_email_address">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>Be active:</td>
    <td>
      <ASP:CheckBox id="CheckBox_be_active" runat="server"></ASP:CheckBox>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>Num unsuccessful login attempts:</td>
    <td>
      <ASP:TextBox id="TextBox_num_unsuccessful_login_attempts" runat="server"></ASP:TextBox>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_num_unsuccessful_login_attempts" runat="server" errormessage="Please enter Num unsuccessful login attempts." font-bold="True" controltovalidate="TextBox_num_unsuccessful_login_attempts">!ERR!</ASP:RequiredFieldValidator>
      <ASP:RegularExpressionValidator id="RegularExpressionValidator_num_unsuccessful_login_attempts" runat="server" errormessage="Please enter a valid Num unsuccessful login attempts." font-bold="True" controltovalidate="TextBox_num_unsuccessful_login_attempts" validationexpression="\d*">!ERR!</ASP:RegularExpressionValidator>
    </td>
  </tr>
  <tr>
    <td>Last login:</td>
    <td>
      <ASP:TextBox id="TextBox_last_login" runat="server"></ASP:TextBox>
    </td>
    <td>
      <ASP:RequiredFieldValidator id="RequiredFieldValidator_last_login" runat="server" errormessage="Please enter Last login." font-bold="True" controltovalidate="TextBox_last_login">!ERR!</ASP:RequiredFieldValidator>
    </td>
  </tr>
      </table>
    </td>
  </tr>
</table>
</div>
<ASP:Button id="Button_submit" text="Submit" runat="server"></ASP:Button>&nbsp;&nbsp;<ASP:Button id="Button_delete" text="Delete" runat="server" enabled="False"></ASP:Button>
