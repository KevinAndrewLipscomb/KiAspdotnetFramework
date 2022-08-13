using System;

namespace Class_db_user
  {
  public interface ITClass_db_user
    {
    void BindNotificationsToBaseDataList(string id, object target);
    void BindPrivilegesToBaseDataList(string id, object target);
    void BindRolesToBaseDataList(string id, object target);
    DateTime LastLoginTime(string id);
    string[] RolesOf(string id);
    }
  }