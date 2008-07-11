<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserControl_about.pas" Inherits="UserControl_about.TWebUserControl_about"%>
<%@ Register TagPrefix="uc1" TagName="UserControl_print_div" Src="~/usercontrol/ki/UserControl_print_div.ascx" %>
<div id="Div_print_area">
<table bordercolor="#dcdcdc" cellspacing="0" cellpadding="0" border="1" width="100%">
  <tr>
    <td>
      <table cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr bgcolor="#f5f5f5">
          <td><strong>About <ASP:Label id="Label_application_name" runat="server"></ASP:Label></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<uc1:UserControl_print_div id="UserControl_print_div" runat="server"></uc1:UserControl_print_div></td>
        </tr>
        <tr>
          <td>
            <p>Software developed and&nbsp;services arranged by:</p>
            <blockquote>
              Kalips'o Infogistics LLC<br>
              d/b/a <a href="http://frompaper2web.com" target="_blank">FromPaper2Web.com</a><br>
              Kevin Lipscomb, President
            </blockquote>
            <p>Prepared for:</p>
            <blockquote>
              <p>{customer}</p>
            </blockquote>
            <p>Built and controlled using:</p>
            <ul>
              <li>Borland Delphi integrated development environment (Object Pascal programming language)</li>
              <li>Microsoft ASP.NET web application framework</li>
              <li>Microsoft Internet Explorer Web Controls</li>
              <li>Steve Stchur's SmartScroller</li>
              <li>MySQL database management system</li>
              <li>CoreLab BDP.NET MySQL Provider</li>
              <li>Subversion version control system</li>
              <li>TortoiseSVN</li>
              <li>Divlocsoft Actual Search &amp; Replace</li>
              <li>GnuWin32 findutils and sed packages</li>
              <li>Michael Elsdoerfer's NTFS Link</li>
              <li>WinMerge</li>
              <li>SourceForge.net open source code repository</li>
            </ul>
            <p>Ancillary tools:</p>
            <ul>
              <li>FolderShare</li>
              <li>IBackup IDrive</li>
              <li>Llamagraphics Life Balance</li>
              <li>Microsoft Windows XP</li>
              <li>Natara Bonsai</li>
              <li>Palm software</li>
              <li>PDFCreator</li>
              <li>Peganza ICARUS</li>
              <li>PGP</li>
              <li>Xemacs</li>
            </ul>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</div>
