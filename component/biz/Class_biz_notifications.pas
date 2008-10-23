unit Class_biz_notifications;

interface

uses
  Class_db_notifications,
  kix;

type
  TClass_biz_notifications = class
  private
    application_name: string;
    db_notifications: TClass_db_notifications;
    host_domain_name: string;
    runtime_root_fullspec: string;
  public
    constructor Create;
    procedure BindDirectToListControl
      (
      target: system.object;
      unselected_literal: string = '-- Notification --';
      selected_value: string = EMPTY
      );
    procedure IssueForForgottenUsername
      (
      email_address: string;
      username: string;
      client_host_name: string
      );
    procedure IssueForMembershipEstablishmentTrouble
      (
      full_name: string;
      explanation: string
      );
    procedure IssueForRoleChange
      (
      member_id: string;
      role_id: string;
      be_granted: boolean
      );
    procedure IssueForTemporaryPassword
      (
      username: string;
      client_host_name: string;
      temporary_password: string
      );
  end;

implementation

uses
  borland.vcl.sysutils,
  Class_biz_members,
  Class_biz_roles,
  Class_biz_user,
  Class_biz_users,
  system.configuration,
  system.io,
  system.text.regularexpressions,
  system.web,
  system.web.mail;

var
  BreakChars: array[1..3] of char;

constructor TClass_biz_notifications.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  application_name := configurationmanager.appsettings['application_name'];
  db_notifications := TClass_db_notifications.Create;
  host_domain_name := configurationmanager.appsettings['host_domain_name'];
  runtime_root_fullspec := configurationmanager.appsettings['runtime_root_fullspec'];
end;

procedure TClass_biz_notifications.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Notification --';
  selected_value: string = EMPTY
  );
begin
  db_notifications.BindDirectToListControl(target,unselected_literal,selected_value);
end;

procedure TClass_biz_notifications.IssueForForgottenUsername
  (
  email_address: string;
  username: string;
  client_host_name: string
  );
var
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      // always needed
      .Replace('<application_name/>',application_name)
      .Replace('<host_domain_name/>',host_domain_name)
      // message-dependent
      .Replace('<client_host_name/>',client_host_name)
      .Replace('<email_address/>',client_host_name)
      .Replace('<username/>',username);
  END;
  //
begin
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/username_reminder.txt'));
  SmtpMailSend
    (
    //from
    configurationmanager.appsettings['sender_email_address'],
    //to
    email_address,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForMembershipEstablishmentTrouble
  (
  full_name: string;
  explanation: string
  );
var
  user_email_address: string;
  biz_user: TClass_biz_user;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      .Replace('<full_name/>',full_name.toupper)
      .Replace('<user_email_address/>',user_email_address)
      .Replace('<application_name/>',application_name)
      .Replace
        (
        '<explanation/>',
        WrapText
          (explanation,(NEW_LINE + '   '),BreakChars,int16.Parse(configurationmanager.appsettings['email_blockquote_maxcol']))
        )
      .Replace('<host_domain_name/>',host_domain_name);
  END;
  //
begin
  //
  biz_user := TClass_biz_user.Create;
  //
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/membership_establishment_trouble.txt'));
  user_email_address := biz_user.EmailAddress;
  SmtpMailSend
    (
    //from
    configurationmanager.appsettings['sender_email_address'],
    // to
    configurationmanager.appsettings['membership_establishment_liaison'] + COMMA
    + configurationmanager.appsettings['application_name'] + '-appadmin@' + host_domain_name,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForRoleChange
  (
  member_id: string;
  role_id: string;
  be_granted: boolean
  );
var
  actor: string;
  actor_email_address: string;
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_roles: TClass_biz_roles;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
  changed: string;
  first_name: string;
  last_name: string;
  role_name: string;
  template_reader: streamreader;
  to_or_from: string;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      // always needed
      .Replace('<application_name/>',application_name)
      .Replace('<host_domain_name/>',host_domain_name)
      // message-dependent
      .Replace('<actor/>',actor)
      .Replace('<actor_email_address/>',actor_email_address)
      .Replace('<changed/>',changed)
      .Replace('<to_or_from/>',to_or_from)
      .Replace('<first_name/>',first_name)
      .Replace('<last_name/>',last_name)
      .Replace('<role_name/>',role_name)
      .Replace('<runtime_root_fullspec/>',runtime_root_fullspec);
  END;
  //
begin
  //
  biz_members := TClass_biz_members.Create;
  biz_roles := TClass_biz_roles.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0]
  + SPACE + biz_members.FirstNameOfMemberId(actor_member_id)
  + SPACE + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  if be_granted then begin
    changed := 'granted';
    to_or_from := 'to';
  end else begin
    changed := 'removed';
    to_or_from := 'from';
  end;
  first_name := biz_members.FirstNameOfMemberId(member_id);
  last_name := biz_members.LastNameOfMemberId(member_id);
  role_name := biz_roles.NameOfId(role_id);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/role_change.txt'));
  //
  kix.SmtpMailSend
    (
    //from
    configurationmanager.appsettings['sender_email_address'],
    //to
    biz_members.EmailAddressOf(member_id) + COMMA + actor_email_address + COMMA + db_notifications.TargetOf('role-change',member_id),
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd),
    //be_html
    FALSE,
    //cc
    EMPTY,
    //bcc
    EMPTY,
    //reply_to
    actor_email_address
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForTemporaryPassword
  (
  username: string;
  client_host_name: string;
  temporary_password: string
  );
var
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      // always needed
      .Replace('<application_name/>',application_name)
      .Replace('<host_domain_name/>',host_domain_name)
      // message-dependent
      .Replace('<client_host_name/>',client_host_name)
      .Replace('<temporary_password/>',temporary_password);
  END;
  //
begin
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/temporary_password.txt'));
  SmtpMailSend
    (
    //from
    configurationmanager.appsettings['sender_email_address'],
    //to
    biz_users.PasswordResetEmailAddressOfUsername(username),
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

begin
  BreakChars[1] := SPACE;
  BreakChars[2] := TAB;
  BreakChars[3] := HYPHEN;
end.
