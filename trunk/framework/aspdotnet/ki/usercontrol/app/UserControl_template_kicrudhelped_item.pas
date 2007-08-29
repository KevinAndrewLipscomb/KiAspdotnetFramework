unit UserControl_template_kicrudhelped_item;

interface

uses
  Class_biz_template_kicrudhelped_items,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_drop_down_date;

type
  p_type =
    RECORD
    be_loaded: boolean;
    biz_template_kicrudhelped_items: TClass_biz_template_kicrudhelped_items;
    END;
  TWebUserControl_template_kicrudhelped_item = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_template_kicrudhelped_item_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_search_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_reset_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_delete_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_ki_crud_helper_user_key_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Clear;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    function PresentRecord(ki_crud_helper_user_key: string): boolean;
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_delete: System.Web.UI.WebControls.Button;
    LinkButton_search: System.Web.UI.WebControls.LinkButton;
    LinkButton_reset: System.Web.UI.WebControls.LinkButton;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_template_kicrudhelped_item;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

procedure TWebUserControl_template_kicrudhelped_item.Clear;
begin
  //
//<KiCrudHelper:ClearStatements/>
  //
  Button_delete.enabled := FALSE;
  //
end;

procedure TWebUserControl_template_kicrudhelped_item.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    //
    RequireConfirmation(Button_delete,'Are you sure you want to delete this record?');
    //
    Focus(TextBox_ki_crud_helper_user_key);
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

function TWebUserControl_template_kicrudhelped_item.PresentRecord(ki_crud_helper_user_key: string): boolean;
var
//<KiCrudHelper:VarBlock/>
begin
  PresentRecord := FALSE;
  if p.biz_template_kicrudhelped_items.Get
    (
//<KiCrudHelper:GetSetCalls/>
    )
  then begin
    //
//<KiCrudHelper:PresentRecordAssignments/>
    //
    TextBox_ki_crud_helper_user_key.enabled := FALSE;
    Button_delete.enabled := TRUE;
    //
    PresentRecord := TRUE;
    //
  end;
end;

procedure TWebUserControl_template_kicrudhelped_item.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_template_kicrudhelped_item.p'] <> nil)
    and (session['UserControl_template_kicrudhelped_item.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_template_kicrudhelped_item.p']);
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.biz_customers := TClass_biz_customers.Create;
    p.biz_template_kicrudhelped_items := TClass_biz_template_kicrudhelped_items.Create;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_template_kicrudhelped_item.InitializeComponent;
begin
  Include(Self.LinkButton_search.Click, Self.LinkButton_search_Click);
  Include(Self.LinkButton_reset.Click, Self.LinkButton_reset_Click);
  Include(Self.DropDownList_ki_crud_helper_user_key.SelectedIndexChanged, Self.DropDownList_ki_crud_helper_user_key_SelectedIndexChanged);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_delete.Click, Self.Button_delete_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_template_kicrudhelped_item_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_template_kicrudhelped_item.TWebUserControl_template_kicrudhelped_item_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_template_kicrudhelped_item.p');
  session.Add('UserControl_template_kicrudhelped_item.p',p);
end;

function TWebUserControl_template_kicrudhelped_item.Fresh: TWebUserControl_template_kicrudhelped_item;
begin
  session.Remove('UserControl_template_kicrudhelped_item.p');
  Fresh := self;
end;

procedure TWebUserControl_template_kicrudhelped_item.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
var
  us_dollar_value: decimal;
begin
  if page.IsValid then begin
    //
    //
    p.biz_template_kicrudhelped_items.&Set
      (
//<KiCrudHelper:SubmitSet/>
      );
    Alert(USER,SUCCESS,'recsaved','Record saved.');
  end else begin
    ValidationAlert;
  end;
end;

procedure TWebUserControl_template_kicrudhelped_item.DropDownList_customer_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin

end;

procedure TWebUserControl_template_kicrudhelped_item.DropDownList_ki_crud_helper_user_key_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  PresentRecord(DropDownList_ki_crud_helper_user_key.selectedvalue);
end;

procedure TWebUserControl_template_kicrudhelped_item.Button_delete_Click(sender: System.Object;
  e: System.EventArgs);
begin
  p.biz_template_kicrudhelped_items.Delete(Safe(TextBox_ki_crud_helper_user_key.text,ALPHANUM));
  Clear;
end;

procedure TWebUserControl_template_kicrudhelped_item.LinkButton_reset_Click(sender: System.Object;
  e: System.EventArgs);
begin
  Clear;
  TextBox_ki_crud_helper_user_key.enabled := TRUE;
  Focus(TextBox_ki_crud_helper_user_key);
end;

procedure TWebUserControl_template_kicrudhelped_item.LinkButton_search_Click(sender: System.Object;
  e: System.EventArgs);
var
  num_matches: cardinal;
  saved_ki_crud_helper_user_key: string;
begin
  saved_ki_crud_helper_user_key := TextBox_ki_crud_helper_user_key.text;
  Clear;
  if not PresentRecord(saved_ki_crud_helper_user_key) then begin
    TextBox_ki_crud_helper_user_key.text := saved_ki_crud_helper_user_key;
    p.biz_template_kicrudhelped_items.Bind(saved_ki_crud_helper_user_key,DropDownList_ki_crud_helper_user_key);
    num_matches := DropDownList_ki_crud_helper_user_key.items.count;
    if num_matches > 0 then begin
      DropDownList_ki_crud_helper_user_key.visible := TRUE;
      if num_matches = 1 then begin
        PresentRecord(DropDownList_ki_crud_helper_user_key.selectedvalue);
      end else begin
        DropDownList_ki_crud_helper_user_key.items.Insert(0,listitem.Create('-- Select --',system.string.EMPTY));
      end;
    end;
  end;
end;

end.
