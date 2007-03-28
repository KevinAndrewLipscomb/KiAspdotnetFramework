
unit kind1_overview;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, ki,
  System.Data.Common, Borland.Data.Provider, System.Globalization,
  Borland.Data.Common, system.configuration, system.web.security,
  Class_biz_accounts,
  Class_biz_kind1s,
  Class_biz_user,
  UserControl_print_div;

type
  p_type =
    RECORD
    biz_accounts: TClass_biz_accounts;
    biz_kind1s: TClass_biz_kind1s;
    biz_user: TClass_biz_user;
    END;
  TWebForm_kind1_overview = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure LinkButton_profile_action_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_password_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_email_address_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure TWebForm_kind1_overview_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    PlaceHolder_precontent: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_postcontent: System.Web.UI.WebControls.PlaceHolder;
    Label_kind1_name: System.Web.UI.WebControls.Label;
    Label_profile_status: System.Web.UI.WebControls.Label;
    LinkButton_profile_action: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_password: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_email_address: System.Web.UI.WebControls.LinkButton;
    LinkButton_logout: System.Web.UI.WebControls.LinkButton;
    UserControl_print_div: TWebUserControl_print_div;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
  end;

implementation

uses
  appcommon;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_kind1_overview.InitializeComponent;
begin
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_change_password.Click, Self.LinkButton_change_password_Click);
  Include(Self.LinkButton_change_email_address.Click, Self.LinkButton_change_email_address_Click);
  Include(Self.LinkButton_profile_action.Click, Self.LinkButton_profile_action_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_kind1_overview_PreRender);
end;
{$ENDREGION}

procedure TWebForm_kind1_overview.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if IsPostback and (session['p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['p']);
  end else begin
    if (session['kind1_user_id'] = nil) or (session['kind1_name'] = nil) then begin
      session.Clear;
      server.Transfer('~/login.aspx');
    end;
    //
    p.biz_accounts := TClass_biz_accounts.Create;
    p.biz_kind1s := TClass_biz_kind1s.Create;
    p.biz_user := TClass_biz_user.Create;
    //
    if p.biz_accounts.BeStalePassword(p.biz_user.Kind,p.biz_user.IdNum) then begin
      server.Transfer('change_password.aspx');
    end;
    //
    Title.InnerText := ConfigurationSettings.AppSettings['application_name'] + ' - kind1_overview';
    
    //
    // Set Label_kind1_name
    //
    Label_kind1_name.Text := session['kind1_name'].ToString;
    //
    // Set Label_profile_status
    //
    if not p.biz_kind1s.BeValidProfile(p.biz_user.IdNum) then begin
      Label_profile_status.Text := 'Not saved.';
      LinkButton_profile_action.Text := '[Create profile]';
    end else begin
      Label_profile_status.Text := 'Saved.';
      LinkButton_profile_action.Text := '[Edit profile]';
    end;
  end;
end;

procedure TWebForm_kind1_overview.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_kind1_overview.TWebForm_kind1_overview_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

procedure TWebForm_kind1_overview.LinkButton_logout_Click(sender: System.Object;
  e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer('../Default.aspx');
end;

procedure TWebForm_kind1_overview.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_email_address.aspx');
end;

procedure TWebForm_kind1_overview.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_password.aspx');
end;

procedure TWebForm_kind1_overview.LinkButton_profile_action_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('profile.aspx');
end;

end.

