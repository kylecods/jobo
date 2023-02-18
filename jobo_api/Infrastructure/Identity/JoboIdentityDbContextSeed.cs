using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Infrastructure.Identity
{
    public class JoboIdentityDbContextSeed
    {

        public static async Task SeedAsync(JoboIdentityDbContext dbContext, UserManager<ApplicationUser> userManager) 
        {
            if(dbContext.Database.IsSqlServer())
            {
                dbContext.Database.Migrate();
            }

            var defaultUser = new ApplicationUser
            {
                UserName = "admin",
                Email = "admin@demo.com"
            };

            await userManager.CreateAsync(defaultUser);
        }
    }
}
