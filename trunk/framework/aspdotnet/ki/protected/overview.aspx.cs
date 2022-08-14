using Class_biz_subjoined_attributes;
using KiAspdotnetFramework;
using System;
using System.Configuration;
using UserControl_capture_subjoined_attributes;
using UserControl_establish_membership;
using UserControl_member_binder;

namespace overview
  {

  public partial class TWebForm_overview: ki_web_ui.page_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private struct p_type
      {
      public Biz biz;
      public TClass_biz_subjoined_attributes biz_subjoined_attributes;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_overview_PreRender;
      }

    private void TWebForm_overview_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    //--
    //
    // PROTECTED
    //
    //--

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      if (NatureOfLanding(InstanceId() + ".p") == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      else if (NatureOfLanding(InstanceId() + ".p") == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz = new();
        p.biz_subjoined_attributes = new TClass_biz_subjoined_attributes();
        //
        BeginBreadCrumbTrail();
        if (p.biz.users.BeStalePassword(p.biz.user.IdNum()))
          {
          DropCrumbAndTransferTo("change_password.aspx");
          }
        SessionSet("privilege_array", p.biz.user.Privileges());
        if ((Session["privilege_array"] != null))
          {
          SessionSet("member_id", p.biz.members.IdOfUserId(Session["user_id"].ToString()));
          }
        }
      //
      if (p.biz.members.IdOfUserId(p.biz.user.IdNum()).Length == 0)
        {
        // Display controls appropriate ONLY to nonmembers.
        AddIdentifiedControlToPlaceHolder(((TWebUserControl_establish_membership)(LoadControl("~/usercontrol/app/UserControl_establish_membership.ascx"))), "UserControl_establish_membership", PlaceHolder_control);
        }
      else if(p.biz_subjoined_attributes.BeAnyImplementedSince(p.biz.user.LastLoginTime()))
        {
        AddIdentifiedControlToPlaceHolder(((TWebUserControl_capture_subjoined_attributes)(LoadControl("~/usercontrol/app/UserControl_capture_subjoined_attributes.ascx"))), "UserControl_capture_subjoined_attributes", PlaceHolder_control);
        }
      else
        {
        AddIdentifiedControlToPlaceHolder(((TWebUserControl_member_binder)(LoadControl("~/usercontrol/app/UserControl_member_binder.ascx"))), "UserControl_member_binder", PlaceHolder_control);
        }
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - overview";
      if (!IsPostBack)
        {
        }
//
// ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
//
      }

    } // end TWebForm_overview

  }
