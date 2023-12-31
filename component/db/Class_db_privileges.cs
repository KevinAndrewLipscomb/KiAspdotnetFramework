using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Class_db_privileges
  {

  public class TClass_db_privileges: TClass_db
    {

    #pragma warning disable IDE0052 // Remove unread private members
    private readonly TClass_db_trail db_trail = null;
    #pragma warning restore IDE0052 // Remove unread private members

    //Constructor  Create()
    public TClass_db_privileges() : base()
      {
      // TODO: Add any constructor code here
      db_trail = new TClass_db_trail();
      }

    public bool Bind
      (
      string partial_name,
      object target
      )
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand("SELECT name FROM privilege WHERE name like '" + partial_name + "%' order by name", connection);
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), dr["name"].ToString()));
        }
      dr.Close();
      Close();
      return ((target) as ListControl).Items.Count > 0;
      }

    public void BindDirectToListControl
      (
      object target,
      string unselected_literal,
      string selected_value
      )
      {
      ((target) as ListControl).Items.Clear();
      if (unselected_literal.Length > 0)
        {
        ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
        }
      Open();
      using var my_sql_command = new MySqlCommand("select privilege.id as privilege_id, name as privilege_name from privilege order by privilege_name", connection);
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["privilege_name"].ToString(), dr["privilege_id"].ToString()));
        }
      dr.Close();
      Close();
      if (selected_value.Length > 0)
        {
        ((target) as ListControl).SelectedValue = selected_value;
        }
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
      soft_hyphenation_text = k.EMPTY;
      var result = false;
      Open();
      using var my_sql_command = new MySqlCommand("select * from privilege where CAST(name AS CHAR) = '" + name + "'", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        name = dr["name"].ToString();
        soft_hyphenation_text = dr["soft_hyphenation_text"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    internal bool HasForAnyScope
      (
      string member_id,
      string privilege_name
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select 1"
        + " from member"
        +   " join role_member_map on (role_member_map.member_id=member.id)"
        +   " join role on (role.id=role_member_map.role_id)"
        +   " join role_privilege_map on (role_privilege_map.role_id=role.id)"
        +   " join privilege on (privilege.id=role_privilege_map.privilege_id)"
        + " where member.id = '" + member_id + "'"
        +   " and privilege.name = '" + privilege_name + "'",
        connection
        );
      var has_for_any_scope_obj = my_sql_command.ExecuteScalar();
      Close();
      return (has_for_any_scope_obj != null);
      }

    } // end TClass_db_privileges

  }
