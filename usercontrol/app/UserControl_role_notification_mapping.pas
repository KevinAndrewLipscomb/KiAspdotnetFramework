unit UserControl_role_notification_mapping;

interface

uses
  Class_biz_notifications,
  Class_biz_role_notification_map,
  Class_biz_roles,
  ki_web_ui,
  System.Collections,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  p_type =
    RECORD
    be_interactive: boolean;
    be_loaded: boolean;
    be_sort_order_ascending: boolean;
    biz_notifications: TClass_biz_notifications;
    biz_role_notification_map: TClass_biz_role_notification_map;
    biz_roles: TClass_biz_roles;
    may_add_mappings: boolean;
    sort_order: string;
    END;
  TWebUserControl_role_notification_mapping = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_role_notification_mapping_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure GridView_control_Sorting(sender: System.Object; e: System.Web.UI.WebControls.GridViewSortEventArgs);
    procedure Button_add_Click(sender: System.Object; e: System.EventArgs);
    procedure GridView_control_RowDataBound(sender: System.Object; e: System.Web.UI.WebControls.GridViewRowEventArgs);
    procedure GridView_control_RowDeleting(sender: System.Object; e: System.Web.UI.WebControls.GridViewDeleteEventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
    procedure InjectPersistentClientSideScript;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    GridView_control: System.Web.UI.WebControls.GridView;
    Button_add: System.Web.UI.WebControls.Button;
    DropDownList_role: System.Web.UI.WebControls.DropDownList;
    DropDownList_notification: System.Web.UI.WebControls.DropDownList;
    RequiredFieldValidator_role: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_notification: System.Web.UI.WebControls.RequiredFieldValidator;
    TableCell_add_mapping: System.Web.UI.HtmlControls.HtmlTableCell;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_role_notification_mapping;
  end;

implementation

uses
  kix,
  system.configuration;

const
  CI_UNMAP = 0;
  CI_ROLE_ID = 1;
  CI_ROLE_PECKING_ORDER = 2;
  CI_ROLE_NAME = 3;
  CI_NOTIFICATION_NAME = 4;
  CI_NOTIFICATION_ID = 5;
  INITIAL_SORT_ORDER = 'role_pecking_order%,notification_name';

procedure TWebUserControl_role_notification_mapping.InjectPersistentClientSideScript;
begin
{$REGION 'Persistent client-side script'}
//  EstablishClientSideFunction(EL);
//  EstablishClientSideFunction(KGS_TO_LBS);
//  EstablishClientSideFunction(LBS_TO_KGS);
//  EstablishClientSideFunction
//    (
//    'RecalculateDependentValues()',
//    EMPTY
//    + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
//    +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
//    + NEW_LINE
//    + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
//    );
//  //
//  TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
//  TextBox_gross_landed_weight_in_pounds.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_gross_landed_weight_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_landed_or_ciq_tare.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_net_landed_in_pounds.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_net_landed_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
{$ENDREGION}
end;

procedure TWebUserControl_role_notification_mapping.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    if not p.be_interactive then begin
      GridView_control.allowsorting := FALSE;
    end;
    //
    Bind;
    //
    p.be_loaded := TRUE;
    //
  end else begin
    //
    //
  end;
  //
  InjectPersistentClientSideScript;
  //
end;

procedure TWebUserControl_role_notification_mapping.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_role_notification_mapping.p'] <> nil then begin
    //
    p := p_type(session['UserControl_role_notification_mapping.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_config_UserControl_roles_and_matrices_binder_PlaceHolder_content']) = 'UserControl_role_notification_mapping');
    //
  end else begin
    //
    p.biz_notifications := TClass_biz_notifications.Create;
    p.biz_role_notification_map := TClass_biz_role_notification_map.Create;
    p.biz_roles := TClass_biz_roles.Create;
    //
    p.be_interactive := not assigned(session['mode:report']);
    p.be_loaded := FALSE;
    p.be_sort_order_ascending := TRUE;
    p.may_add_mappings := Has(string_array(session['privilege_array']),'config-roles-and-matrices');
    p.sort_order := INITIAL_SORT_ORDER;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_role_notification_mapping.InitializeComponent;
begin
  Include(Self.GridView_control.Sorting, Self.GridView_control_Sorting);
  Include(Self.GridView_control.RowDataBound, Self.GridView_control_RowDataBound);
  Include(Self.GridView_control.RowDeleting, Self.GridView_control_RowDeleting);
  Include(Self.Button_add.Click, Self.Button_add_Click);
  Include(Self.PreRender, Self.TWebUserControl_role_notification_mapping_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_role_notification_mapping.TWebUserControl_role_notification_mapping_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_role_notification_mapping.p',p);
end;

function TWebUserControl_role_notification_mapping.Fresh: TWebUserControl_role_notification_mapping;
begin
  session.Remove('UserControl_role_notification_mapping.p');
  Fresh := self;
end;

procedure TWebUserControl_role_notification_mapping.GridView_control_RowDeleting(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewDeleteEventArgs);
begin
  p.biz_role_notification_map.Save
    (
    Safe(GridView_control.rows[e.rowindex].cells[CI_NOTIFICATION_ID].text,NUM),
    Safe(GridView_control.rows[e.rowindex].cells[CI_ROLE_ID].text,NUM),
    FALSE
    );
  Bind;
end;

procedure TWebUserControl_role_notification_mapping.GridView_control_RowDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewRowEventArgs);
var
  be_ok_to_delete: boolean;
begin
  if e.row.rowtype <> datacontrolrowtype.EMPTYDATAROW then begin
    be_ok_to_delete := p.be_interactive and Has(string_array(session['privilege_array']),'config-roles-and-matrices');
    if be_ok_to_delete then begin
// Appears to clobber a necessary ASP.NET onclick event.  Should probably use AJAX instead.
//      RequireConfirmation
//        (
//        ImageButton(e.row.cells[CI_UNMAP].controls[0]),
//        'Are you sure you want to unmap the ' + e.row.cells[CI_ROLE_NAME].text + ' role from notification '
//        + e.row.cells[CI_NOTIFICATION_NAME].text + '?' + NEW_LINE
//        + NEW_LINE
//        + 'Clicking Ok will prevent role holders from receiving the notifications.'
//        );
    end else begin
      e.row.cells[CI_UNMAP].enabled := FALSE;
      e.row.cells[CI_UNMAP].text := EMPTY;
    end;
    e.row.cells[CI_ROLE_ID].visible := FALSE;
    e.row.cells[CI_ROLE_PECKING_ORDER].visible := FALSE;
    e.row.cells[CI_NOTIFICATION_ID].visible := FALSE;
  end;
end;

procedure TWebUserControl_role_notification_mapping.Button_add_Click(sender: System.Object;
  e: System.EventArgs);
begin
  p.biz_role_notification_map.Save(Safe(DropDownList_notification.selectedvalue,NUM),Safe(DropDownList_role.selectedvalue,NUM),TRUE);
  Bind;
end;

procedure TWebUserControl_role_notification_mapping.GridView_control_Sorting(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewSortEventArgs);
begin
  if e.SortExpression = p.sort_order then begin
    p.be_sort_order_ascending := not p.be_sort_order_ascending;
  end else begin
    p.sort_order := e.SortExpression;
    p.be_sort_order_ascending := TRUE;
  end;
  GridView_control.editindex := -1;
  Bind;
end;

procedure TWebUserControl_role_notification_mapping.Bind;
begin
  //
  p.biz_role_notification_map.BindActuals(p.sort_order,p.be_sort_order_ascending,GridView_control);
  //
  TableCell_add_mapping.visible := p.may_add_mappings;
  if TableCell_add_mapping.visible then begin
    p.biz_roles.BindDirectToListControl
      (
      DropDownList_role,
      Has(string_array(session['privilege_array']),'config-roles-and-matrices')
      );
    p.biz_notifications.BindDirectToListControl(DropDownList_notification);
  end;
  //
end;

end.
