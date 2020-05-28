using Class_biz_user;
using System;
using System.Web;
using System.Web.Security;

#pragma warning disable CA1716
namespace Global
  {
  public class TGlobal: HttpApplication
    {

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    public TGlobal() : base()
      {
      InitializeComponent();
      }

    protected void Application_Start(object sender, EventArgs e)
      {
      }

    protected void Session_Start(object sender, EventArgs e)
      {
      if (HttpContext.Current.Request.IsAuthenticated)
        {
        //
        // The user is logged in.  We must log the user out since their stored session has been replaced with an empty new one.
        //
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
        }
      }

    protected void Application_BeginRequest(object sender, EventArgs e)
      {
      }

    protected void Application_EndRequest(object sender, EventArgs e)
      {
      }

    protected void Application_AuthenticateRequest(object sender, EventArgs e)
      {
      if (Request.IsAuthenticated)
        {
        HttpContext.Current.User = new System.Security.Principal.GenericPrincipal
          (
          identity:User.Identity,
          roles:new TClass_biz_user().Roles()
          );
        }
      }

    protected void Application_Error(object sender, EventArgs e)
      {
      Server.Transfer(path:"~/exception.aspx");
      }

    protected void Session_End(object sender, EventArgs e)
      {
      }

    protected void Application_End(object sender, EventArgs e)
      {
      }

    } // end TGlobal

  }
