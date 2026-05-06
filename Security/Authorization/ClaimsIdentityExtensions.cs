using OscarDotNet.component.db;
using OscarDotNet.Engine.Di;
using OscarDotNet.Engine.Security.Authorization;
using System.Security.Claims;

namespace OscarDotNet.Security.Authorization
  {
  static public class ClaimsIdentityExtensions
    {

    static internal void PopulateClaims
      (
      this ClaimsIdentity identity,
      Biz biz
      )
      {
      var user_id = biz.users.IdOf(identity.Name);
      identity.AddClaim(new(AppClaimType.UserId,user_id));
      //
      var member_id = biz.members.IdOfUserId(user_id);
      if (member_id.Length > 0)
        {
        //
        // Programmatic unique identifiers
        //
        identity.AddClaim(new(AppClaimType.MemberId,member_id));
        identity.AddClaim(new(ClaimTypes.Email,biz.members.EmailAddressOf(member_id)));
        //
        var member_summary = (member_summary)biz.members.Summary(member_id);
        //
        // Human names
        //
        var first_name = biz.members.FirstNameOf(member_summary);
        var last_name = biz.members.LastNameOf(member_summary);
        identity.AddClaim(new(ClaimTypes.GivenName,first_name));
        identity.AddClaim(new(ClaimTypes.Surname,last_name));
        identity.AddClaim(new(AppClaimType.DisplayName,$"{first_name} {last_name}"));
        //
        // Phone info
        //
        identity.AddClaim(new(ClaimTypes.OtherPhone,biz.members.PhoneNumOfSummary(member_summary)));
        identity.AddClaim(new(AppClaimType.SmsTarget,biz.members.SmsTargetOf(member_id)));
        //
        // Other singletons
        //
        identity.AddClaim(new(AppClaimType.AgencyId,biz.members.AgencyIdOf(member_summary)));
        //
        // Roles
        //
        var roles = biz.role_member_map.RolesOfMemberId(member_id);
        foreach (var role in roles)
          {
          identity.AddClaim(new(ClaimTypes.Role,role));
          }
        //
        // Privileges
        //
        var privileges = biz.users.PrivilegesOf(user_id);
        foreach (var privilege in privileges)
          {
          identity.AddClaim(new(AppClaimType.Privilege,privilege));
          }
        }
      }

    }
  }
