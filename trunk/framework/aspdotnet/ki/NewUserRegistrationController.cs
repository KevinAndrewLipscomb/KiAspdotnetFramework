using Class_biz_users;
using ki_web_http;
using kix;
using System.Net.Http;
using System.Web.Security;

namespace KiAspdotnetFramework
  {
  public class NewUserRegistrationController : apicontroller_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private struct p_type
      {
      public TClass_biz_users biz_users;
      }

    private p_type p; // Private Parcel of controller-Pertinent Process-Persistent Parameters

    //--
    //
    // PUBLIC
    //
    //--

    public class DTO
      {
      public string TextBox_username {get;set;}
      public string TextBox_nominal_password {get;set;}
      public string TextBox_confirmation_password {get;set;}
      public string TextBox_email_address {get;set;}
      }

    public NewUserRegistrationController() : base() // CONSTRUCTOR
      {
      p.biz_users = new TClass_biz_users();
      SessionSet(nameof(NewUserRegistrationController) + ".p", p);
      }

    public void Post(DTO dto)
      {
      var username = k.Safe(dto.TextBox_username, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM);
      p.biz_users.RegisterNew(username, k.Safe(dto.TextBox_nominal_password, k.safe_hint_type.HEX), k.Safe(dto.TextBox_email_address, k.safe_hint_type.EMAIL_ADDRESS));
      SessionSet("username", username);
      SessionSet("user_id", p.biz_users.IdOf(username));
      FormsAuthentication.RedirectFromLoginPage(username, false);
      }

    }
  }