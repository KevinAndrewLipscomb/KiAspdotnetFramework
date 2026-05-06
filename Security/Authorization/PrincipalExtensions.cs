using System.Security.Claims;
using System.Security.Principal;

namespace OscarDotNet.Extensions
  {
  static public class PrincipalExtensions
    {

    static public ClaimsIdentity ClaimsIdentity(this IPrincipal principal) => (ClaimsIdentity)principal.Identity;

    }
  }
