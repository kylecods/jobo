using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Infrastructure.Data
{
    public class JoboContextSeed
    {
        public static async Task SeedAsync(JoboDbContext joboDbContext)
        {
            if (joboDbContext.Database.IsSqlServer())
            {
                await joboDbContext.Database.MigrateAsync();
            }
        }
    }
}
