using Class_biz_involvements;
using Class_biz_members;
using Class_biz_milestones;
using Class_biz_notifications;
using Class_biz_privileges;
using Class_biz_quick_messages;
using Class_biz_role_member_map;
using Class_biz_role_member_map_logs;
using Class_biz_role_notification_map;
using Class_biz_role_privilege_map;
using Class_biz_roles;
using Class_biz_scheduled_tasks;
using Class_biz_subjoined_attributes;
using Class_biz_user;
using Class_biz_user_member_map;
using Class_biz_users;
using Class_db_involvements;
using Class_db_members;
using Class_db_milestones;
using Class_db_notifications;
using Class_db_privileges;
using Class_db_role_member_map;
using Class_db_role_member_map_logs;
using Class_db_role_notification_map;
using Class_db_role_privilege_map;
using Class_db_roles;
using Class_db_subjoined_attributes;
using Class_db_user;
using Class_db_user_member_map;
using Class_db_users;
using KiAspdotnetFramework.component.os;

namespace KiAspdotnetFramework
  {
  /// <summary>
  /// The composition root of the application
  /// </summary>
  public class Biz
    {

    private static readonly TClass_db_involvements db_involvements = new();
    private static readonly TClass_db_members db_members = new();
    private static readonly TClass_db_milestones db_milestones = new();
    private static readonly TClass_db_notifications db_notifications = new();
    private static readonly TClass_db_privileges db_privileges = new();
    private static readonly TClass_db_role_member_map db_role_member_map = new();
    private static readonly TClass_db_role_member_map_logs db_role_member_map_logs = new();
    private static readonly TClass_db_role_notification_map db_role_notification_map = new();
    private static readonly TClass_db_role_privilege_map db_role_privilege_map = new();
    private static readonly TClass_db_roles db_roles = new();
    private static readonly TClass_db_subjoined_attributes db_subjoined_attributes = new();
    private static readonly TClass_db_user db_user = new();
    private static readonly TClass_db_user_member_map db_user_member_map = new();
    private static readonly TClass_db_users db_users = new();
    private static readonly Class_fs fs = new();

    public TClass_biz_involvements involvements = new
      (
      db_involvements_imp:db_involvements
      );
    public TClass_biz_members members = new
      (
      db_members_imp:db_members
      );
    public TClass_biz_milestones milestones = new
      (
      db_milestones_imp:db_milestones
      );
    public TClass_biz_notifications notifications = new
      (
      db_notifications_imp:db_notifications
      );
    public TClass_biz_privileges privileges = new
      (
      db_privileges_imp:db_privileges
      );
    public TClass_biz_quick_messages quick_messages = new();
    public TClass_biz_role_member_map role_member_map = new
      (
      db_notifications_imp:db_notifications,
      db_role_member_map_imp:db_role_member_map,
      db_role_member_map_logs_imp:db_role_member_map_logs
      );
    public TClass_biz_role_member_map_logs role_member_map_logs = new
      (
      db_role_member_map_logs_imp:db_role_member_map_logs
      );
    public TClass_biz_role_notification_map role_notification_map = new
      (
      db_role_notification_map_imp:db_role_notification_map
      );
    public TClass_biz_role_privilege_map role_privilege_map = new
      (
      db_role_privilege_map_imp:db_role_privilege_map
      );
    public TClass_biz_roles roles = new
      (
      db_roles_imp:db_roles
      );
    public TClass_biz_scheduled_tasks scheduled_tasks = new
      (
      fs_imp:fs
      );
    public TClass_biz_subjoined_attributes subjoined_attributes = new
      (
      db_subjoined_attributes_imp:db_subjoined_attributes
      );
    public TClass_biz_user user = new
     (
     db_user_imp:db_user,
     db_users_imp:db_users
     );
    public TClass_biz_user_member_map user_member_map = new
      (
      db_user_member_map_imp:db_user_member_map
      );
    public TClass_biz_users users = new
      (
      db_members_imp:db_members,
      db_notifications_imp:db_notifications,
      db_users_imp:db_users
      );

    }
  }