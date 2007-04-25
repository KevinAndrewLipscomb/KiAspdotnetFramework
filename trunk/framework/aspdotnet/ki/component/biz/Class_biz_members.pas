unit Class_biz_members;

interface

uses
//  Class_biz_notifications,
  Class_db_members;

type
  TClass_biz_members = class
  private
    db_members: TClass_db_members;
//    biz_notifications: TClass_biz_notifications;
  public
    constructor Create;
    function Add
//      (
//      attributes..
//      )
      : boolean;
    function BeValidProfile(id: string): boolean;
    function EmailAddressOf(member_id: string): string;
    function IdOfUserId(user_id: string): string;
    function UserIdOf(member_id: string): string;
  end;

implementation

constructor TClass_biz_members.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_members := TClass_db_members.Create;
//  biz_notifications := TClass_biz_notifications.Create;
end;

function TClass_biz_members.Add
//  (
//  attributes..
//  )
  : boolean;
begin
  Add := FALSE;
//  if not db_members.BeKnown(first_name,last_name,cad_num) then begin
//    db_members.Add
//      (
//      attributes..
//      );
//    biz_notifications.IssueForMemberAdded
//      (
//      attributes..
//      );
//    Add := TRUE;
//  end;
end;

function TClass_biz_members.BeValidProfile(id: string): boolean;
begin
  BeValidProfile := db_members.BeValidProfile(id);
end;

function TClass_biz_members.EmailAddressOf(member_id: string): string;
begin
  EmailAddressOf := db_members.EmailAddressOf(member_id);
end;

function TClass_biz_members.IdOfUserId(user_id: string): string;
begin
  IdOfUserId := db_members.IdOfUserId(user_id);
end;

function TClass_biz_members.UserIdOf(member_id: string): string;
begin
  UserIdOf := db_members.UserIdOf(member_id);
end;

end.
