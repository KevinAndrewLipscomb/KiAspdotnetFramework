using Class_biz_users;
using kix;
using System;
using System.Configuration;
using System.Web.Security;
using System.Web.UI;

namespace salogin
{
    public partial class TWebForm_salogin: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_biz_users biz_users;
      }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_salogin_PreRender;
        }

    private void InjectPersistentClientSideScript()
      {
      EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
      EstablishClientSideFunction("SetClientTimezoneOffset()","El('" + Hidden_client_timezone_offset.ClientID + "').value = (new Date()).getTimezoneOffset();");
      Button_log_in.Attributes.Add("onclick","SetClientTimezoneOffset();");
      LinkButton_new_user.Attributes.Add("onclick","SetClientTimezoneOffset();");
      }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - salogin";
            switch(NatureOfVisitUnlimited(InstanceId() + ".p"))
            {
                case nature_of_visit_type.VISIT_COLD_CALL:
                case nature_of_visit_type.VISIT_INITIAL:
                    p.biz_users = new TClass_biz_users();
                    RequireConfirmation(LinkButton_forgot_password,"Are you sure you want a new password?");
                    TextBox_username.Focus();
                    break;
                case nature_of_visit_type.VISIT_POSTBACK_STANDARD:
                    p = (p_type)(Session[InstanceId() + ".p"]);
                    break;
            }
            InjectPersistentClientSideScript();
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void LinkButton_new_user_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("new_user_registration.aspx");
        }

        protected void LinkButton_forgot_username_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("remind_username.aspx");
        }

        protected void LinkButton_forgot_password_Click(object sender, System.EventArgs e)
        {
            string username;
            if (TextBox_username.Text.Length == 0)
            {
                Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "misusrnam", "Please enter your username.", true);
            }
            else
            {
                username = k.Safe(TextBox_username.Text.Trim(), k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM);
                if (p.biz_users.BeRegisteredUsername(username))
                {
                    p.biz_users.IssueTemporaryPassword(username, k.Safe(Request.UserHostName, k.safe_hint_type.HOSTNAME));
                    Alert(k.alert_cause_type.LOGIC, k.alert_state_type.NORMAL, "tmpassent", "A temporary password has been sent to the email address that " + ConfigurationManager.AppSettings["application_name"] + " has on file for " + username + ".  Please log in after you receive it.  You will receive further instructions at that" + " time.", true);
                }
                else
                {
                    Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "nosuchusr", "No such user registered", true);
                }
            }
        }

        private void TWebForm_salogin_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        protected void CustomValidator_account_exists_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            var be_active = false;
            bool dummy_boolean;
            uint dummy_cardinal;
            string dummy_string;
            //
            args.IsValid =
              p.biz_users.Get
                (
                username:k.Safe(TextBox_username.Text.Trim(),k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM),
                encoded_password:out dummy_string,
                be_stale_password:out dummy_boolean,
                password_reset_email_address:out dummy_string,
                be_active:out be_active,
                num_unsuccessful_login_attempts:out dummy_cardinal,
                last_login:out dummy_string
                )
            &&
              be_active
            &&
              p.biz_users.BeAuthorizedSysAdmin
                (
                encoded_password:k.Digest(k.Safe(TextBox_password.Text.Trim(),k.safe_hint_type.ALPHANUM))
                );
        }

        protected void Button_log_in_Click(object sender, System.EventArgs e)
        {
            string username;
            username = k.Safe(TextBox_username.Text.Trim(), k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM);
            if (Page.IsValid)
            {
                var user_id = p.biz_users.IdOf(username);
                SessionSet("user_id",user_id);
                SessionSet("username", username);
                SessionSet("password_reset_email_address",p.biz_users.PasswordResetEmailAddressOfId(user_id));
                FormsAuthentication.SetAuthCookie(username, CheckBox_keep_me_logged_in.Checked);
                Response.Redirect("~/protected/overview.aspx");
            }
        }

    } // end TWebForm_salogin

}
