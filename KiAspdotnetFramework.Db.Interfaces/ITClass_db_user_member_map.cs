namespace Class_db_user_member_map
  {
  public interface ITClass_db_user_member_map
    {
    void BindActuals(string sort_order, bool be_sort_order_ascending, object target);
    void Save(string member_id, string user_id, bool be_granted);
    }
  }