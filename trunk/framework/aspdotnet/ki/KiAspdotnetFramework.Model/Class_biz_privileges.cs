using Class_db_privileges;
using kix;

namespace Class_biz_privileges
  {

  public class TClass_biz_privileges
    {

    private readonly ITClass_db_privileges db_privileges = null;

    public TClass_biz_privileges(ITClass_db_privileges db_privileges_imp) : base() // CONSTRUCTOR
      {
      db_privileges = db_privileges_imp;
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

    internal bool HasForAnyScope
      (
      string member_id,
      string privilege_name
      )
      {
      return db_privileges.HasForAnyScope(member_id,privilege_name);
      }

    } // end TClass_biz_privileges

  }
