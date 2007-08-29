unit Class_biz_kicrudhelped_items;

interface

uses
  Class_db_kicrudhelped_items;

type
  TClass_biz_kicrudhelped_items = class
  private
    db_kicrudhelped_items: TClass_db_kicrudhelped_items;
  public
    constructor Create;
    function Bind
      (
      partial_username: string;
      target: system.object
      )
      : boolean;
    procedure Delete(username: string);
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

constructor TClass_biz_kicrudhelped_items.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_kicrudhelped_items := TClass_db_kicrudhelped_items.Create;
end;

function TClass_biz_kicrudhelped_items.Bind
  (
  partial_username: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_kicrudhelped_items.Bind(partial_username,target);
end;

procedure TClass_biz_kicrudhelped_items.Delete(username: string);
begin
  db_kicrudhelped_items.Delete(username);
end;

function TClass_biz_kicrudhelped_items.Get
  (
//<KiCrudHelper:GetDefinition/>
  )
  : boolean;
begin
  //
  Get := db_kicrudhelped_items.Get
    (
//<KiCrudHelper:GetSetCalls/>
    );
  //
end;

procedure TClass_biz_kicrudhelped_items.&Set
  (
//<KiCrudHelper:SetDefinition/>
  );
begin
  //
  db_kicrudhelped_items.&Set
    (
//<KiCrudHelper:GetSetCalls/>
    );
  //
end;

end.
