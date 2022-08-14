using Class_db_role_notification_map;
using System.Collections;

namespace Class_biz_role_notification_map
  {
  public class TClass_biz_role_notification_map
    {

    private readonly ITClass_db_role_notification_map db_role_notification_map = null;

    public TClass_biz_role_notification_map(ITClass_db_role_notification_map db_role_notification_map_imp) : base() // CONSTRUCTOR
      {
      db_role_notification_map = db_role_notification_map_imp;
      }

    public void Bind(string sort_order, bool be_sort_order_descending, object target, out ArrayList crosstab_metadata)
      {
      db_role_notification_map.Bind(sort_order, be_sort_order_descending, target, out crosstab_metadata);
      }

    public void BindActuals(string sort_order, bool be_sort_order_ascending, object target)
      {
      db_role_notification_map.BindActuals(sort_order, be_sort_order_ascending, target);
      }

    public void Save(string member_id, string role_id, bool be_granted)
      {
      db_role_notification_map.Save(member_id, role_id, be_granted);
      }

    } // end TClass_biz_role_notification_map
  }
