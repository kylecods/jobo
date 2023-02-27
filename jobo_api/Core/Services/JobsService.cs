using Core.Interfaces;
using Core.Repositories;
using Core.Entities;

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

        public async Task DeleteJobAsync(Guid id)
        {
            var job = await _jobsRepository.GetByIdAsync(id);

            if (job != null)
            {
                await _jobsRepository.DeleteAsync(job);
            }
        }

        public async Task<List<Job>> GetAllJobs()
        {
            var jobs = await _jobsRepository.ListAsync();

            return jobs ?? Enumerable.Empty<Job>().ToList();
        }

        public async Task UpdateJobAsync(Job item)
        {
            await _jobsRepository.UpdateAsync(item);
        }
    }
}
