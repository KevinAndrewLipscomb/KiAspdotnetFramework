// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using System;

namespace Class_db_subjoined_attributes
  {
  public interface ITClass_db_subjoined_attributes
    {
    bool BeAnyImplementedSince(DateTime time);
    bool Bind(string partial_spec, object target);
    void BindBaseDataList(object target, DateTime last_login);
    void BindDirectToListControl(object target);
    bool Delete(string id);
    bool Get(string id, out DateTime time_implemented, out string involvement_id, out string name);
    void Set(string id, DateTime time_implemented, string involvement_id, string name);
    object Summary(string id);
  }
  }