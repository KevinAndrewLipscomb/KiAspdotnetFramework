unit Class_biz_consolidated_crud;

interface

uses
  Class_db_consolidated_crud;

type
  TClass_biz_consolidated_crud = class
  private
    db_consolidated_crud: TClass_db_consolidated_crud;
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
{$REGION 'KiCrudHelper:GetDefinition'}{$ENDREGION}
      )
      : boolean;
    procedure &Set
      (
{$REGION 'KiCrudHelper:SetDefinition'}{$ENDREGION}
      );
  end;

implementation

constructor TClass_biz_consolidated_crud.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_consolidated_crud := TClass_db_consolidated_crud.Create;
end;

function TClass_biz_consolidated_crud.Bind
  (
  partial_ki_crud_helper_user_key: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_consolidated_crud.Bind(partial_ki_crud_helper_user_key,target);
end;

procedure TClass_biz_consolidated_crud.Delete(ki_crud_helper_user_key: string);
begin
  db_consolidated_crud.Delete(ki_crud_helper_user_key);
end;

function TClass_biz_consolidated_crud.Get
  (
{$REGION 'KiCrudHelper:GetDefinition'}{$ENDREGION}
  )
  : boolean;
begin
  //
  Get := db_consolidated_crud.Get
    (
{$REGION 'KiCrudHelper:GetSetCalls'}{$ENDREGION}
    );
  //
end;

procedure TClass_biz_consolidated_crud.&Set
  (
{$REGION 'KiCrudHelper:SetDefinition'}{$ENDREGION}
  );
begin
  //
  db_consolidated_crud.&Set
    (
{$REGION 'KiCrudHelper:GetSetCalls'}{$ENDREGION}
    );
  //
end;

end.
