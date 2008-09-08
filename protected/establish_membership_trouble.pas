unit establish_membership_trouble;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  Class_biz_notifications,
  Class_biz_user,
  ki_web_ui,
  UserControl_print_div, sstchur.web.SmartNav;

type
  p_type =
    RECORD
    biz_notifications: TClass_biz_notifications;
    biz_user: TClass_biz_user;
    END;
  TWebForm_establish_membership_trouble = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_establish_membership_trouble_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  //
  // Expected session objects:
  //
  //   waypoint_stack: system.collections.stack;
  //
  //
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlTitle;
    UserControl_print_div: TWebUserControl_print_div;
    TextBox_full_name: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_full_name: System.Web.UI.WebControls.RequiredFieldValidator;
    Label_sponsor_1: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    Label_sponsor_2: System.Web.UI.WebControls.Label;
    Label_application_name_1: System.Web.UI.WebControls.Label;
    Label_application_name_3: System.Web.UI.WebControls.Label;
    Label_application_name_2: System.Web.UI.WebControls.Label;
    TextBox_explanation: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_explanation: System.Web.UI.WebControls.RequiredFieldValidator;
    Button_cancel: System.Web.UI.WebControls.Button;
    SmartScroller_control: sstchur.web.SmartNav.SmartScroller;
  protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  kix;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_establish_membership_trouble.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.PreRender, Self.TWebForm_establish_membership_trouble_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_establish_membership_trouble.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    //
    Title.text := server.HtmlEncode(configurationmanager.appsettings['application_name']) + ' - establish_membership_trouble';
    //
    Label_sponsor_1.text := configurationmanager.appsettings['sponsor'];
    Label_sponsor_2.text := configurationmanager.appsettings['sponsor'];
    Label_application_name_1.text := configurationmanager.appsettings['application_name'];
    Label_application_name_2.text := configurationmanager.appsettings['application_name'];
    Label_application_name_3.text := configurationmanager.appsettings['application_name'];
    //
    Focus(TextBox_full_name,TRUE);
    //
  end;
end;

procedure TWebForm_establish_membership_trouble.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  case NatureOfVisit('establish_membership_trouble.p') of
  VISIT_INITIAL:
    BEGIN
    p.biz_notifications := TClass_biz_notifications.Create;
    p.biz_user := TClass_biz_user.Create;
    END;
  VISIT_POSTBACK_STANDARD:
    BEGIN
    p := p_type(session['establish_membership_trouble.p']);
    END;
  end;
  //
end;

procedure TWebForm_establish_membership_trouble.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  BackTrack;
end;

procedure TWebForm_establish_membership_trouble.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.biz_notifications.IssueForMembershipEstablishmentTrouble
    (
    Safe(TextBox_full_name.text,HUMAN_NAME),
    Safe(TextBox_explanation.text,PUNCTUATED)
    );
  session.Clear;
  server.Transfer('~/login.aspx');
end;

procedure TWebForm_establish_membership_trouble.TWebForm_establish_membership_trouble_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('establish_membership_trouble.p',p);
end;

end.

