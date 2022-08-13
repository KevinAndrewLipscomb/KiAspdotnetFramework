using System.Collections;

namespace Class_db_role_member_map
  {
  public interface ITClass_db_role_member_map
    {
    void Bind(string sort_order, bool be_sort_order_descending, object target, out ArrayList crosstab_metadata_rec_arraylist);
    void BindActuals(string sort_order, bool be_sort_order_ascending, object target);
    void BindHolders(string role_name, object target, string sort_order, bool be_sort_order_ascending);
    void Save(string member_id, string role_id, bool be_granted);
    }
  }