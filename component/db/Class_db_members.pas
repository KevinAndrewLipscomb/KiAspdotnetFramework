unit Class_db_members;

interface

uses
  mysql.data.mysqlclient,
  Class_db,
  Class_db_trail,
  system.web.ui.webcontrols;

//const
//  TCCI_ID = 0;
//  TCCI_LAST_NAME = 1;
//  TCCI_FIRST_NAME = 2;
//  TCCI_CAD_NUM = 3;
//  TCCI_SECTION_NUM = 4;
//  TCCI_MEDICAL_RELEASE_PECK_CODE = 5;
//  TCCI_MEDICAL_RELEASE_LEVEL = 6;
//  TCCI_BE_DRIVER_QUALIFIED = 7;
//  TCCI_ENROLLMENT = 8;
//  TCCI_ENROLLMENT_OBLIGATION = 9;
//  TCCI_LEAVE = 10;
//  TCCI_OBLIGED_SHIFTS = 11;
//  TCCI_EMAIL_ADDRESS = 12;

type
  TClass_db_members = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
//    procedure Add
//      (
//      attributes..
//      );
//    function BeKnown
//      (
//      attributes..
//      )
//      : boolean;
    function BeValidProfile(id: string): boolean;
    function EmailAddressOf(member_id: string): string;
    function IdOfUserId(user_id: string): string;
    procedure SetEmailAddress
      (
      id: string;
      email_address: string
      );
    function UserIdOf(member_id: string): string;
  end;

implementation

uses
  kix,
  system.web.ui.HtmlControls;

constructor TClass_db_members.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_members.BeValidProfile(id: string): boolean;
begin
  self.Open;
  BeValidProfile :=
    ('1' = mysqlCommand.Create('select be_valid_profile from member where id = ' + id,connection).ExecuteScalar.tostring);
  self.Close;
end;

function TClass_db_members.EmailAddressOf(member_id: string): string;
var
  email_address_obj: system.object;
begin
  //
  self.Open;
  email_address_obj :=
    mysqlcommand.Create('select email_address from member where id = ' + member_id,connection).ExecuteScalar.tostring;
  if email_address_obj <> nil then begin
    EmailAddressOf := email_address_obj.tostring;
  end else begin
    EmailAddressOf := EMPTY;
  end;
  self.Close;
end;

function TClass_db_members.IdOfUserId(user_id: string): string;
var
  member_id_obj: system.object;
begin
  self.Open;
  member_id_obj := mysqlcommand.Create('select member_id from user_member_map where user_id = ' + user_id,connection).ExecuteScalar;
  if member_id_obj <> nil then begin
    IdOfUserId := member_id_obj.tostring;
  end else begin
    IdOfUserId := EMPTY;
  end;
  self.Close;
end;

procedure TClass_db_members.SetEmailAddress
  (
  id: string;
  email_address: string
  );
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'UPDATE member'
      + ' SET email_address = "' + email_address + '"'
      + ' WHERE id = ' + id
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

function TClass_db_members.UserIdOf(member_id: string): string;
var
  user_id_obj: system.object;
begin
  //
  self.Open;
  user_id_obj := mysqlcommand.Create('select user_id from user_member_map where member_id = ' + member_id,connection).ExecuteScalar;
  if user_id_obj <> nil then begin
    UserIdOf := user_id_obj.tostring;
  end else begin
    UserIdOf := EMPTY;
  end;
  self.Close;
end;

end.
