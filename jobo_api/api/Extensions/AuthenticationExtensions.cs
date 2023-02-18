using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace jobo_api.Extensions
{
    public static class AuthenticationExtensions
    {
        public static WebApplicationBuilder AddAuthentication(this WebApplicationBuilder builder)
        {
            var authBuilder = builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme);

            authBuilder.AddJwtBearer(options =>
            {
                options.ForwardDefaultSelector = context => context.Request.Headers["X-Auth-Scheme"];
            });

            return builder;
        }
    }
}
