namespace Class_db_privileges
  {
  public interface ITClass_db_privileges
    {
    bool Bind(string partial_name, object target);
    void BindDirectToListControl(object target);
    void BindDirectToListControl(object target, string unselected_literal);
    void BindDirectToListControl(object target, string unselected_literal, string selected_value);
    bool Get(string name, out string soft_hyphenation_text);
    public bool HasForAnyScope(string member_id, string privilege_name);
    }
  }