using Infrastructure.Identity;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace jobo_api.Extensions
{
    public static class AuthorizationExtensions
    {
        public static AuthorizationBuilder AddCurrentUserHandler(this AuthorizationBuilder builder)
        {
            builder.Services.AddScoped<IAuthorizationHandler, CheckCurrentUserAuthHandler>();
            return builder;
        }

        public static AuthorizationPolicyBuilder RequireCurrentUser(this AuthorizationPolicyBuilder builder)
        {
            return builder.RequireAuthenticatedUser()
                .AddRequirements(new CheckUserRequirement());
        }

        private class CheckUserRequirement : IAuthorizationRequirement { }

        private class CheckCurrentUserAuthHandler : AuthorizationHandler<CheckUserRequirement>
        {
            private readonly CurrentUser _currentUser;

            public CheckCurrentUserAuthHandler(CurrentUser currentUser) => _currentUser = currentUser;
            protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, CheckUserRequirement requirement)
            {
                if(_currentUser.User is not null)
                {
                    context.Succeed(requirement);
                }

                return Task.CompletedTask;
            }
        }
    }

    public class CurrentUser
    {
        public ApplicationUser? User { get; set; }

        public ClaimsPrincipal Principal { get; set; } = default!;

        public string Id => Principal.FindFirstValue(ClaimTypes.NameIdentifier)!;

        public bool IsAdmin => Principal.IsInRole("admin");
    }
}
