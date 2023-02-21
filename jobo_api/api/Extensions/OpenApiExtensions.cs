using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.OpenApi.Models;

namespace jobo_api.Extensions
{
    public static class OpenApiExtensions
    {
        public static IApplicationBuilder AddOpenApiSecurityRequirement(this IApplicationBuilder builder)
        {
            var scheme = new OpenApiSecurityScheme()
            {
                Type = SecuritySchemeType.Http,
                Name = JwtBearerDefaults.AuthenticationScheme,
                Scheme = JwtBearerDefaults.AuthenticationScheme,
                Reference = new OpenApiReference()
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = JwtBearerDefaults.AuthenticationScheme,
                }
            };
           return builder;
        }
    }
}
