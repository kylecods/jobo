using Core.Interfaces;
using Core.Repositories;
using Core.Specifications;
using Infrastructure.Entities;


namespace Core.Services
{
    public class JobsService : IJobsService
    {
        private readonly IRepository<Job> _jobsRepository;

        public JobsService(IRepository<Job> jobsRepository)
        {
            _jobsRepository = jobsRepository;
        }

        public async Task AddJobAsync(Job item)
        {
            await _jobsRepository.AddAsync(item);
        }

        public async Task DeleteJobAsync(Guid Id)
        {
            var jobSpec = new JobsByIdSpec(Id);

            var job = await _jobsRepository.FirstOrDefaultAsync(jobSpec);

            if (job != null)
            {
                await _jobsRepository.DeleteAsync(job);
            }
        }

        public async Task UpdateJobAsync(Job item)
        {
            await _jobsRepository.UpdateAsync(item);
        }
    }
}
