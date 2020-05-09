using Class_biz_notifications;
using Class_db_role_member_map;
using Class_db_role_member_map_logs;
using System.Collections;

namespace Class_biz_role_member_map
  {
  public class TClass_biz_role_member_map
    {
        private readonly TClass_biz_notifications biz_notifications = null;
        private readonly TClass_db_role_member_map db_role_member_map = null;
        private readonly TClass_db_role_member_map_logs db_role_member_map_logs = null;

        public TClass_biz_role_member_map() : base()
        {
            biz_notifications = new TClass_biz_notifications();
            db_role_member_map = new TClass_db_role_member_map();
            db_role_member_map_logs = new TClass_db_role_member_map_logs();
        }

        public bool BePrivilegedToModifyTuple(bool has_config_roles_and_matrices, bool has_assign_roles_to_members, string role_natural_text)
        {
            bool result;
            result = has_config_roles_and_matrices || ((role_natural_text != "Application Administrator") && has_assign_roles_to_members);
            return result;
        }

        public void Bind(string sort_order, bool be_sort_order_descending, object target, out ArrayList crosstab_metadata)
        {
            db_role_member_map.Bind(sort_order, be_sort_order_descending, target, out crosstab_metadata);
        }

        public void BindActuals(string sort_order, bool be_sort_order_ascending, object target)
        {
            db_role_member_map.BindActuals(sort_order, be_sort_order_ascending, target);
        }

        public void BindHolders(string role_name, object target, string sort_order, bool be_sort_order_ascending)
        {
            db_role_member_map.BindHolders(role_name, target, sort_order, be_sort_order_ascending);
        }

        public void Save(string member_id, string role_id, bool be_granted)
        {
            db_role_member_map.Save(member_id, role_id, be_granted);
            db_role_member_map_logs.Enter
              (
              subject_member_id:member_id,
              be_granted:be_granted,
              role_id:role_id
              );
            biz_notifications.IssueForRoleChange(member_id, role_id, be_granted);
        }

    } // end TClass_biz_role_member_map

}
