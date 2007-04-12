<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_establish_membership.pas" Inherits="UserControl_establish_membership.TWebUserControl_establish_membership"%>
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td><strong>Establish membership</strong>
          </td>
        </tr>
        <tr>
          <td>
                <p>Your <ASP:Label id="Label_application_name_1" runat="server"></ASP:Label>&nbsp;username is not currently linked to a&nbsp;<ASP:Label id="Label_sponsor_1" runat="server"></ASP:Label> membership record.</p>
                <p>Are you already a <ASP:Label id="Label_sponsor_2" runat="server"></ASP:Label>&nbsp;member?</p>
                <p>
                  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="10" border="1">
                      <tr>
						<td valign="top">
                          <p align="center"><strong>YES</strong>
                          </p></td>
						<td valign="top">-&gt;</td>
						<td valign="top">
                          <p>Match yourself to a <ASP:Label id="Label_sponsor_3" runat="server"></ASP:Label>&nbsp;membership record by entering <ASP:Label id="Label_shared_secret_description" runat="server"></ASP:Label>&nbsp;here:</p>
                          <p>
                            <ASP:TextBox id="TextBox_shared_secret" runat="server"></ASP:TextBox><ASP:Button id="Button_submit" runat="server" text="Submit"></ASP:Button>
                          </p></td>
                      </tr>
                      <tr>
						<td valign="top">
                          <p align="center"><strong>NO</strong>
                          </p></td>
						<td valign="top">-&gt;</td>
                        <td valign="top"></td>
                      </tr>
                  </table>
                </p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
