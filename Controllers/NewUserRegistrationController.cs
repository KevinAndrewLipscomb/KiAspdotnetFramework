using ki_net_http;
using ki_web_http;
using kix;
using System;
using System.Configuration;
using System.Net;
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
      public Biz biz;
      }

    private p_type p; // Private Parcel of controller-Pertinent Process-Persistent Parameters

    private bool CustomValidator_email_address_domain_ServerValidate(DTO dto)
      {
      return k.BeValidDomainPartOfEmailAddress(dto.TextBox_email_address);
      }

    private bool CustomValidator_email_address_novelty_ServerValidate(DTO dto)
      {
      return !p.biz.users.BeRegisteredEmailAddress(k.Safe(dto.TextBox_email_address, k.safe_hint_type.EMAIL_ADDRESS));
      }

    private bool CustomValidator_username_ServerValidate(DTO dto)
      {
      return !p.biz.users.BeRegisteredUsername(k.Safe(dto.TextBox_username, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM));
      }

    private bool PageIsValid(DTO dto)
      {
      return CustomValidator_email_address_domain_ServerValidate(dto)
        && CustomValidator_email_address_novelty_ServerValidate(dto)
        && CustomValidator_username_ServerValidate(dto);
      }

    //--
    //
    // PUBLIC
    //
    //--

    public class DTO
      {
      public string Button_cancel {get;set;}
      public string Button_submit {get;set;}
      public string TextBox_confirmation_password {get;set;}
      public string TextBox_email_address {get;set;}
      public string TextBox_nominal_password {get;set;}
      public string TextBox_username {get;set;}
      }

    public NewUserRegistrationController() : base() // CONSTRUCTOR
      {
      p.biz = new();
      SessionSet(nameof(NewUserRegistrationController) + ".p", p);
      }

    public httpresponsemessage_class Post(DTO dto)
      {
      var response = new httpresponsemessage_class();
      if (dto.Button_submit != null)
        {
        if (PageIsValid(dto))
          {
          var username = k.Safe(dto.TextBox_username, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM);
          p.biz.users.RegisterNew(username, k.Safe(dto.TextBox_nominal_password, k.safe_hint_type.HEX), k.Safe(dto.TextBox_email_address, k.safe_hint_type.EMAIL_ADDRESS));
          SessionSet("username", username);
          SessionSet("user_id", p.biz.users.IdOf(username));
          //FormsAuthentication.RedirectFromLoginPage(username, false);
          FormsAuthentication.SetAuthCookie(userName:username, createPersistentCookie:false);
          response.StatusCode = HttpStatusCode.Found;
          response.Headers.Location = new Uri(uriString:"/" + ConfigurationManager.AppSettings["virtual_directory_name"] + "/protected/overview.aspx", uriKind:UriKind.Relative);
          }
        else
          {
          //ValidationAlert(true);
          }
        }
      else if (dto.Button_cancel != null)
        {
        response.StatusCode = HttpStatusCode.Found;
        response.Headers.Location = new Uri(uriString:"/" + ConfigurationManager.AppSettings["virtual_directory_name"] + "/login.aspx", uriKind:UriKind.Relative);
        }
      return response;
      }

    }
  }