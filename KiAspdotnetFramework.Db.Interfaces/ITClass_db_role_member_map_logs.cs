// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

namespace Class_db_role_member_map_logs
  {
  public interface ITClass_db_role_member_map_logs
    {
    bool Bind(string partial_spec, object target);
    void BindBaseDataList(string sort_order, bool be_sort_order_ascending, object target, string subject_member_id);
    void BindDirectToListControl(object target);
    bool Delete(string id);
    void Enter(string subject_member_id, string actor_member_id, bool be_granted, string role_id);
    bool Get(string id, out string subject_member_id, out string timestamp, out string actor_member_id, out bool be_granted, out string role_id);
    void Set(string id, string subject_member_id, string timestamp, string actor_member_id, bool be_granted, string role_id);
    object Summary(string id);
  }
  }