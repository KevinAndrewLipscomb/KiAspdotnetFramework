
unit kind3_overview;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, ki, system.configuration, borland.data.provider,
  system.web.security,
  Class_db;

const ID = '$Id$';

type
  p_type =
    RECORD
    db: TClass_db;
    END;
  TWebForm_kind3_overview = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure Button_continue_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_password_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_email_address_Click(sender: System.Object; e: System.EventArgs);
    procedure TWebForm_kind3_overview_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    PlaceHolder_precontent: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_postcontent: System.Web.UI.WebControls.PlaceHolder;
    Label_kind3_name: System.Web.UI.WebControls.Label;
    RadioButtonList_appropriation: System.Web.UI.WebControls.RadioButtonList;
    Button_continue: System.Web.UI.WebControls.Button;
    RequiredFieldValidator_appropriation: System.Web.UI.WebControls.RequiredFieldValidator;
    Label_literal_kind3: System.Web.UI.WebControls.Label;
    LinkButton_logout: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_password: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_email_address: System.Web.UI.WebControls.LinkButton;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_kind3_overview.InitializeComponent;
begin
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_change_password.Click, Self.LinkButton_change_password_Click);
  Include(Self.LinkButton_change_email_address.Click, Self.LinkButton_change_email_address_Click);
  Include(Self.Button_continue.Click, Self.Button_continue_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_kind3_overview_PreRender);
end;
{$ENDREGION}

procedure TWebForm_kind3_overview.Page_Load(sender: System.Object; e: System.EventArgs);
var
  bdr: borland.data.provider.BdpDataReader;
  kind3_user_email_address: string;
  max_fiscal_year_id_string: string;
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if IsPostback and (session['p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['p']);
  end else begin
    if (session['kind3_user_id'] = nil) or (session['kind3_name'] = nil) then begin
      session.Clear;
      server.Transfer('~/login.aspx');
    end;
    Title.InnerText := ConfigurationSettings.AppSettings['application_name'] + ' - kind3_overview';
    p.db := TClass_db.Create;
    //
    Label_kind3_name.Text := session['kind3_name'].ToString;
    //
    p.db.Open;
    bdr := Borland.Data.Provider.BdpCommand.Create
      (
      'SELECT be_stale_password, password_reset_email_address FROM kind3_user'
      + ' where id = ' + session['kind3_user_id'].tostring,
      p.db.connection
      )
      .ExecuteReader;
    bdr.Read;
    if bdr['be_stale_password'].ToString = '0' then begin
      //
      // Get anything else needed from this reader, then close it.  We have another reader to open, and only one can be open at a
      // time.
      //
      kind3_user_email_address := bdr['password_reset_email_address'].tostring;
      bdr.Close;
      //
      // Where we go next depends on how many appropriations have been made to this kind3.
      //
      // Determine current fiscal year
      //
      max_fiscal_year_id_string := borland.data.provider.bdpcommand.Create
        (
        'SELECT max(id) as max_id FROM fiscal_year',
        p.db.connection
        )
        .ExecuteScalar.tostring;
      //
      bdr := borland.data.provider.bdpcommand.Create
        (
        'SELECT region_dictated_appropriation.id,'
        + ' concat("$",format(region_dictated_appropriation.amount,2)," from the ",name," ",designator," contract (amendment ",amendment_num,")")'
        +   ' as appropriation_description'
        + ' FROM region_dictated_appropriation'
        +   ' JOIN state_dictated_appropriation on (state_dictated_appropriation.id=state_dictated_appropriation_id)'
        +   ' JOIN region_code_name_map on (region_code_name_map.code=region_code)'
        +   ' JOIN fiscal_year on (fiscal_year.id = fiscal_year_id)'
        + ' WHERE kind3_code = ' + session['kind3_user_id'].ToString
        +   ' and fiscal_year_id = ' + max_fiscal_year_id_string,
        p.db.connection
        )
        .ExecuteReader;
      while bdr.Read do begin
        RadioButtonList_appropriation.Items.Add(listitem.Create(bdr['appropriation_description'].tostring,bdr['id'].ToString));
      end;
      bdr.Close;
      p.db.Close;
      if RadioButtonList_appropriation.items.Count = 0 then begin
        server.Transfer('no_appropriation.aspx');
      end else begin
        //
        // Add the kind3's email address to the session, as it will be needed by kind3_dictated_appropriations however we
        // get there.
        //
        session.Remove('kind3_user_password_reset_email_address');
        session.Add('kind3_user_password_reset_email_address',kind3_user_email_address);
        if RadioButtonList_appropriation.items.Count = 1 then begin
          session.Remove('region_dictated_appropriation_id');
          session.Add('region_dictated_appropriation_id',RadioButtonList_appropriation.items[0].value);
          server.Transfer('kind3_dictated_appropriations.aspx');
        end;
      end;
    end else begin
      bdr.Close;
      p.db.Close;
      server.Transfer('change_password.aspx');
    end;
  end;
end;

procedure TWebForm_kind3_overview.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_kind3_overview.TWebForm_kind3_overview_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

procedure TWebForm_kind3_overview.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_email_address.aspx');
end;

procedure TWebForm_kind3_overview.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_password.aspx');
end;

procedure TWebForm_kind3_overview.LinkButton_logout_Click(sender: System.Object;
  e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer('../Default.aspx');
end;

procedure TWebForm_kind3_overview.Button_continue_Click(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('region_dictated_appropriation_id');
  session.Add('region_dictated_appropriation_id',Safe(RadioButtonList_appropriation.SelectedValue,NUM));
  server.Transfer('kind3_dictated_appropriations.aspx');
end;

end.

