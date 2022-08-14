using KiAspdotnetFramework;
using kix;
using System.Configuration;
using System.Web.UI.WebControls;

namespace UserControl_establish_membership
{
    public partial class TWebUserControl_establish_membership: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_loaded;
      public Biz biz;
      }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
                Label_sponsor_1.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_sponsor_2.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_sponsor_3.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_sponsor_4.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_shared_secret_description_1.Text = ConfigurationManager.AppSettings["shared_secret_description"];
                Label_shared_secret_description_2.Text = ConfigurationManager.AppSettings["shared_secret_description"];
                TextBox_shared_secret.Focus();
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session[InstanceId() + ".p"] != null))
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
            }
            else
            {
                p.be_loaded = false;
                p.biz = new();
            }

        }

        protected void LinkButton_proceed_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("~/Default.aspx");
        }

        protected void LinkButton_trouble_handler_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("establish_membership_trouble.aspx");
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
          if (Page.IsValid)
            {
            if (p.biz.users.AcceptAsMember(k.Safe(TextBox_shared_secret.Text, k.safe_hint_type.ALPHANUM), p.biz.user.IdNum()))
              {
              SessionSet("privilege_array", p.biz.user.Privileges());
              // User was an unprivileged user until now, so reset privs.
              Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "memaccept", "Link to membership record established.  Membership privileges granted.", true);
              Table_proceed.Visible = true;
              }
            else
              {
              Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "nosuchmem", "No such membership record could be located.  Please check your submission for accuracy.", true);
              }
            }
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebUserControl_establish_membership_PreRender;
        }

        private void TWebUserControl_establish_membership_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_establish_membership Fresh()
        {
            TWebUserControl_establish_membership result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        protected void CustomValidator_shared_secret_ServerValidate(object source, ServerValidateEventArgs args)
          {
          var claimed_role_name = k.EMPTY;
          var claimed_member_name = k.EMPTY;
          var claimed_member_id = k.EMPTY;
          var claimed_member_email_address = k.EMPTY;
          if(p.biz.members.BeRoleHolderBySharedSecret
              (
              k.Safe(TextBox_shared_secret.Text, k.safe_hint_type.ALPHANUM),
              out claimed_role_name,
              out claimed_member_name,
              out claimed_member_id,
              out claimed_member_email_address
              )
            )
            {
            args.IsValid = false;
            p.biz.notifications.IssueForMembershipEstablishmentBlocked(Session["username"].ToString(),Session["user_id"].ToString(),claimed_role_name,claimed_member_name,claimed_member_id,claimed_member_email_address);
            }
          else
            {
            args.IsValid = true;
            }
          }

    } // end TWebUserControl_establish_membership

}
