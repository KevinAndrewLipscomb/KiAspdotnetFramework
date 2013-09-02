using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_privileges
  {

  public class TClass_db_privileges: TClass_db
    {

    private TClass_db_trail db_trail = null;

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
      var dr = new MySqlCommand("SELECT name FROM privilege WHERE name like '" + partial_name + "%' order by name", connection).ExecuteReader();
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
      if (unselected_literal != k.EMPTY)
        {
        ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
        }
      Open();
      var dr = new MySqlCommand("select privilege.id as privilege_id, name as privilege_name from privilege order by privilege_name", connection).ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["privilege_name"].ToString(), dr["privilege_id"].ToString()));
        }
      dr.Close();
      Close();
      if (selected_value != k.EMPTY)
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
      var dr = new MySqlCommand("select * from privilege where CAST(name AS CHAR) = '" + name + "'", connection).ExecuteReader();
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

    internal bool HasGenerally
      (
      string member_id,
      string name
      )
      {
      Open();
      var has_generally = "1" == new MySqlCommand
        (
        "select IF(count(*) > 0 and (select count(*) from information_schema.COLUMNS WHERE TABLE_SCHEMA = '" + connection.Database + "' and TABLE_NAME = 'role_member_map' and COLUMN_NAME not in ('id','role_id','member_id')),1,0)"
        + " from role_member_map"
        +   " join role_privilege_map on (role_privilege_map.role_id=role_member_map.role_id)"
        + " where member_id = '" + member_id + "'"
        +   " and privilege.name = '" + name + "'",
        connection
        )
        .ExecuteScalar().ToString();
      Close();
      return has_generally;
      }

    } // end TClass_db_privileges

  }
