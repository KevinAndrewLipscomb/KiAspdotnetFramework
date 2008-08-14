unit Class_biz_roles;

interface

uses
  Class_db_roles,
  kix;

type
  TClass_biz_roles = class
  private
    db_roles: TClass_db_roles;
  public
    constructor Create;
    function Bind
      (
      partial_name: string;
      target: system.object
      )
      : boolean;
    procedure BindDirectToListControl
      (
      target: system.object;
      has_config_roles_and_matrices: boolean;
      unselected_literal: string = '-- Role --';
      selected_value: string = EMPTY
      );
    function Delete(name: string): boolean;
    function Get
      (
      name: string;
      out soft_hyphenation_text: string;
      out pecking_order: string
      )
      : boolean;
    function NameOfId(id: string): string;
    procedure &Set
      (
      name: string;
      soft_hyphenation_text: string;
      pecking_order: string
      );
  end;

implementation

constructor TClass_biz_roles.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_roles := TClass_db_roles.Create;
end;

function TClass_biz_roles.Bind
  (
  partial_name: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_roles.Bind(partial_name,target);
end;

procedure TClass_biz_roles.BindDirectToListControl
  (
  target: system.object;
  has_config_roles_and_matrices: boolean;
  unselected_literal: string = '-- Role --';
  selected_value: string = EMPTY
  );
begin
  db_roles.BindDirectToListControl(target,has_config_roles_and_matrices,unselected_literal,selected_value);
end;

function TClass_biz_roles.Delete(name: string): boolean;
begin
  Delete := db_roles.Delete(name);
end;

function TClass_biz_roles.Get
  (
  name: string;
  out soft_hyphenation_text: string;
  out pecking_order: string
  )
  : boolean;
begin
  //
  Get := db_roles.Get
    (
    name,
    soft_hyphenation_text,
    pecking_order
    );
  //
end;

function TClass_biz_roles.NameOfId(id: string): string;
begin
  NameOfId := db_roles.NameOfId(id);
end;

procedure TClass_biz_roles.&Set
  (
  name: string;
  soft_hyphenation_text: string;
  pecking_order: string
  );
begin
  //
  db_roles.&Set
    (
    name,
    soft_hyphenation_text,
    pecking_order
    );
  //
end;

end.
