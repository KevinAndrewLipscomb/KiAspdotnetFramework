unit UserControl_template_tabstripped_multipage;

interface

uses
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls, Microsoft.Web.UI.WebControls;

type
  p_type =
    RECORD
    END;
  TWebUserControl_template_tabstripped_multipage = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_template_tabstripped_multipage_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TabStrip1: Microsoft.Web.UI.WebControls.TabStrip;
    MultiPage1: Microsoft.Web.UI.WebControls.MultiPage;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

procedure TWebUserControl_template_tabstripped_multipage.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not IsPostback then begin
    //
    // Display controls appropriate to user's privileges.
    //
    if Has(string_array(session['privilege_array']),'see-roster') then begin
      //
      //
    end;
    //
  end;
  //
end;

procedure TWebUserControl_template_tabstripped_multipage.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback and (session['UserControl_template_tabstripped_multipage.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['UserControl_template_tabstripped_multipage.p']);
  end else begin
    //
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_template_tabstripped_multipage.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_template_tabstripped_multipage_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_template_tabstripped_multipage.TWebUserControl_template_tabstripped_multipage_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_template_tabstripped_multipage.p');
  session.Add('UserControl_template_tabstripped_multipage.p',p);
end;

end.
