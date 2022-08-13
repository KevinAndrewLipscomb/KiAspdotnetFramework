namespace Class_db_users
{
  public interface ITClass_db_users
  {
    bool AcceptAsMember(string shared_secret, string id);
    bool BeAuthorized(string username, string encoded_password);
    bool BeRegisteredEmailAddress(string email_address);
    bool BeRegisteredUsername(string username);
    bool BeStalePassword(string id);
    bool Bind(string partial_username, object target);
    void BindDirectToListControl(object target);
    void BindDirectToListControl(object target, string unselected_literal);
    void BindDirectToListControl(object target, string unselected_literal, string selected_value);
    void Delete(string username);
    bool Get(string username, out string encoded_password, out bool be_stale_password, out string password_reset_email_address, out bool be_active, out uint num_unsuccessful_login_attempts, out string last_login);
    string IdOf(string username);
    uint NumUnsuccessfulLoginAttemptsOf(string username);
    string PasswordResetEmailAddressOfId(string id);
    string PasswordResetEmailAddressOfUsername(string username);
    string[] PrivilegesOf(string id);
    void RecordSuccessfulLogin(string id);
    void RecordUnsuccessfulLoginAttempt(string username);
    void RegisterNew(string username, string encoded_password, string email_address);
    void Set(string username, bool be_stale_password, string password_reset_email_address, bool be_active);
    void SetEmailAddress(string id, string email_address);
    void SetPassword(string id, string encoded_password);
    void SetTemporaryPassword(string username, string encoded_password);
    string UsernameOfEmailAddress(string email_address);
  }
}