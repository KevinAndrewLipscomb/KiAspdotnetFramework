using System.IO;

namespace KiAspdotnetFramework.component.os
  {
  public class Class_fs : IClass_fs
    {

    public static class Static
      {
      public const string FOLDER_CONDEMNATION_FLAG_FILE_NAME = "_folder_condemned.kaf";
      public const string WWWROOT = "c:\\inetpub\\wwwroot\\";
      }

    public void CondemnFolder(string spec)
      {
      if (Directory.Exists(spec))
        {
        using var the_file = File.Create(spec + "\\" + Static.FOLDER_CONDEMNATION_FLAG_FILE_NAME);
        }
      }

    public void DeleteCondemnedFolders(string path)
      {
      var flag_file_spec_array = Directory.GetFiles(path, Static.FOLDER_CONDEMNATION_FLAG_FILE_NAME, SearchOption.AllDirectories);
      foreach (var flag_file_spec in flag_file_spec_array)
        {
        try
          {
          Directory.Delete(Path.GetDirectoryName(flag_file_spec), true);
          }
        catch (IOException)
          {
          }
        }
      }

    }
  }
