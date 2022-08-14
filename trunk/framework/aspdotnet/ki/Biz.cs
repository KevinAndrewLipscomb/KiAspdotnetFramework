using Class_biz_scheduled_tasks;
using KiAspdotnetFramework.component.os;

namespace KiAspdotnetFramework
  {
  /// <summary>
  /// The composition root of the application
  /// </summary>
  public static class Biz
    {

    public static TClass_biz_scheduled_tasks scheduled_tasks()
      {
      return new TClass_biz_scheduled_tasks
        (
        fs_imp:new Class_fs()
        );
      }

    }
  }