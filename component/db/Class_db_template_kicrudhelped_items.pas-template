unit Class_db_template_kicrudhelped_items;

interface

uses
  Class_db,
  Class_db_trail;

type
  TClass_db_template_kicrudhelped_items = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    function Bind
      (
      partial_ki_crud_helper_user_key: string;
      target: system.object
      )
      : boolean;
    procedure Delete(ki_crud_helper_user_key: string);
    function Get
      (
//<KiCrudHelper:GetDefinition/>
      )
      : boolean;
    procedure &Set
      (
//<KiCrudHelper:SetDefinition/>
      );
  end;

implementation

uses
  borland.data.provider,
  system.web.ui.webcontrols;

constructor TClass_db_template_kicrudhelped_items.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_template_kicrudhelped_items.Bind
  (
  partial_ki_crud_helper_user_key: string;
  target: system.object
  )
  : boolean;
var
  bdr: bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  //
  bdr := bdpcommand.Create
    (
    'SELECT ki_crud_helper_user_key FROM template_kicrudhelped_item WHERE ki_crud_helper_user_key like "' + partial_ki_crud_helper_user_key + '%" order by ki_crud_helper_user_key',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add
      (listitem.Create(bdr['ki_crud_helper_user_key'].tostring,bdr['ki_crud_helper_user_key'].tostring));
  end;
  bdr.Close;
  self.Close;
  Bind := DropDownList(target).items.count > 0;
end;

procedure TClass_db_template_kicrudhelped_items.Delete(ki_crud_helper_user_key: string);
begin
  self.Open;
  bdpcommand.Create(db_trail.Saved('delete from template_kicrudhelped_item where ki_crud_helper_user_key = ' + ki_crud_helper_user_key),connection).ExecuteNonquery;
  self.Close;
end;

function TClass_db_template_kicrudhelped_items.Get
  (
//<KiCrudHelper:GetDefinition/>
  )
  : boolean;
var
  bdr: bdpdatareader;
begin
  Get := FALSE;
  self.Open;
  bdr := bdpcommand.Create('select * from template_kicrudhelped_item where ki_crud_helper_user_key = "' + ki_crud_helper_user_key + '"',connection).ExecuteReader;
  if bdr.Read then begin
    //
//<KiCrudHelper:DbGetBody/>
    //
    Get := TRUE;
    //
  end;
  bdr.Close;
  self.Close;
end;

procedure TClass_db_template_kicrudhelped_items.&Set
  (
//<KiCrudHelper:SetDefinition/>
  );
begin
  self.Open;
  bdpcommand.Create
    (
    db_trail.Saved
      (
      'replace template_kicrudhelped_item'
//<KiCrudHelper:DbSetBody/>
      ),
    connection
    )
    .ExecuteNonquery;
  self.Close;
end;

end.
