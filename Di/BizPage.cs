using ki_web_ui;
using OscarDotNet.Engine.Di;
using System.Web;

namespace OscarDotNet.Di
  {
  public abstract class BizPage : page_class
    {

    static protected readonly Biz biz = (Biz)HttpContext.Current.Items["biz"];
    static protected readonly Ss ss = (Ss)HttpContext.Current.Items["ss"];
    static protected readonly Os os = (Os)HttpContext.Current.Items["os"];

    }
  }
