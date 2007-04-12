unit Class_db_members;

interface

uses
  borland.data.provider,
  Class_db,
  Class_db_trail,
  ki,
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
    function IdOfUserId(user_id: string): string;
  end;

implementation

uses
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
    ('1' = bdpCommand.Create('select be_valid_profile from member where id = ' + id,connection).ExecuteScalar.tostring);
  self.Close;
end;

function TClass_db_members.IdOfUserId(user_id: string): string;
begin
  self.Open;
  IdOfUserId := bdpcommand.Create('select id from member where user_id = ' + user_id,connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
