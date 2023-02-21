using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using System.Text;

namespace jobo_api.Extensions
{
    public static class AuthenticationExtensions
    {
        public static WebApplicationBuilder AddAuthentication(this WebApplicationBuilder builder)
        {
            var authBuilder = builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme);

            authBuilder.AddJwtBearer(options =>
            {
                options.RequireHttpsMetadata = false;
                options.ForwardDefaultSelector = context => context.Request.Headers["X-Auth-Scheme"];
                options.SaveToken = false;
                options.TokenValidationParameters = new()
                {
                    ValidateIssuer = false,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes("SecretKeyOfDoomThatMustBeAMinimumNumberOfBytes")),
                    ValidateAudience = false
                };
            });

            var section = builder.Configuration.GetSection("Authentication:Schemes:Auth0");

            if (section.Exists())
            {
                authBuilder.AddJwtBearer("Auth0",options => {

                    options.Events = new JwtBearerEvents()
                    {
                        OnTokenValidated = context =>
                        {
                            if(context.Principal?.Identity is ClaimsIdentity identity)
                            {
                                identity.AddClaim(new("provider", "Auth0"));
                            }
                            return Task.CompletedTask;
                        }
                    };
                
                });
            }

            return builder;
        }
    }
}
