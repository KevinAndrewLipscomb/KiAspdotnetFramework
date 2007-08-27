unit UserControl_member_binder;

interface

uses
  ki_web_ui,
  Microsoft.Web.UI.WebControls,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_about;
//  UserControl_resources,
//  UserControl_config

type
  p_type =
    RECORD
    be_loaded: boolean;
    tab_index: cardinal;
    END;
  TWebUserControl_member_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_member_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure TabStrip1_SelectedIndexChange(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TabStrip1: Microsoft.Web.UI.WebControls.TabStrip;
    MultiPage1: Microsoft.Web.UI.WebControls.MultiPage;
    PlaceHolder_content: System.Web.UI.WebControls.PlaceHolder;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_member_binder;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

const
  TSSI_RESOURCES = 0;
  TSSI_CONFIG = 1;
  TSSI_ABOUT = 2;

procedure TWebUserControl_member_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_member_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_member_binder.p'] <> nil)
    and (session['UserControl_member_binder.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_member_binder.p']);
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
//    TSSI_RESOURCES:
//      AddIdentifiedControlToPlaceHolder
//        (
//        TWebUserControl_resources(LoadControl('~/usercontrol/app/UserControl_resources.ascx')),
//        'UserControl_resources',
//        PlaceHolder_content
//        );
//    TSSI_CONFIG:
//      AddIdentifiedControlToPlaceHolder
//        (
//        TWebUserControl_config(LoadControl('~/usercontrol/app/UserControl_config.ascx')),
//        'UserControl_config',
//        PlaceHolder_content
//        );
    TSSI_ABOUT:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_about(LoadControl('~/usercontrol/app/UserControl_about.ascx')),
        'UserControl_about',
        PlaceHolder_content
        );
    end;
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := 0;
    //
//    AddIdentifiedControlToPlaceHolder
//      (
//      TWebUserControl_resources(LoadControl('~/usercontrol/app/UserControl_resources.ascx')).Fresh,
//      'UserControl_resources',
//      PlaceHolder_content
//      );
    //
  end;
  //
end;

procedure TWebUserControl_member_binder.TabStrip1_SelectedIndexChange(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabStrip1.selectedindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
//  TSSI_RESOURCES:
//    AddIdentifiedControlToPlaceHolder
//      (
//      TWebUserControl_resources(LoadControl('~/usercontrol/app/UserControl_resources.ascx')).Fresh,
//      'UserControl_resources',
//      PlaceHolder_content
//      );
//  TSSI_CONFIG:
//    AddIdentifiedControlToPlaceHolder
//      (
//      TWebUserControl_config(LoadControl('~/usercontrol/app/UserControl_config.ascx')).Fresh,
//      'UserControl_config',
//      PlaceHolder_content
//      );
  TSSI_ABOUT:
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_about(LoadControl('~/usercontrol/app/UserControl_about.ascx')).Fresh,
      'UserControl_about',
      PlaceHolder_content
      );
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_member_binder.InitializeComponent;
begin
  Include(Self.TabStrip1.SelectedIndexChange, Self.TabStrip1_SelectedIndexChange);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_member_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_member_binder.TWebUserControl_member_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_member_binder.p');
  session.Add('UserControl_member_binder.p',p);
end;

function TWebUserControl_member_binder.Fresh: TWebUserControl_member_binder;
begin
  session.Remove('UserControl_member_binder.p');
  Fresh := self;
end;

end.
