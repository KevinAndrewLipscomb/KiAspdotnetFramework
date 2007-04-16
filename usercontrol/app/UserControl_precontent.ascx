<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_precontent.pas" Inherits="UserControl_precontent.TWebUserControl_precontent"%>
<table width="100%" cellspacing="0" cellpadding="5" bgcolor="#b0c4de" border="1" bordercolor="lightsteelblue">
  <tr>
	<td align="center"><strong><ASP:Label id="Label_application_name" runat="server"></ASP:Label></strong></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="10" width="100%" border="0">
  <tr>
	<td valign="top" width="10%">
	  <p>
          <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="5" width="100%" border="1">
              <tr>
                <td bgcolor="#f5f5f5">
                  <p align="center"><strong><ASP:Label id="Label_sponsor" runat="server" font-bold="True"></ASP:Label></strong>
                  </p></td>
              </tr>
          </table>
	  </p>
	  <p>
	  <table cellspacing="0" cellpadding="0" width="100%" border="0">
		<tr>
		  <td align="center"><a href="http://www.sponsor.com"><img id="HtmlImage_sponsor_logoseal" alt="Sponsor logoseal" src="~\protected\image\sponsor_logoseal.jpg" border="0" runat="Server"></a></td>
		</tr>
	  </table>
	  </p>
	  <p>
	  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
		<tr>
		  <td>
			<table cellspacing="0" cellpadding="5" border="0" width="100%">
			  <tr>
				<td bgcolor="#f5f5f5">
				  <small><strong>Resources</strong>
				  </small></td>
			  </tr>
			  <tr>
				<td>
				  <small>
					<small>These links open in a new window.</small>
				  </small>
				  <table cellspacing="0" cellpadding="5" border="0">
					<tr>
					  <td valign="top">
						<li></li></td>
					  <td>
						<small><a href="" target="_blank">Resource 1</a></small></td>
					</tr>
					<tr>
					  <td valign="top">
						<li></li></td>
					  <td>
						<small><a href="" target="_blank">Resource 2</a>
						</small></td>
					</tr>
					<tr>
					  <td valign="top">
						<li></li></td>
					  <td>
						<small><a href="" target="_blank">Resource 3</a>
						</small></td>
					</tr>
				  </table></td>
			  </tr>
			</table></td>
		</tr>
	  </table>
	  </p>
	  <p>
	  <table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
		<tr>
		  <td>
			<table cellspacing="0" cellpadding="5" border="0">
			  <tr>
				<td bgcolor="#f5f5f5">
				  <small><strong>Process improvement</strong>
				  </small></td>
			  </tr>
			  <tr>
				<td>
				  <small>
					<small>You can help us make this application better!</small>
				  </small></td>
			  </tr>
			  <tr>
				<td>
				  <small>
					<small>Send suggestions <a href="mailto:feedback@frompaper2web.com?subject=Suggestion">here</a>.
					</small>
				  </small></td>
			  </tr>
			  <tr>
				<td>
				  <small>
					<small><strong>Thanks!</strong>
					</small>
				  </small></td>
			  </tr>
			</table></td>
		</tr>
	  </table>
	  </p>
	  <p>
		<table cellspacing="0" cellpadding="5" width="100%" border="0">
			<tr>
			  <td>
				  <p align="center"><a href="http://www.partner.com"><img id="HtmlImage_partner_banner" alt="Partner banner" src="~\protected\image\partner_banner.jpg" border="0" runat="Server"></p>
				  <p align="center"><a href="http://www.sponsorsponsor.com"><img id="HtmlImage_sponsor_sponsor_logoseal" alt="Sponsor sponsor logoseal" src="~\protected\image\sponsor_sponsor_logoseal.jpg" border="0" runat="Server"></a></p></td>
			</tr>
		</table>
	  </p>
	  </td>
	<td valign="top">
        <ASP:ValidationSummary id="ValidationSummary1" runat="server"></ASP:ValidationSummary>
