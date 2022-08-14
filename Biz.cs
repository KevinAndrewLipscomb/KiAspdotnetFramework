using Class_biz_members;
using Class_biz_scheduled_tasks;
using Class_biz_user;
using Class_biz_users;
using Class_db_members;
using Class_db_user;
using Class_db_users;
using KiAspdotnetFramework.component.os;

namespace KiAspdotnetFramework
  {
  /// <summary>
  /// The composition root of the application
  /// </summary>
  public class Biz
    {

    private static readonly TClass_db_members db_members = new();
    private static readonly TClass_db_user db_user = new();
    private static readonly TClass_db_users db_users = new();
    private static readonly Class_fs fs = new();

    public TClass_biz_members members = new
      (
      db_members_imp:db_members
      );
    public TClass_biz_scheduled_tasks scheduled_tasks = new
      (
      fs_imp:fs
      );
    public TClass_biz_user user = new
     (
     db_user_imp:db_user,
     db_users_imp:db_users
     );
    public TClass_biz_users users = new
      (
      db_members_imp:db_members,
      db_users_imp:db_users
      );

    }
  }