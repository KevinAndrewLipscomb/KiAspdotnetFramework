using System.Collections;

namespace Class_db_role_privilege_map
  {
  public interface ITClass_db_role_privilege_map
    {
    void Bind(string sort_order, bool be_sort_order_descending, object target, out ArrayList crosstab_metadata_rec_arraylist);
    void BindActuals(string sort_order, bool be_sort_order_ascending, object target);
    void Save(string privilege_id, string role_id, bool be_granted);
    }
  }