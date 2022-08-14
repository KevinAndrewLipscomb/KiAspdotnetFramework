using Class_biz_scheduled_tasks;
using Class_biz_users;
using Class_db_members;
using Class_db_users;
using KiAspdotnetFramework.component.os;

namespace KiAspdotnetFramework
  {
  /// <summary>
  /// The composition root of the application
  /// </summary>
  public static class Biz
    {

    public static TClass_biz_scheduled_tasks scheduled_tasks = new
      (
      fs_imp:new Class_fs()
      );

    public static TClass_biz_users users = new
      (
      db_members_imp:new TClass_db_members(),
      db_users_imp:new TClass_db_users()
      );

    }
  }