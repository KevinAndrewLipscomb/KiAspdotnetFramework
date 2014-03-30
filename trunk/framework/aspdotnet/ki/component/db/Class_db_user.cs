using Class_db;
using kix;
using MySql.Data.MySqlClient;
using System.Collections.Specialized;

namespace Class_db_user
  {

  public class TClass_db_user: TClass_db
    {

    public TClass_db_user() : base()
      {
      }

    public string[] RolesForDisplayOf(string id)
      {
      var role_spec = k.EMPTY;
      var roles_for_display_of_string_collection = new StringCollection();
      //
      //var role_member_map_scope_column_a_name = k.EMPTY;
      //var role_member_map_scope_column_b_name = k.EMPTY;
      //var role_member_map_scope_column_c_name = k.EMPTY;
      //
      Open();
      var dr = new MySqlCommand
        (
        "select role.name as role_name"
        //+ " , IFNULL(role_member_map_scope_column_a_name,'') as role_member_map_scope_column_a_name" // such as system_id
        //+ " , IFNULL(role_member_map_scope_column_b_name,'') as role_member_map_scope_column_b_name" // such as region_code
        //+ " , IFNULL(role_member_map_scope_column_c_name,'') as role_member_map_scope_column_c_name" // such as service_id
        + " from role"
        +   " join role_member_map on (role_member_map.role_id=role.id)"
        +   " join user_member_map on (user_member_map.member_id=role_member_map.member_id)"
        + " where user_member_map.user_id = '" + id + "'",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        role_spec = dr["role_name"].ToString();
        //role_member_map_scope_column_a_name = dr["role_member_map_scope_column_a_name"].ToString();
        //role_member_map_scope_column_b_name = dr["role_member_map_scope_column_b_name"].ToString();
        //role_member_map_scope_column_c_name = dr["role_member_map_scope_column_c_name"].ToString();
        //if (role_member_map_scope_column_a_name.Length + role_member_map_scope_column_b_name.Length + role_member_map_scope_column_c_name.Length != 0)
        //  {
        //  if (role_member_map_scope_column_a_name.Length > 0)
        //    {
        //    role_spec += " for " + role_member_map_scope_column_a_name;
        //    }
        //  else if (role_member_map_scope_column_b_name.Length > 0)
        //    {
        //    role_spec += " for " + role_member_map_scope_column_b_name;
        //    }
        //  else if (role_member_map_scope_column_c_name.Length > 0)
        //    {
        //    role_spec += " for " + role_member_map_scope_column_c_name;
        //    }
        //  }
        roles_for_display_of_string_collection.Add(role_spec);
        }
      dr.Close();
      Close();
      var roles_of = new string[roles_for_display_of_string_collection.Count];
      roles_for_display_of_string_collection.CopyTo(roles_of,0);
      return roles_of;
      }

    public string[] RolesOf(string id)
      {
      var roles_of_string_collection = new StringCollection();
      Open();
      var dr = new MySqlCommand
        (
        "select name from role join role_member_map on (role_member_map.role_id=role.id) join user_member_map on (user_member_map.member_id=role_member_map.member_id) where user_member_map.user_id = '" + id + "'",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        roles_of_string_collection.Add(dr["name"].ToString());
        }
      dr.Close();
      Close();
      var roles_of = new string[roles_of_string_collection.Count];
      roles_of_string_collection.CopyTo(roles_of,0);
      return roles_of;
      }

    } // end TClass_db_user

  }
