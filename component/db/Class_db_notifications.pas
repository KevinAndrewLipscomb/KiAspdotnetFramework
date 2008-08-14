unit Class_db_notifications;

interface

uses
  Class_db,
  kix;

type
  TClass_db_notifications = class(TClass_db)
  private
    tier_2_match_field: string;
    tier_3_match_field: string;
  public
    constructor Create;
    procedure BindDirectToListControl
      (
      target: system.object;
      unselected_literal: string = '-- Notification --';
      selected_value: string = EMPTY
      );
    function TargetOf
      (
      name: string;
      member_id: string
      )
      : string;
  end;

implementation

uses
  mysql.data.mysqlclient,
  system.configuration,
  system.web.ui.webcontrols;

constructor TClass_db_notifications.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  tier_2_match_field := configurationmanager.appsettings['tier_2_match_field'];
  tier_3_match_field := configurationmanager.appsettings['tier_3_match_field'];
end;

procedure TClass_db_notifications.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Notification --';
  selected_value: string = EMPTY
  );
var
  dr: mysqldatareader;
begin
  //
  ListControl(target).items.Clear;
  if unselected_literal <> EMPTY then begin
    ListControl(target).items.Add(listitem.Create(unselected_literal,EMPTY));
  end;
  //
  self.Open;
  dr := mysqlcommand.Create
    (
    'select notification.id as notification_id'
    + ' , name as notification_name'
    + ' from notification'
    + ' order by notification_name',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).items.Add(listitem.Create(dr['notification_name'].tostring,dr['notification_id'].tostring));
  end;
  dr.Close;
  self.Close;
  //
  if selected_value <> EMPTY then begin
    ListControl(target).selectedvalue := selected_value;
  end;
  //
end;

function TClass_db_notifications.TargetOf
  (
  name: string;
  member_id: string
  )
  : string;
var
  dr: mysqldatareader;
  target_of: string;
//  tier_2_match_value: string;
//  tier_3_match_value: string;
begin
  target_of := EMPTY;
  self.Open;
//  //
//  // Get tier 2 and 3 associations of target member.
//  //
//  dr := mysqlcommand.Create
//    ('select ' + tier_2_match_field + COMMA + tier_3_match_field + ' from member where id = "' + member_id + '"',connection).ExecuteReader;
//  dr.Read;
//  tier_2_match_value := dr[tier_2_match_field].tostring;
//  tier_3_match_value := dr[tier_3_match_field].tostring;
//  dr.Close;
  //
  // Tier 1 stakeholders
  //
  dr := mysqlcommand.Create
    (
    'select email_address'
    + ' from member'
    +   ' join role_member_map on (role_member_map.member_id=member.id)'
    +   ' join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)'
    +   ' join role on (role.id=role_member_map.role_id)'
    +   ' join notification on (notification.id=role_notification_map.notification_id)'
//    + ' where tier_id = 1'
    +   ' and notification.name = "' + name + '"',
    connection
    )
    .ExecuteReader;
  if dr <> nil then begin
    while dr.Read do begin
      target_of := target_of + dr['email_address'].tostring + COMMA;
    end;
  end;
  dr.Close;
//  //
//  // Tier 2 stakeholders
//  //
//  dr := mysqlcommand.Create
//    (
//    'select email_address'
//    + ' from member'
//    +   ' join role_member_map on (role_member_map.member_id=member.id)'
//    +   ' join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)'
//    +   ' join role on (role.id=role_member_map.role_id)'
//    +   ' join notification on (notification.id=role_notification_map.notification_id)'
//    + ' where tier_id = 2'
//    +   ' and ' + tier_2_match_field + ' = ' + tier_2_match_value
//    +   ' and notification.name = "' + name + '"',
//    connection
//    )
//    .ExecuteReader;
//  if dr <> nil then begin
//    while dr.Read do begin
//      target_of := target_of + dr['email_address'].tostring + COMMA;
//    end;
//  end;
//  dr.Close;
//  //
//  // Tier 3 stakeholders
//  //
//  dr := mysqlcommand.Create
//    (
//    'select email_address'
//    + ' from member'
//    +   ' join role_member_map on (role_member_map.member_id=member.id)'
//    +   ' join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)'
//    +   ' join role on (role.id=role_member_map.role_id)'
//    +   ' join notification on (notification.id=role_notification_map.notification_id)'
//    + ' where tier_id = 3'
//    +   ' and ' + tier_2_match_field + ' = ' + tier_2_match_value
//    +   ' and ' + tier_3_match_field + ' = ' + tier_3_match_value
//    +   ' and notification.name = "' + name + '"',
//    connection
//    )
//    .ExecuteReader;
//  if dr <> nil then begin
//    while dr.Read do begin
//      target_of := target_of + dr['email_address'].tostring + COMMA;
//    end;
//  end;
//  dr.Close;
  //
  self.Close;
  if target_of <> EMPTY then begin
    TargetOf := target_of.Substring(0,target_of.Length - 1);
  end else begin
    TargetOf := EMPTY;
  end;
end;

end.
