namespace Class_db_members
  {
  public interface ITClass_db_members
    {
    public bool BeRoleHolderBySharedSecret(string shared_secret, out string claimed_role_name, out string claimed_member_name, out string claimed_member_id, out string claimed_member_email_address);
    bool BeValidProfile(string id);
    void BindDirectToListControl(object target);
    void BindDirectToListControl(object target, string unselected_literal);
    void BindDirectToListControl(object target, string unselected_literal, string selected_value);
    string EmailAddressOf(string member_id);
    string FirstNameOfMemberId(string member_id);
    string IdOfUserId(string user_id);
    string LastNameOfMemberId(string member_id);
    void SetEmailAddress(string id, string email_address);
    string UserIdOf(string member_id);
    }
  }