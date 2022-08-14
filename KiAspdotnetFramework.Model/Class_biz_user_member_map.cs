using Class_db_user_member_map;

namespace Class_biz_user_member_map
  {
  public class TClass_biz_user_member_map
    {

    private readonly ITClass_db_user_member_map db_user_member_map = null;

    public TClass_biz_user_member_map(ITClass_db_user_member_map db_user_member_map_imp) : base() // CONSTRUCTOR
      {
      db_user_member_map = db_user_member_map_imp;
      }

    public void BindActuals(string sort_order, bool be_sort_order_ascending, object target)
      {
      db_user_member_map.BindActuals(sort_order, be_sort_order_ascending, target);
      }

    public void Save(string member_id, string user_id, bool be_granted)
      {
      db_user_member_map.Save(member_id, user_id, be_granted);
      }

    } // end TClass_biz_user_member_map
  }
