using kix;
using UserControl_my_roles_and_mappings;
using UserControl_role;
using UserControl_role_member_mapping;
using UserControl_role_notification_mapping;
using UserControl_role_privilege_mapping;

namespace UserControl_roles_and_matrices_binder
  {

  public partial class TWebUserControl_roles_and_matrices_binder: ki_web_ui.usercontrol_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private class Static
      {
      public const int TSSI_MINE = 0;
      public const int TSSI_ROLES = 1;
      public const int TSSI_ROLE_MEMBER_MAPPINGS = 2;
      public const int TSSI_ROLE_PRIVILEGE_MAPPINGS = 3;
      public const int TSSI_ROLE_NOTIFICATION_MAPPINGS = 4;
      }

    private struct p_type
      {
      public bool be_loaded;
      public string content_id;
      public uint tab_index;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void FillPlaceHolder
      (
      #pragma warning disable CA1801 // Remove unused parameter
      bool be_fresh_control_required,
      string target
      #pragma warning restore CA1801 // Remove unused parameter
      )
      {
      if (p.tab_index == Static.TSSI_MINE)
        {
        var c = ((TWebUserControl_my_roles_and_mappings)(LoadControl("~/usercontrol/app/UserControl_my_roles_and_mappings.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_my_roles_and_mappings",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_ROLES)
        {
        var c = ((TWebUserControl_role)(LoadControl("~/usercontrol/app/UserControl_role.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_role",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_ROLE_MEMBER_MAPPINGS)
        {
        var c = ((TWebUserControl_role_member_mapping)(LoadControl("~/usercontrol/app/UserControl_role_member_mapping.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_role_member_mapping",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_ROLE_PRIVILEGE_MAPPINGS)
        {
        var c = ((TWebUserControl_role_privilege_mapping)(LoadControl("~/usercontrol/app/UserControl_role_privilege_mapping.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_role_privilege_mapping",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_ROLE_NOTIFICATION_MAPPINGS)
        {
        var c = ((TWebUserControl_role_notification_mapping)(LoadControl("~/usercontrol/app/UserControl_role_notification_mapping.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_role_notification_mapping",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      }
    private void FillPlaceHolder(bool be_fresh_control_required)
      {
      FillPlaceHolder(be_fresh_control_required,k.EMPTY);
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
      PreRender += TWebUserControl_roles_and_matrices_binder_PreRender;
      }

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
        if (k.Has((string[])(Session["privilege_array"]), "config-roles-and-matrices"))
          {
          TabPanel_roles.Enabled = true;
          }
        p.be_loaded = true;
        }
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      FillPlaceHolder(true);
      }

    private void TWebUserControl_roles_and_matrices_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet(InstanceId() + ".p", p);
      }

    //--
    //
    // PROTECTED
    //
    //--

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_config_binder_roles_and_matrices_binder")
          {
          p.be_loaded &= ((Session["UserControl_member_binder_UserControl_config_binder_PlaceHolder_content"] as string) == "UserControl_roles_and_matrices_binder");
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_template_binder")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_template_binder");
//        }
        //
        // Dynamic controls must be re-added on each postback.
        //
        FillPlaceHolder(false);
        }
      else
        {
        p.be_loaded = false;
        //
        p.tab_index = Static.TSSI_MINE;
        FillPlaceHolder(true);
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TWebUserControl_roles_and_matrices_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    public void SetTarget(string target)
      {
      if (target.Length > 0)
        {
        if (target.ToLower().Contains("/mine/"))
          {
          p.tab_index = Static.TSSI_MINE;
          }
        else if (target.ToLower().Contains("/role/"))
          {
          p.tab_index = Static.TSSI_ROLES;
          }
        else if (target.ToLower().Contains("/role_member_mapping/"))
          {
          p.tab_index = Static.TSSI_ROLE_MEMBER_MAPPINGS;
          }
        else if (target.ToLower().Contains("/role_privilege_mapping/"))
          {
          p.tab_index = Static.TSSI_ROLE_PRIVILEGE_MAPPINGS;
          }
        else if (target.ToLower().Contains("/role_notification_mapping/"))
          {
          p.tab_index = Static.TSSI_ROLE_NOTIFICATION_MAPPINGS;
          }
        //
        TabContainer_control.ActiveTabIndex = (int)p.tab_index;
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_roles_and_matrices_binder

  }
