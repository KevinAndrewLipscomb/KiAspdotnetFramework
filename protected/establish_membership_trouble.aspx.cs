using KiAspdotnetFramework;
using kix;
using System;
using System.Configuration;

namespace establish_membership_trouble
  {
  public partial class TWebForm_establish_membership_trouble: ki_web_ui.page_class
    {

    private struct p_type
      {
      public Biz biz;
      }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_establish_membership_trouble_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - establish_membership_trouble";
            if (!IsPostBack)
            {
                Label_sponsor_1.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_sponsor_2.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
                Label_application_name_2.Text = ConfigurationManager.AppSettings["application_name"];
                Label_application_name_3.Text = ConfigurationManager.AppSettings["application_name"];
                TextBox_full_name.Focus();
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            switch(NatureOfVisit(InstanceId() + ".p"))
            {
                case nature_of_visit_type.VISIT_INITIAL:
                    p.biz = new();
                    break;
                case nature_of_visit_type.VISIT_POSTBACK_STANDARD:
                    p = (p_type)(Session[InstanceId() + ".p"]);
                    break;
            }

        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            p.biz.notifications.IssueForMembershipEstablishmentTrouble(k.Safe(TextBox_full_name.Text, k.safe_hint_type.HUMAN_NAME), k.Safe(TextBox_explanation.Text, k.safe_hint_type.PUNCTUATED));
            Session.Clear();
            Server.Transfer("~/login.aspx");
        }

        private void TWebForm_establish_membership_trouble_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    } // end TWebForm_establish_membership_trouble

}
