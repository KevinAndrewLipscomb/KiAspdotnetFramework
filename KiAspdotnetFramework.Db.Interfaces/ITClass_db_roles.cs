namespace Class_db_roles
  {
  public interface ITClass_db_roles
    {
    bool Bind(string partial_name, object target);
    void BindDirectToListControl(object target, bool has_config_roles_and_matrices);
    void BindDirectToListControl(object target, bool has_config_roles_and_matrices, string unselected_literal);
    void BindDirectToListControl(object target, bool has_config_roles_and_matrices, string unselected_literal, string selected_value);
    bool Delete(string name);
    bool Get(string name, out string soft_hyphenation_text, out string pecking_order);
    string NameOfId(string id);
    void Set(string name, string soft_hyphenation_text, string pecking_order);
    }
  }