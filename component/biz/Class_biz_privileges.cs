using Class_biz_user;
using Class_db_members;
using Class_db_privileges;
using kix;

namespace Class_biz_privileges
  {

  public class TClass_biz_privileges
    {

    private TClass_biz_user biz_user = null;
    private TClass_db_members db_members = null;
    private TClass_db_privileges db_privileges = null;

    public TClass_biz_privileges() : base()
      {
      // TODO: Add any constructor code here
      biz_user = new TClass_biz_user();
      db_members = new TClass_db_members();
      db_privileges = new TClass_db_privileges();
      }

    public bool Bind
      (
      string partial_name,
      object target
      )
      {
      return db_privileges.Bind(partial_name, target);
      }

    public void BindDirectToListControl
      (
      object target,
      string unselected_literal,
      string selected_value
      )
      {
      db_privileges.BindDirectToListControl(target, unselected_literal, selected_value);
      }
    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target, unselected_literal, selected_value:k.EMPTY);
      }
    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target, unselected_literal:"-- Privilege --");
      }

    public bool Get
      (
      string name,
      out string soft_hyphenation_text
      )
      {
      return db_privileges.Get(name, out soft_hyphenation_text);
      }

    public bool HasGenerally(string name)
      {
      return db_privileges.HasGenerally
        (
        member_id:db_members.IdOfUserId(biz_user.IdNum()),
        name:name
        );
      }

    } // end TClass_biz_privileges

  }
