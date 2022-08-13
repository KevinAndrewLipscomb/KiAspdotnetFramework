namespace Class_db_notifications
  {
  public interface ITClass_db_notifications
    {
    void BindDirectToListControl(object target);
    void BindDirectToListControl(object target, string unselected_literal);
    void BindDirectToListControl(object target, string unselected_literal, string selected_value);
    string TargetOf(string name, string member_id);
    }
  }