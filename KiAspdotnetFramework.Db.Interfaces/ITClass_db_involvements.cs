namespace Class_db_involvements
  {
  public interface ITClass_db_involvements
    {
    bool Bind(string partial_spec, object target);
    void BindDirectToListControl(object target, string unselected_literal = "", string selected_value = "-- involvement --");
    bool Delete(string id);
    bool Get(string id, out string description);
    void Set(string id, string description);
    }
  }