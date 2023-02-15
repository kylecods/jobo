using Infrastructure.Data;
using Infrastructure.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Infrastructure
{
    public static class Dependencies
    {
        public static void ConfigureDbServices(this IServiceCollection services,IConfiguration configuration)
        {
            services.AddDbContext<JoboDbContext>(options => options.UseSqlServer(configuration.GetConnectionString("IdentityConnection")));

            services.AddDbContext<JoboIdentityDbContext>(options => options.UseSqlServer(configuration.GetConnectionString("IdentityConnection")));
        }
    }
}
