unit Class_biz_accounts;

interface

uses
  Class_biz_kind3s,
  Class_biz_milestones,
  Class_biz_kind1s,
  Class_biz_user,
  Class_db_accounts,
  Class_db_emsof_requests,
  ki,
  borland.vcl.sysutils,
  system.configuration,
  system.web.mail;

const ID = '$Id$';

type
  TClass_biz_accounts = class
  private
    biz_kind3s: TClass_biz_kind3s;
    biz_kind1s: TClass_biz_kind1s;
    biz_user: TClass_biz_user;
    db_accounts: TClass_db_accounts;
    db_emsof_requests: TClass_db_emsof_requests;
    function SelfEmailAddress: string;
  public
    constructor Create;
    function BeValidSysAdminCredentials(encoded_password: string): boolean;
    procedure BindKind3s(target: system.object);
    procedure BindKind2s(target: system.object);
    procedure BindKind1s(target: system.object);
    function EmailAddressByKindId
      (
      user_kind: string;
      user_id: string
      )
      : string;
    function EmailTargetByRole(role: string): string;
    function Exists
      (
      user_kind: string;
      user_id: string;
      encoded_password: string
      )
      : boolean;
    procedure IssueNoticeToProceed
      (
      kind1_id: string;
      kind1_name: string;
      fy_designator: string;
      sponsor_region_name: string;
      sponsor_kind3_name: string;
      master_id: string
      );
    procedure MakeDeadlineFailureNotification
      (
      milestone: milestone_type;
      kind1_id: string;
      kind3_code: string
      );
    procedure MakeDemotionNotification
      (
      role: string;
      reviewer_descriptor: string;
      new_status_description: string;
      kind1_id: string;
      kind1_name: string;
      fy_designator: string;
      be_ok_to_rework: boolean;
      reason: string;
      kind3_code: string;
      emsof_ante: string
      );
    procedure MakePromotionNotification
      (
      next_reviewer_role: string;
      reviewer_descriptor: string;
      new_status_description: string;
      kind1_id: string;
      kind1_name: string;
      fy_designator: string;
      be_warning_required: boolean = TRUE
      );
    procedure MakeUnrejectionNotification
      (
      role: string;
      reviewer_descriptor: string;
      kind1_id: string;
      kind1_name: string;
      fy_designator: string;
      kind3_code: string
      );
    procedure NotifyRegionOfKind1PocAffirmation
      (
      kind1_id: string;
      kind1_name: string;
      contact_person_name: string
      );
    procedure Remind
      (
      milestone: milestone_type;
      num_days_left: cardinal;
      deadline_date: datetime;
      kind1_id: string
      );
    procedure SetTemporaryPassword
      (
      user_kind: string;
      user_id: string;
      encoded_password: string
      );
  end;

implementation

constructor TClass_biz_accounts.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  biz_kind3s := TClass_biz_kind3s.Create;
  biz_kind1s := TClass_biz_kind1s.Create;
  biz_user := TClass_biz_user.Create;
  db_accounts := TClass_db_accounts.Create;
  db_emsof_requests := TClass_db_emsof_requests.Create;
end;

function TClass_biz_accounts.BeValidSysAdminCredentials(encoded_password: string): boolean;
begin
  BeValidSysAdminCredentials := (encoded_password = configurationsettings.appsettings['sysadmin_encoded_password']);
end;

procedure TClass_biz_accounts.BindKind3s(target: system.object);
begin
  db_accounts.BindKind3s(target);
end;

procedure TClass_biz_accounts.BindKind2s(target: system.object);
begin
  db_accounts.BindKind2s(target);
end;

procedure TClass_biz_accounts.BindKind1s(target: system.object);
begin
  db_accounts.BindKind1s(target);
end;

function TClass_biz_accounts.EmailAddressByKindId
  (
  user_kind: string;
  user_id: string
  )
  : string;
begin
  EmailAddressByKindId := db_accounts.EmailAddressByKindId(user_kind,user_id);
end;

function TClass_biz_accounts.EmailTargetByRole(role: string): string;
begin
  EmailTargetByRole := db_accounts.EmailTargetByRole(role);
end;

function TClass_biz_accounts.Exists
  (
  user_kind: string;
  user_id: string;
  encoded_password: string
  )
  : boolean;
begin
  Exists := db_accounts.Exists(user_kind,user_id,encoded_password);
end;

procedure TClass_biz_accounts.IssueNoticeToProceed
  (
  kind1_id: string;
  kind1_name: string;
  fy_designator: string;
  sponsor_region_name: string;
  sponsor_kind3_name: string;
  master_id: string
  );
var
  emsof_coord_email_address: string;
  message_text: string;
begin
  //
  // Get the next approver's email address.
  //
  emsof_coord_email_address := EmailTargetByRole('emsof-coordinator');
  //
  // Generate the base message.
  //
  message_text := 'Recently, ' + kind1_name + ' submitted a request to conduct an EMSOF Category 4 Provider Equipment project.  '
  + 'This message documents the approval by all the necessary parties of that request as recorded in '
  + ConfigurationSettings.AppSettings['application_name'] + '.' + NEW_LINE
  + NEW_LINE
  + 'Congratulations!  YOU MAY NOW PROCEED WITH THE PROJECT SPECIFIED BELOW.  Please print this message and keep it for your '
  + 'records.' + NEW_LINE
  + NEW_LINE
  + 'To complete this project and receive proper reimbursement, please do the following:' + NEW_LINE
  + NEW_LINE
  + '1. Purchase the items specified below.' + NEW_LINE
  + NEW_LINE
  + '2. FAX OR SEND COPIES OF YOUR INVOICES AND/OR RECEIPTS TO THE REGIONAL' + NEW_LINE
  + '   COUNCIL.' + NEW_LINE
  + NEW_LINE
  + '3. Take delivery of the specified equipment.' + NEW_LINE
  + NEW_LINE
  + '4. Send proof of payment to the regional council.  Documents acceptable' + NEW_LINE
  + '   for this purpose include:' + NEW_LINE
  + NEW_LINE
  + '   -  Copy of cancelled check' + NEW_LINE
  + '   -  Copy of bank draft' + NEW_LINE
  + '   -  Copy of bank statement' + NEW_LINE
  + '   -  Copy of wire transfer slip' + NEW_LINE
  + NEW_LINE
  + '5. Watch your mailbox for the reimbursement check!' + NEW_LINE
  + NEW_LINE
  + NEW_LINE
  + '=== PROJECT DETAILS ===' + NEW_LINE
  + 'This Notice To Proceed only applies to the following project:' + NEW_LINE
  + NEW_LINE
  + '--- Master data ---' + NEW_LINE
  + 'Fiscal year:     ' + fy_designator + NEW_LINE
  + 'Sponsor region:  ' + sponsor_region_name + NEW_LINE
  + 'Sponsor kind3:  ' + sponsor_kind3_name + NEW_LINE
  + NEW_LINE
  + '--- Detail data ---' + NEW_LINE
  + db_emsof_requests.DetailText(master_id)
  + NEW_LINE
  + 'You can review your EMSOF requests by visiting:' + NEW_LINE
  + NEW_LINE
  + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
  + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
  + NEW_LINE
  + 'You can contact your Regional EMSOF Coordinator at:' + NEW_LINE
  + NEW_LINE
  + '   ' + emsof_coord_email_address + '  (mailto:' + emsof_coord_email_address + ')' + NEW_LINE
  + NEW_LINE
  + '-- ' + ConfigurationSettings.AppSettings['application_name'];
  //
  // Send notification to kind1.
  //
  ki.SmtpMailSend
    (
    ConfigurationSettings.AppSettings['sender_email_address'],
    EmailAddressByKindId('kind1',kind1_id),
    'NOTICE TO PROCEED with EMSOF project',
    message_text
    );
  //
  //   Send notification to region.
  //
  ki.SmtpMailSend
    (
    ConfigurationSettings.AppSettings['sender_email_address'],
    emsof_coord_email_address,
    ConfigurationSettings.AppSettings['application_name'] + ' has issued a Notice To Proceed',
    ConfigurationSettings.AppSettings['application_name'] + ' has issued the following Notice To Proceed message to ' + kind1_name
    + '.  You should expect this kind1 to submit invoices and proof of payment.' + NEW_LINE
    + NEW_LINE
    + '... BEGIN COPY OF NOTICE TO PROCEED ...' + NEW_LINE
    + NEW_LINE
    + message_text + NEW_LINE
    + NEW_LINE
    + '... END COPY OF NOTICE TO PROCEED ...'
    );
end;

procedure TClass_biz_accounts.MakeDeadlineFailureNotification
  (
  milestone: milestone_type;
  kind1_id: string;
  kind3_code: string
  );
var
  be_advice_valuable: boolean;
  kind3_coord_email_address: string;
  kind3_name: string;
  deadline_description: string;
  message_text: string;
  kind1_email_address: string;
  kind1_name: string;
begin
  be_advice_valuable := FALSE;
  kind3_coord_email_address := EmailAddressByKindId('kind3',kind3_code);
  kind3_name := biz_kind3s.NameOf(kind3_code);
  kind1_email_address := EmailAddressByKindId('kind1',kind1_id);
  kind1_name := biz_kind1s.NameOf(kind1_id);
  //
  case milestone of
  KIND3_DICTATED_APPROPRIATION_DEADLINE_MILESTONE:
    BEGIN
    deadline_description := 'finalize its EMSOF request';
    be_advice_valuable := TRUE;
    END;
  KIND1_PURCHASE_COMPLETION_DEADLINE_MILESTONE:
    deadline_description := 'purchase EMSOF one or more requested items';
  KIND1_INVOICE_SUBMISSION_DEADLINE_MILESTONE:
    deadline_description := 'submit invoices for one or more requested items';
  KIND1_CANCELED_CHECK_SUBMISSION_DEADLINE_MILESTONE:
    deadline_description := 'submit proof of payment for one or more requested items';
  end;
  //
  message_text := 'Sorry, but ' + kind1_name + ' has missed the regional deadline to ' + deadline_description + ' '
  + 'associated with an allocation from ' + kind3_name + ' Kind3.' + NEW_LINE
  + NEW_LINE;
  if be_advice_valuable then begin
    message_text := message_text + 'Please DO NOT PROCEED with any activity related to that request.' + NEW_LINE
    + NEW_LINE;
  end;
  message_text := message_text + 'You can review your EMSOF requests by visiting:' + NEW_LINE
  + NEW_LINE
  + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
  + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
  + NEW_LINE
  + 'You can contact your Kind3 EMSOF Coordinator at:' + NEW_LINE
  + NEW_LINE
  + '   ' + kind3_coord_email_address + '  (mailto:' + kind3_coord_email_address + ')' + NEW_LINE
  + NEW_LINE
  + '-- ' + ConfigurationSettings.AppSettings['application_name'];
  //
  ki.SmtpMailSend(ConfigurationSettings.AppSettings['sender_email_address'],kind1_email_address,'Missed deadline',message_text);
  //
  message_text := kind1_name + ' has missed the regional deadline to ' + deadline_description + ' '
  + 'associated with an allocation from ' + kind3_name + ' Kind3.' + NEW_LINE
  + NEW_LINE;
  if be_advice_valuable then begin
    message_text := message_text + 'WebEMSOF has advised the kind1 not to proceed with any activity related to that request.'
    + NEW_LINE
    + NEW_LINE;
  end;
  message_text := message_text + 'You can use WebEMSOF by visiting:' + NEW_LINE
  + NEW_LINE
  + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
  + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
  + NEW_LINE
  + 'You can contact the affected kind1 at:' + NEW_LINE
  + NEW_LINE
  + '   ' + kind1_email_address + '  (mailto:' + kind1_email_address + ')' + NEW_LINE
  + NEW_LINE
  + '-- ' + ConfigurationSettings.AppSettings['application_name'];
  //
  ki.SmtpMailSend
    (
    ConfigurationSettings.AppSettings['sender_email_address'],
    kind3_coord_email_address + ',' + EmailTargetByRole('emsof-coordinator'),
    'Kind1 missed deadline',
    message_text
    );
end;

procedure TClass_biz_accounts.MakeDemotionNotification
  (
  role: string;
  reviewer_descriptor: string;
  new_status_description: string;
  kind1_id: string;
  kind1_name: string;
  fy_designator: string;
  be_ok_to_rework: boolean;
  reason: string;
  kind3_code: string;
  emsof_ante: string
  );
var
  BreakChars: array[1..3] of char;
  other_stakeholder_email_address: string;
  self_email_address: string;
  kind1_email_address: string;
begin
  //
  // Get kind1's email address of record.
  //
  kind1_email_address := EmailAddressByKindId('kind1',kind1_id);
  self_email_address := SelfEmailAddress;
  //
  BreakChars[1] := ki.SPACE;
  BreakChars[2] := ki.TAB;
  BreakChars[3] := '-';
  //
  if be_ok_to_rework then begin
    //
    //   Send notification to kind1.
    //
    ki.SmtpMailSend
      (
      ConfigurationSettings.AppSettings['sender_email_address'],
      kind1_email_address,
      'Return of EMSOF request for rework',
      reviewer_descriptor + ' did NOT approve ' + kind1_name + '''s ' + fy_designator + ' EMSOF request.  Instead, the request '
      + 'has been returned to you for rework.' + NEW_LINE
      + NEW_LINE
      + reviewer_descriptor + ' gave this reason for this action:' + NEW_LINE
      + NEW_LINE
      + '   '
      + WrapText
        (
        reason,
        (NEW_LINE + '   '),
        BreakChars,
        int16.Parse(configurationsettings.AppSettings['email_blockquote_maxcol'])
        )
      + NEW_LINE
      + NEW_LINE
      + 'You can rework this EMSOF request by visiting:' + NEW_LINE
      + NEW_LINE
      + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
      + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
      + NEW_LINE
      + 'You can contact ' + reviewer_descriptor + ' at:' + NEW_LINE
      + NEW_LINE
      + '   ' + self_email_address + '  (mailto:' + self_email_address + ')' + NEW_LINE
      + NEW_LINE
      + '-- ' + ConfigurationSettings.AppSettings['application_name']
      );
    //
    if role <> 'kind3' then begin
      //
      //   Send notification to kind3.
      //
      ki.SmtpMailSend
        (
        ConfigurationSettings.AppSettings['sender_email_address'],
        EmailAddressByKindId('kind3',kind3_code),
        'Return of EMSOF request to ' + kind1_name,
        reviewer_descriptor + ' did NOT approve ' + kind1_name + '''s ' + fy_designator + ' EMSOF request.  Instead, the request '
        + 'has been returned to the kind1 for rework.' + NEW_LINE
        + NEW_LINE
        + reviewer_descriptor + ' gave this reason for this action:' + NEW_LINE
        + NEW_LINE
        + '   '
        + WrapText
          (
          reason,
          (NEW_LINE + '   '),
          BreakChars,
          int16.Parse(configurationsettings.AppSettings['email_blockquote_maxcol'])
          )
        + NEW_LINE
        + NEW_LINE
        + 'You can review this EMSOF request by visiting:' + NEW_LINE
        + NEW_LINE
        + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
        + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
        + NEW_LINE
        + 'You can contact ' + reviewer_descriptor + ' at:' + NEW_LINE
        + NEW_LINE
        + '   ' + self_email_address + '  (mailto:' + self_email_address + ')' + NEW_LINE
        + NEW_LINE
        + 'You can contact ' + kind1_name + ' at:' + NEW_LINE
        + NEW_LINE
        + '   ' + kind1_email_address + '  (mailto:' + kind1_email_address + ')' + NEW_LINE
        + NEW_LINE
        + '-- ' + ConfigurationSettings.AppSettings['application_name']
        );
      //
    end;
    //
  end else begin
    //
    //   Get other stakeholder's email address.
    //
    if biz_user.Kind = 'kind3' then begin
      other_stakeholder_email_address := EmailTargetByRole('emsof-coordinator');
    end else if biz_user.Kind = 'kind2' then begin
      other_stakeholder_email_address := EmailAddressByKindId('kind3',kind3_code);
    end;
    //
    //   Send notifications to kind1 and region.
    //
    ki.SmtpMailSend
      (
      ConfigurationSettings.AppSettings['sender_email_address'],
      kind1_email_address,
      'REJECTION of EMSOF request',
      reviewer_descriptor + ' has REJECTED ' + kind1_name + '''s ' + fy_designator + ' EMSOF request.  ' + NEW_LINE
      + NEW_LINE
      + reviewer_descriptor + ' gave this reason for this action:' + NEW_LINE
      + NEW_LINE
      + '   '
      + WrapText
        (
        reason,
        (NEW_LINE + '   '),
        BreakChars,
        int16.Parse(configurationsettings.AppSettings['email_blockquote_maxcol'])
        )
      + NEW_LINE
      + NEW_LINE
      + 'You can review your EMSOF requests by visiting:' + NEW_LINE
      + NEW_LINE
      + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
      + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
      + NEW_LINE
      + 'You can contact ' + reviewer_descriptor + ' at:' + NEW_LINE
      + NEW_LINE
      + '   ' + self_email_address + '  (mailto:' + self_email_address + ')' + NEW_LINE
      + NEW_LINE
      + '-- ' + ConfigurationSettings.AppSettings['application_name']
      );
    ki.SmtpMailSend
      (
      ConfigurationSettings.AppSettings['sender_email_address'],
      other_stakeholder_email_address,
      'REJECTION of EMSOF request',
      reviewer_descriptor + ' has REJECTED ' + kind1_name + '''s '+ fy_designator + ' EMSOF request.  ' + NEW_LINE
      + NEW_LINE
      + reviewer_descriptor + ' gave this reason for this action:' + NEW_LINE
      + NEW_LINE
      + '   '
      + WrapText
        (
        reason,
        (NEW_LINE + '   '),
        BreakChars,
        int16.Parse(configurationsettings.AppSettings['email_blockquote_maxcol'])
        )
      + NEW_LINE
      + NEW_LINE
      + 'This action effectively returns ' + emsof_ante + ' of EMSOF funds for use by others.' + NEW_LINE
      + NEW_LINE
      + 'If the regional request submission deadline has not already passed, you can UN-reject this request by moving your kind3 '
      + 'deadline from the past to the future.' + NEW_LINE
      + NEW_LINE
      + 'To review this EMSOF request or to adjust your kind3 submission deadline, visit:' + NEW_LINE
      + NEW_LINE
      + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
      + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
      + NEW_LINE
      + 'You can contact ' + reviewer_descriptor + ' at:' + NEW_LINE
      + NEW_LINE
      + '   ' + self_email_address + '  (mailto:' + self_email_address + ')' + NEW_LINE
      + NEW_LINE
      + '-- ' + ConfigurationSettings.AppSettings['application_name']
      );
  end;
end;

procedure TClass_biz_accounts.MakePromotionNotification
  (
  next_reviewer_role: string;
  reviewer_descriptor: string;
  new_status_description: string;
  kind1_id: string;
  kind1_name: string;
  fy_designator: string;
  be_warning_required: boolean = TRUE
  );
var
  messageText: string;
  next_reviewer_email_target: string;
  self_email_address: string;
begin
  //
  //   Get the next approver's email address.
  //
  if next_reviewer_role <> system.string.EMPTY then begin
    next_reviewer_email_target := EmailTargetByRole(next_reviewer_role);
  end else begin
    next_reviewer_email_target := system.string.EMPTY
  end;
  //
  self_email_address := SelfEmailAddress;
  //
  messageText := reviewer_descriptor + ' has promoted ' + kind1_name + '''s '+ fy_designator + ' EMSOF request.' + NEW_LINE
  + NEW_LINE
  + 'The status of this EMSOF request is now "' + new_status_description + '".  ';
  if next_reviewer_email_target <> system.string.EMPTY then begin
    messageText := messageText + 'The next reviewer''s email address is <' + next_reviewer_email_target + '>.';
  end;
  if be_warning_required then begin
    messageText := messageText
    + NEW_LINE
    + NEW_LINE
    + 'NOTE that this message is NOT a "Notice To Proceed", so you must NOT purchase any of the items in your EMSOF request '
    + 'yet.';
  end;
  messageText := messageText
  + NEW_LINE
  + NEW_LINE
  + 'You can review your EMSOF requests by visiting:' + NEW_LINE
  + NEW_LINE
  + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
  + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
  + NEW_LINE
  + 'You can contact ' + reviewer_descriptor + ' at:' + NEW_LINE
  + NEW_LINE
  + '   ' + self_email_address + '  (mailto:' + self_email_address + ')' + NEW_LINE
  + NEW_LINE
  + '-- ' + ConfigurationSettings.AppSettings['application_name'];
  //
  //   Send notification to kind1.
  //
  ki.SmtpMailSend
    (
    ConfigurationSettings.AppSettings['sender_email_address'],
    EmailAddressByKindId('kind1',kind1_id),
    'Promotion of EMSOF request',
    messageText
    );
  //
  //   Send notification to region.
  //
  if next_reviewer_email_target <> system.string.EMPTY then begin
    ki.SmtpMailSend
      (
      ConfigurationSettings.AppSettings['sender_email_address'],
        next_reviewer_email_target,
      'Promotion of EMSOF request',
        reviewer_descriptor + ' has promoted ' + kind1_name + '''s ' + fy_designator + ' EMSOF request.' + NEW_LINE
      + NEW_LINE
      + 'Your action is now required.  The status of this EMSOF request is "' + new_status_description + '".' + NEW_LINE
      + NEW_LINE
      + 'You can review this EMSOF request by visiting:' + NEW_LINE
      + NEW_LINE
      + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
      + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
      + NEW_LINE
      + 'You can contact ' + reviewer_descriptor + ' at:' + NEW_LINE
      + NEW_LINE
      + '   ' + self_email_address + '  (mailto:' + self_email_address + ')' + NEW_LINE
      + NEW_LINE
      + '-- ' + ConfigurationSettings.AppSettings['application_name']
      );
  end;
end;

procedure TClass_biz_accounts.MakeUnrejectionNotification
  (
  role: string;
  reviewer_descriptor: string;
  kind1_id: string;
  kind1_name: string;
  fy_designator: string;
  kind3_code: string
  );
var
  self_email_address: string;
  kind1_email_address: string;
begin
  //
  // Get kind1's email address of record.
  //
  kind1_email_address := EmailAddressByKindId('kind1',kind1_id);
  self_email_address := SelfEmailAddress;
  //
  //   Send notification to kind1.
  //
  ki.SmtpMailSend
    (
    ConfigurationSettings.AppSettings['sender_email_address'],
    kind1_email_address,
    'UN-Rejection of EMSOF request',
    reviewer_descriptor + ' has UN-rejected ' + kind1_name + '''s ' + fy_designator + ' EMSOF request.  The request '
    + 'has been returned to you for rework.' + NEW_LINE
    + NEW_LINE
    + 'You can rework this EMSOF request by visiting:' + NEW_LINE
    + NEW_LINE
    + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
    + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
    + NEW_LINE
    + 'You can contact ' + reviewer_descriptor + ' at:' + NEW_LINE
    + NEW_LINE
    + '   ' + self_email_address + '  (mailto:' + self_email_address + ')' + NEW_LINE
    + NEW_LINE
    + '-- ' + ConfigurationSettings.AppSettings['application_name']
    );
  //
  if role <> 'kind3' then begin
    //
    //   Send notification to kind3.
    //
    ki.SmtpMailSend
      (
      ConfigurationSettings.AppSettings['sender_email_address'],
      EmailAddressByKindId('kind3',kind3_code),
      'UN-rejection of ' + kind1_name + '''s EMSOF request',
      reviewer_descriptor + ' has UN-rejected ' + kind1_name + '''s ' + fy_designator + ' EMSOF request.  The request '
      + 'has been returned to the kind1 for rework.' + NEW_LINE
      + NEW_LINE
      + 'You can review this EMSOF request by visiting:' + NEW_LINE
      + NEW_LINE
      + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
      + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
      + NEW_LINE
      + 'You can contact ' + reviewer_descriptor + ' at:' + NEW_LINE
      + NEW_LINE
      + '   ' + self_email_address + '  (mailto:' + self_email_address + ')' + NEW_LINE
      + NEW_LINE
      + 'You can contact ' + kind1_name + ' at:' + NEW_LINE
      + NEW_LINE
      + '   ' + kind1_email_address + '  (mailto:' + kind1_email_address + ')' + NEW_LINE
      + NEW_LINE
      + '-- ' + ConfigurationSettings.AppSettings['application_name']
      );
    //
  end;
end;

function TClass_biz_accounts.SelfEmailAddress: string;
begin
  SelfEmailAddress := EmailAddressByKindId(biz_user.Kind,biz_user.IdNum);
end;

procedure TClass_biz_accounts.NotifyRegionOfKind1PocAffirmation
  (
  kind1_id: string;
  kind1_name: string;
  contact_person_name: string
  );
var
  poc_email_address: string;
begin
  poc_email_address := EmailAddressByKindId('kind1',kind1_id);
  ki.SmtpMailSend
    (
    ConfigurationSettings.AppSettings['sender_email_address'],
    EmailTargetByRole('emsof-coordinator'),
    'POC has assumed EMSOF resposibility for Kind1',
    'Dear Regional Council EMSOF Coordinator,' + NEW_LINE
    + NEW_LINE
    + contact_person_name + ' has successfully logged into WebEMSOF and has agreed to assume EMSOF Point Of Contact responsibilities '
    + 'for ' + kind1_name + '.  Furthermore, ' + contact_person_name + ' has agreed to give '
    + 'reasonable advance notice to both the kind1 and the regional council if it becomes necessary to relinquish such '
    + 'responsibilities.'   + NEW_LINE
    + NEW_LINE
    + 'You can contact ' + contact_person_name + ' at:' + NEW_LINE
    + NEW_LINE
    + '   ' + poc_email_address + '  (mailto:' + poc_email_address + ')' + NEW_LINE
    + NEW_LINE
    + '-- ' + ConfigurationSettings.AppSettings['application_name']
    );

end;

procedure TClass_biz_accounts.Remind
  (
  milestone: milestone_type;
  num_days_left: cardinal;
  deadline_date: datetime;
  kind1_id: string
  );
var
  kind1_email_address: string;
  kind1_name: string;
  task_description: string;
begin
  kind1_email_address := EmailAddressByKindId('kind1',kind1_id);
  kind1_name := biz_kind1s.NameOf(kind1_id);
  //
  case milestone of
  KIND3_DICTATED_APPROPRIATION_DEADLINE_MILESTONE:
    task_description := 'finalize your EMSOF request and submit it to your kind3 EMSOF coordinator';
  KIND1_PURCHASE_COMPLETION_DEADLINE_MILESTONE:
    task_description := 'purchase all the items in your EMSOF request(s)';
  KIND1_INVOICE_SUBMISSION_DEADLINE_MILESTONE:
    task_description := 'finish submitting invoices for items in your EMSOF request(s) to the regional EMS council';
  KIND1_CANCELED_CHECK_SUBMISSION_DEADLINE_MILESTONE:
    task_description := 'finish submitting proof of payment for items in your EMSOF request(s) to the regional EMS council';
  end;
  //
  ki.SmtpMailSend
    (
    ConfigurationSettings.AppSettings['sender_email_address'],
    kind1_email_address,
    'Reminder of approaching deadline',
    'This is an automated reminder from WebEMSOF.' + NEW_LINE
    + NEW_LINE
    + 'You have ' + num_days_left.tostring + ' days to ' + task_description + '.  The deadline is '
    + deadline_date.tostring('HH:mm:ss dddd, MMMM d, yyyy') + '.' + NEW_LINE
    + NEW_LINE
    + 'You can review your EMSOF requests by visiting:' + NEW_LINE
    + NEW_LINE
    + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
    + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
    + NEW_LINE
    + '-- ' + ConfigurationSettings.AppSettings['application_name']
    );
end;

procedure TClass_biz_accounts.SetTemporaryPassword
  (
  user_kind: string;
  user_id: string;
  encoded_password: string
  );
begin
  db_accounts.SetTemporaryPassword(user_kind,user_id,encoded_password);
end;

end.
