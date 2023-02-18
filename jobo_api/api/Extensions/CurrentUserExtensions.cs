using Infrastructure.Identity;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;

namespace jobo_api.Extensions
{
    public static class CurrentUserExtensions
    {
        public static IServiceCollection AddCurrentUser(this IServiceCollection services)
        {
            services.AddScoped<CurrentUser>();
            services.AddScoped<IClaimsTransformation, ClaimsTransformation>();
            return services;
        }

        private sealed class ClaimsTransformation : IClaimsTransformation
        {
            private readonly CurrentUser _currentUser;
            private readonly UserManager<ApplicationUser> _userManager;
            public ClaimsTransformation(CurrentUser currentUser, UserManager<ApplicationUser> userManager) 
            {

                _currentUser = currentUser;
                _userManager = userManager;
            
            }

            public async Task<ClaimsPrincipal> TransformAsync(ClaimsPrincipal principal)
            {
                _currentUser.Principal = principal;

                var loginProvider = principal.FindFirstValue("provider");

                if(principal.FindFirstValue(ClaimTypes.NameIdentifier) is { Length: > 0} name)
                {
                    _currentUser.User = loginProvider is null ? await _userManager.FindByNameAsync(name) 
                        : await _userManager.FindByLoginAsync(loginProvider,name);
                }

                return principal;
            }
        }
    }
}
