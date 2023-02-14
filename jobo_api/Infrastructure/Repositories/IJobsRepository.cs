using System;
using Infrastructure.Entities;


namespace jobo_api.Repositories
{
    public interface IJobsRepository : IRepository<Job,Guid>
    {
    }
}
