using Class_db;
using Class_db_trail;
using System.Collections.Specialized;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_users
{
    public class TClass_db_users: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_users() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }

        internal bool AcceptAsMember(string shared_secret,string id)
          {
          var accept_as_member = false;
          object member_id_obj;
          //
          Open();
          member_id_obj = new MySqlCommand("select id from member where registration_code = \"" + shared_secret + "\"",connection).ExecuteScalar();
          if (member_id_obj != null)
            {
            new MySqlCommand("insert user_member_map set user_id = '" + id + "' , member_id = '" + member_id_obj.ToString() + "' on duplicate key update user_id = '" + id + "'",connection).ExecuteNonQuery();
            accept_as_member = true;
            }
          Close();
          return accept_as_member;
          }

        public bool BeAuthorized(string username, string encoded_password)
        {
            bool result;
            this.Open();
            result = null != new MySqlCommand("SELECT 1 FROM user" + " where username = \"" + username + "\"" + " and encoded_password_hash = SHA1('" + encoded_password + "') and be_active", this.connection).ExecuteScalar();
            this.Close();
            return result;
        }

        public bool BeRegisteredEmailAddress(string email_address)
        {
            bool result;
            this.Open();
            result = null != new MySqlCommand("SELECT 1 FROM user where password_reset_email_address = \"" + email_address + "\"", this.connection).ExecuteScalar();
            this.Close();
            return result;
        }

        public bool BeRegisteredUsername(string username)
        {
            bool result;
            this.Open();
            result = null != new MySqlCommand("SELECT 1 FROM user where username = \"" + username + "\"", this.connection).ExecuteScalar();
            this.Close();
            return result;
        }

        public bool BeStalePassword(string id)
        {
            bool result;
            this.Open();
            result = "1" == new MySqlCommand("SELECT be_stale_password FROM user where id=" + id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public bool Bind(string partial_username, object target)
        {
            bool result;
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            dr = new MySqlCommand("SELECT username FROM user WHERE username like \"" + partial_username + "%\" order by username", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["username"].ToString(), dr["username"].ToString()));
            }
            dr.Close();
            this.Close();
            result = ((target) as ListControl).Items.Count > 0;
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            MySqlDataReader dr;
            ((target) as ListControl).Items.Clear();
            if (unselected_literal != k.EMPTY)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
            }
            this.Open();
            dr = new MySqlCommand("select user.id as user_id" + " , name as user_name" + " from user" + " order by user_name", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["user_name"].ToString(), dr["user_id"].ToString()));
            }
            dr.Close();
            this.Close();
            if (selected_value != k.EMPTY)
            {
                ((target) as ListControl).SelectedValue = selected_value;
            }

        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- User --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public void Delete(string username)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("delete from user where username = \"" + username + "\""), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public bool Get(string username, out string encoded_password, out bool be_stale_password, out string password_reset_email_address, out bool be_active, out uint num_unsuccessful_login_attempts, out string last_login)
        {
            bool result;
            MySqlDataReader dr;

            encoded_password = k.EMPTY;
            be_stale_password = false;
            password_reset_email_address = k.EMPTY;
            be_active = false;
            num_unsuccessful_login_attempts = 0;
            last_login = k.EMPTY;
            result = false;
            this.Open();
            dr = new MySqlCommand("select username" + " , IFNULL(encoded_password_hash,\"\") as encoded_password" + " , be_stale_password" + " , password_reset_email_address" + " , be_active" + " , num_unsuccessful_login_attempts" + " , IFNULL(last_login,\"\") as last_login" + " from user" + " where username = \"" + username + "\"", this.connection).ExecuteReader();
            if (dr.Read())
            {
                username = dr["username"].ToString();
                encoded_password = dr["encoded_password"].ToString();
                be_stale_password = (dr["be_stale_password"].ToString() == "1");
                password_reset_email_address = dr["password_reset_email_address"].ToString();
                be_active = (dr["be_active"].ToString() == "1");
                num_unsuccessful_login_attempts = uint.Parse(dr["num_unsuccessful_login_attempts"].ToString());
                last_login = dr["last_login"].ToString();
                result = true;
            }
            dr.Close();
            this.Close();
            return result;
        }

        public string IdOf(string username)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select id from user where username = \"" + username + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public uint NumUnsuccessfulLoginAttemptsOf(string username)
        {
            uint result;
            this.Open();
            result = uint.Parse(new MySqlCommand("select num_unsuccessful_login_attempts from user where username = \"" + username + "\"", this.connection).ExecuteScalar().ToString());
            this.Close();
            return result;
        }

        public string PasswordResetEmailAddressOfId(string id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select password_reset_email_address from user where id = " + id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string PasswordResetEmailAddressOfUsername(string username)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select password_reset_email_address from user where username = \"" + username + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

    public string[] PrivilegesOf(string id)
      {
      var privilege_spec = k.EMPTY;
      var privileges_of_string_collection = new StringCollection();
      //
      //var role_member_map_scope_column_a_name = k.EMPTY;
      //var role_member_map_scope_column_b_name = k.EMPTY;
      //var role_member_map_scope_column_c_name = k.EMPTY;
      //
      Open();
      var dr = new MySqlCommand
        (
        "select distinct name"
        //+ " , IFNULL(role_member_map_scope_column_a_name,'') as role_member_map_scope_column_a_name" // such as system_id
        //+ " , IFNULL(role_member_map_scope_column_b_name,'') as role_member_map_scope_column_b_name" // such as region_code
        //+ " , IFNULL(role_member_map_scope_column_c_name,'') as role_member_map_scope_column_c_name" // such as service_id
        + " from user_member_map"
        +   " join role_member_map using (member_id)"
        +   " join role_privilege_map using (role_id)"
        +   " join privilege on (privilege.id=role_privilege_map.privilege_id)"
        + " where user_id = '" + id + "'"
        + " order by name",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        privilege_spec = dr["name"].ToString();
        //role_member_map_scope_column_a_name = dr["role_member_map_scope_column_a_name"].ToString();
        //role_member_map_scope_column_b_name = dr["role_member_map_scope_column_b_name"].ToString();
        //role_member_map_scope_column_c_name = dr["role_member_map_scope_column_c_name"].ToString();
        //if (role_member_map_scope_column_a_name.Length + role_member_map_scope_column_b_name.Length + role_member_map_scope_column_c_name.Length == 0)
        //  {
          privilege_spec += "/GENERALLY";
        //  }
        //else if (role_member_map_scope_column_a_name.Length > 0)
        //  {
        //  privilege_spec += "/role_member_map_scope_column_a_name=" + role_member_map_scope_column_a_name;
        //  }
        //else if (role_member_map_scope_column_b_name.Length > 0)
        //  {
        //  privilege_spec += "/role_member_map_scope_column_b_name=" + role_member_map_scope_column_b_name;
        //  }
        //else if (role_member_map_scope_column_c_name.Length > 0)
        //  {
        //  privilege_spec += "/role_member_map_scope_column_c_name=" + role_member_map_scope_column_c_name;
        //  }
        privileges_of_string_collection.Add(privilege_spec);
        }
      dr.Close();
      Close();
      var privileges_of = new string[privileges_of_string_collection.Count];
      privileges_of_string_collection.CopyTo(privileges_of,0);
      return privileges_of;
      }

        public void RecordSuccessfulLogin(string id)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update user" + " set num_unsuccessful_login_attempts = 0" + " , last_login = NOW()" + " where id = " + id), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void RecordUnsuccessfulLoginAttempt(string username)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update user" + " set num_unsuccessful_login_attempts = num_unsuccessful_login_attempts + 1" + " where username = \"" + username + "\""), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void RegisterNew(string username, string encoded_password, string email_address)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("insert into user" + " set username = \"" + username + "\"" + " , encoded_password_hash = SHA1('" + encoded_password + "')" + " , be_stale_password = FALSE" + " , password_reset_email_address = \"" + email_address + "\"" + " , last_login = NOW()"), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void Set(string username, bool be_stale_password, string password_reset_email_address, bool be_active)
          {
          var childless_field_assignments_clause = " be_stale_password = " + be_stale_password.ToString() + " , password_reset_email_address = '" + password_reset_email_address + "'" + " , be_active = " + be_active.ToString();
          db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
            (
            target_table_name:"user",
            key_field_name:"username",
            key_field_value:username,
            childless_field_assignments_clause:childless_field_assignments_clause
            );
          }

        public void SetEmailAddress(string id, string email_address)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE user " + "SET password_reset_email_address = \"" + email_address + "\"" + "WHERE id = " + id), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void SetPassword(string id, string encoded_password)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update user" + " set encoded_password_hash = SHA1('" + encoded_password + "')," + " be_stale_password = FALSE " + " where id = " + id), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void SetTemporaryPassword(string username, string encoded_password)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update user" + " set encoded_password_hash = SHA1('" + encoded_password + "')," + " be_stale_password = TRUE " + " where username = \"" + username + "\""), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public string UsernameOfEmailAddress(string email_address)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select username from user where password_reset_email_address = \"" + email_address + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

    } // end TClass_db_users

}
