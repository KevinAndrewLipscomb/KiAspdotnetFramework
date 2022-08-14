using KiAspdotnetFramework;
using System;

namespace milestone_sweep
  {
  public partial class TWebForm_milestone_sweep : ki_web_ui.page_class
    {

    protected void Page_Load(object sender, EventArgs e)
      {
      new Biz().milestones.Sweep();
      }

    } // end TWebForm_milestone_sweep
  }
