using Ardalis.Specification.EntityFrameworkCore;
using Core.Interfaces;
using Core.Repositories;

namespace Infrastructure.Data
{
    public class EfRepository<T> : RepositoryBase<T>, IReadRepository<T>, IRepository<T> where T : class
    {
        public EfRepository(JoboDbContext dbContext) : base(dbContext)
        {
        }
    }
}
