using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Infrastructure.Entities;

namespace jobo_api.Repositories
{
    public class JobsRepository : IJobsRepository
    {
        public Task AddAsync(Job item)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Job>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<Job> GetByIdAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(Job item)
        {
            throw new NotImplementedException();
        }
    }
}
