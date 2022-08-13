using System;

namespace Class_db_milestones
  {
  public interface ITClass_db_milestones
    {
    void Check(uint code, out bool be_processed, out DateTime value);
    void MarkProcessed(uint code);
    }
  }