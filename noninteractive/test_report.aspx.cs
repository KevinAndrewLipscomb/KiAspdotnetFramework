using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;

namespace test_report
  {

  public partial class TWebForm_test_report: ki_web_ui.page_class
    {

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - test_report";
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      }

    protected override void Render(HtmlTextWriter writer)
      {
      //
      // Write the HTML stream into a StringBuilder.
      //
      var sb = new StringBuilder();
      using var html_text_writer = new HtmlTextWriter(new StringWriter(sb));
      base.Render(html_text_writer);
      //
      // Send output stream as an email message.
      //
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:"recipient@frompaper2web.com",
        subject:"Test Report",
        message_string:sb.ToString(),
        be_html:true
        );
      }

    } // end TWebForm_test_report

  }
