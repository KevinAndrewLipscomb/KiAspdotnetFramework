using Class_db_milestones;
using kix;
using System;
using System.Collections;

namespace Class_biz_milestones
  {
  public class TClass_biz_milestones
    {

    private enum milestone_type
      {
      FIRST_MILESTONE = 1,
      SECOND_MILESTONE = 2,
      }

    private struct reminder_control_record_type
      {
      public int num_reminders;
      public int[] relative_day_num_array;
      }

    private static class Static
      {
      public const int MAX_NUM_REMINDERS = 6;
      public static reminder_control_record_type[] REMINDER_CONTROL_TABLE =
        {
        new reminder_control_record_type {num_reminders = 6, relative_day_num_array = new int[MAX_NUM_REMINDERS] {1, 3, 7, 14, 30, 90}}, // FIRST_MILESTONE
        new reminder_control_record_type {num_reminders = 6, relative_day_num_array = new int[MAX_NUM_REMINDERS] {1, 3, 7, 14, 30, 90}}  // SECOND_MILESTONE
        };
      }

    private readonly ITClass_db_milestones db_milestones = null;

    public TClass_biz_milestones(ITClass_db_milestones db_milestones_imp) : base() // CONSTRUCTOR
      {
      db_milestones = db_milestones_imp;
      }

    public void Sweep()
      {
      bool be_processed;
      DateTime deadline;
      var i = new k.int_nonnegative();
      // var j = new k.int_positive();
      var master_id = k.EMPTY;
      Queue master_id_q = null;
      var relative_day_num = new k.int_nonnegative();
      foreach (var milestone in Enum.GetValues(typeof(milestone_type)) as milestone_type[])
        {
        db_milestones.Check((uint)(milestone), out be_processed, out deadline);
        if (!be_processed)
          {
          if ((DateTime.Today > deadline))
            {
            if (milestone == milestone_type.FIRST_MILESTONE)
              {
              }
            else if (milestone == milestone_type.SECOND_MILESTONE)
              {
              }
            for (i.val = 1; i.val <= master_id_q.Count; i.val++)
              {
              master_id = master_id_q.Dequeue().ToString();
              //new Biz().users.MakeDeadlineFailureNotification;
              }
            db_milestones.MarkProcessed((uint)(milestone));
            }
          else
            {
            var be_handled = false;
            i.val = 0;
            while (!be_handled && (i.val < Static.REMINDER_CONTROL_TABLE[(int)milestone].num_reminders))
              {
              relative_day_num.val = Static.REMINDER_CONTROL_TABLE[(int)milestone].relative_day_num_array[i.val];
              if (DateTime.Today == deadline.AddDays(-relative_day_num.val).Date)
                {
                // master_id_q := biz_emsof_requests.SusceptibleTo(milestone);
                // for j.val := 1 to master_id_q.Count do begin
                // master_id := master_id_q.Dequeue.ToString();
                // biz_users.Remind(milestone,relative_day_num,deadline,biz_emsof_requests.Kind1IdOfMasterId(master_id));
                // be_handled := TRUE;
                // end;
                }
              i.val++;
              }
            }
          }
        }
      }

    } // end TClass_biz_milestones

  }
