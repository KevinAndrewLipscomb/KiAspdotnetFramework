using KiAspdotnetFramework;
using System;
using System.Web;

namespace daily_tasks
  {
  public partial class TWebForm_daily_tasks : ki_web_ui.page_class
    {

    protected void Page_Load(object sender, EventArgs e)
      {
      Biz.scheduled_tasks.DoDailyChores(HttpContext.Current.Server.MapPath("."));
      }

    protected override void OnInit(EventArgs e)
      {
      base.OnInit(e);
      }

    }
  }
