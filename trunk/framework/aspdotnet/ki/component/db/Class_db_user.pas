unit Class_db_user;

interface

uses
  ki,
  borland.data.provider,
  Class_db,
  system.collections;

type
  TClass_db_user = class(Class_db.TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function PrivilegesOf(id: string): ki.string_array;
    function RolesOf(id: string): ki.string_array;
  end;

implementation

constructor TClass_db_user.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_user.PrivilegesOf(id: string): ki.string_array;
var
  bdr: bdpdatareader;
  num_privileges: cardinal;
  privileges_of: ki.string_array;
  sql: string;
begin
  if id <> '1' then begin
    sql :=
    'select distinct name'
    + ' from privilege'
    +   ' join role_privilege_map on (role_privilege_map.privilege_id=privilege.id)'
    +   ' join role_user_map on (role_user_map.role_id=role_privilege_map.role_id)'
    + ' where user_id = ' + id;
  end else begin
    sql := 'select name from privilege';
  end;
  self.Open;
  bdr := bdpcommand.Create(sql,connection).ExecuteReader;
  num_privileges := 0;
  while bdr.Read do begin
    num_privileges := num_privileges + 1;
    SetLength(privileges_of,num_privileges);
    privileges_of[num_privileges - 1] := bdr['name'].tostring;
  end;
  bdr.Close;
  self.Close;
  PrivilegesOf := privileges_of;
end;

function TClass_db_user.RolesOf(id: string): ki.string_array;
var
  bdr: bdpdatareader;
  num_roles: cardinal;
  roles_of: ki.string_array;
begin
  self.Open;
  bdr := bdpcommand.Create
    (
    'select name from role join role_user_map on (role_user_map.role_id=role.id) where role_user_map.user_id = ' + id,
    connection
    )
    .ExecuteReader;
  num_roles := 0;
  while bdr.Read do begin
    num_roles := num_roles + 1;
    SetLength(roles_of,num_roles);
    roles_of[num_roles - 1] := bdr['name'].tostring;
  end;
  bdr.Close;
  self.Close;
  RolesOf := roles_of;
end;

end.
