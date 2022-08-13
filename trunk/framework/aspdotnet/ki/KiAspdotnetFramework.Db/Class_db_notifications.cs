using Class_db;
using kix;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Class_db_notifications
  {

  public class TClass_db_notifications : TClass_db, ITClass_db_notifications
    {

    #pragma warning disable IDE0052 // Remove unread private members
    private readonly string tier_2_match_field = k.EMPTY;
    private readonly string tier_3_match_field = k.EMPTY;
    #pragma warning restore IDE0052 // Remove unread private members

    //Constructor  Create()
    public TClass_db_notifications() : base()
      {
      tier_2_match_field = ConfigurationManager.AppSettings["tier_2_match_field"];
      tier_3_match_field = ConfigurationManager.AppSettings["tier_3_match_field"];
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
      using var my_sql_command = new MySqlCommand("select notification.id as notification_id" + " , name as notification_name" + " from notification" + " order by notification_name",connection);
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["notification_name"].ToString(), dr["notification_id"].ToString()));
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
      BindDirectToListControl(target,unselected_literal,selected_value:k.EMPTY);
      }
    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target,unselected_literal:"-- Notification --");
      }

    public string TargetOf
      (
      #pragma warning disable CA1801 // Remove unused parameter
      string name,
      string member_id
      #pragma warning restore CA1801 // Remove unused parameter
      )
      {
      // tier_2_match_value: string;
      // tier_3_match_value: string;
      var target_of = k.EMPTY;
      Open();
      // //
      // // Get tier 2 and 3 associations of target member.
      // //
      // dr := MySqlCommand.Create
      // ('select ' + tier_2_match_field + k.COMMA + tier_3_match_field + ' from member where id = "' + member_id + '"',connection).ExecuteReader();
      // dr.Read();
      // tier_2_match_value := dr[tier_2_match_field].ToString();
      // tier_3_match_value := dr[tier_3_match_field].ToString();
      // dr.Close();
      // Tier 1 stakeholders
      // + ' where tier_id = 1'
      using var my_sql_command = new MySqlCommand("select email_address" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)" + " join role on (role.id=role_member_map.role_id)" + " join notification on (notification.id=role_notification_map.notification_id)" + " and notification.name = \"" + name + "\"",connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr != null)
        {
        while (dr.Read())
          {
          target_of = target_of + dr["email_address"].ToString() + k.COMMA;
          }
        }
      dr.Close();
      // //
      // // Tier 2 stakeholders
      // //
      // dr := MySqlCommand.Create
      // (
      // 'select email_address'
      // + ' from member'
      // +   ' join role_member_map on (role_member_map.member_id=member.id)'
      // +   ' join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)'
      // +   ' join role on (role.id=role_member_map.role_id)'
      // +   ' join notification on (notification.id=role_notification_map.notification_id)'
      // + ' where tier_id = 2'
      // +   ' and ' + tier_2_match_field + ' = ' + tier_2_match_value
      // +   ' and notification.name = "' + name + '"',
      // connection
      // )
      // .ExecuteReader();
      // if dr <> nil then begin
      // while dr.Read do begin
      // target_of := target_of + dr['email_address'].ToString() + k.COMMA;
      // end;
      // end;
      // dr.Close();
      // //
      // // Tier 3 stakeholders
      // //
      // dr := MySqlCommand.Create
      // (
      // 'select email_address'
      // + ' from member'
      // +   ' join role_member_map on (role_member_map.member_id=member.id)'
      // +   ' join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)'
      // +   ' join role on (role.id=role_member_map.role_id)'
      // +   ' join notification on (notification.id=role_notification_map.notification_id)'
      // + ' where tier_id = 3'
      // +   ' and ' + tier_2_match_field + ' = ' + tier_2_match_value
      // +   ' and ' + tier_3_match_field + ' = ' + tier_3_match_value
      // +   ' and notification.name = "' + name + '"',
      // connection
      // )
      // .ExecuteReader();
      // if dr <> nil then begin
      // while dr.Read do begin
      // target_of := target_of + dr['email_address'].ToString() + k.COMMA;
      // end;
      // end;
      // dr.Close();
      Close();
      return (target_of.Length > 0 ? target_of.Substring(0, target_of.Length - 1) : k.EMPTY);
      }

    } // end TClass_db_notifications

  }
