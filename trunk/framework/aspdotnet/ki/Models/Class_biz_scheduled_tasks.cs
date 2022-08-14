using KiAspdotnetFramework.component.os;

namespace Class_biz_scheduled_tasks
  {
  public class TClass_biz_scheduled_tasks
    {
    private readonly IClass_fs fs;

    public TClass_biz_scheduled_tasks(IClass_fs fs_imp) : base() // CONSTRUCTOR
      {
      fs = fs_imp;
      }

    public void DoDailyChores(string current_working_directory_spec)
      {
      fs.DeleteCondemnedFolders(current_working_directory_spec + "/../protected/attachment");
      }

    } // end TClass_biz_scheduled_tasks

  }