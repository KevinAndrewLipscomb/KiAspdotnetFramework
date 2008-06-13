unit Class_biz_notifications;

interface

type
  TClass_biz_notifications = class
  private
    application_name: string;
    host_domain_name: string;
  public
    constructor Create;
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
  Class_biz_user,
  Class_biz_users,
  kix,
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
  host_domain_name := configurationmanager.appsettings['host_domain_name'];
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
