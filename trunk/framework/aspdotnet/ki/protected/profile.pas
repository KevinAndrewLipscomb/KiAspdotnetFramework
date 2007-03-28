
unit profile;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, ki,
  Borland.Data.Common, System.Globalization,
  System.Data.Common, system.configuration, system.web.security,
  Class_biz_kind1s,
  UserControl_print_div;

type
  p_type =
    RECORD
    be_profile_initially_valid: boolean;
    biz_kind1s: Class_biz_kind1s.TClass_biz_kind1s;
    END;
  TWebForm_profile = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_submit_PreRender(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_password_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_email_address_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_kind1_overview_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    PlaceHolder_precontent: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_postcontent: System.Web.UI.WebControls.PlaceHolder;
    Label_kind1_name: System.Web.UI.WebControls.Label;
    TextBox_kind1_name: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_kind1_name: System.Web.UI.WebControls.RequiredFieldValidator;
    Button_submit: System.Web.UI.WebControls.Button;
    Label_application_name: System.Web.UI.WebControls.Label;
    RegularExpressionValidator_kind1_name: System.Web.UI.WebControls.RegularExpressionValidator;
    LinkButton_logout: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_password: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_email_address: System.Web.UI.WebControls.LinkButton;
    LinkButton_kind1_overview: System.Web.UI.WebControls.LinkButton;
    UserControl_print_div: TWebUserControl_print_div;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon,
  Class_biz_accounts;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_profile.InitializeComponent;
begin
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_kind1_overview.Click, Self.LinkButton_kind1_overview_Click);
  Include(Self.LinkButton_change_password.Click, Self.LinkButton_change_password_Click);
  Include(Self.LinkButton_change_email_address.Click, Self.LinkButton_change_email_address_Click);
  Include(Self.Button_submit.PreRender, Self.Button_submit_PreRender);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_profile.Page_Load(sender: System.Object; e: System.EventArgs);
var
  be_valid_profile: boolean;
  name: string;
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if IsPostback and (session['p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['p']);
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      session.Clear;
      server.Transfer('~/login.aspx');
    end;
    Title.InnerText := ConfigurationSettings.AppSettings['application_name'] + ' - profile';
    
    //
    p.biz_kind1s := TClass_biz_kind1s.Create;
    //
    // Set Label_kind1_name
    //
    Label_kind1_name.Text := session['kind1_name'].ToString;
    //
    // Set Label_application_name
    //
    Label_application_name.Text := ConfigurationSettings.AppSettings['application_name'];
    //
    //
    // Get profile
    //
    p.biz_kind1s.GetProfile
      (
      session['kind1_user_id'].ToString,
      name,
      be_valid_profile
      );
    TextBox_kind1_name.Text := name;
    p.be_profile_initially_valid := be_valid_profile;
  end;
end;

procedure TWebForm_profile.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_profile.LinkButton_kind1_overview_Click(sender: System.Object;
  e: System.EventArgs);
begin
   server.Transfer('kind1_overview.aspx');
end;

procedure TWebForm_profile.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_email_address.aspx');
end;

procedure TWebForm_profile.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_password.aspx');
end;

procedure TWebForm_profile.Button_submit_PreRender(sender: System.Object; e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

procedure TWebForm_profile.LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer('../Default.aspx');
end;

procedure TWebForm_profile.Button_submit_Click(sender: System.Object; e: System.EventArgs);
var
  kind1_name: string;
begin
  //
  kind1_name := Safe(TextBox_kind1_name.Text.trim,ORG_NAME);
  //
  // Commit the displayed data to the database.
  //
  p.biz_kind1s.SetProfile
    (
    session['kind1_user_id'].ToString,
    kind1_name
    );
  //
  if not p.be_profile_initially_valid then begin
    //
    // Perform actions that should only be done the first time the account becomes valid...
    //
  end;
  //
  server.Transfer('kind1_overview.aspx');
end;

end.

