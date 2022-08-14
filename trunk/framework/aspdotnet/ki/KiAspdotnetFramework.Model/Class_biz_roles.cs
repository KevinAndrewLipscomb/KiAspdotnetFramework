using Class_db_roles;
using kix;

namespace Class_biz_roles
  {
  public class TClass_biz_roles
    {

    private readonly ITClass_db_roles db_roles = null;

    public TClass_biz_roles(ITClass_db_roles db_roles_imp) : base() // CONSTRUCTOR
      {
      db_roles = db_roles_imp;
      }

    public bool Bind(string partial_name, object target)
      {
      bool result;
      result = db_roles.Bind(partial_name, target);
      return result;
      }

    public void BindDirectToListControl
      (
      object target,
      bool has_config_roles_and_matrices,
      string unselected_literal = "-- Role --",
      string selected_value = k.EMPTY
      )
      {
      db_roles.BindDirectToListControl(target, has_config_roles_and_matrices, unselected_literal, selected_value);
      }

    public bool Delete(string name)
      {
      bool result;
      result = db_roles.Delete(name);
      return result;
      }

    public bool Get(string name, out string soft_hyphenation_text, out string pecking_order)
      {
      bool result;
      result = db_roles.Get(name, out soft_hyphenation_text, out pecking_order);

      return result;
      }

    public string NameOfId(string id)
      {
      string result;
      result = db_roles.NameOfId(id);
      return result;
      }

    public void Set(string name, string soft_hyphenation_text, string pecking_order)
      {
      db_roles.Set(name, soft_hyphenation_text, pecking_order);

      }

    } // end TClass_biz_roles
  }
