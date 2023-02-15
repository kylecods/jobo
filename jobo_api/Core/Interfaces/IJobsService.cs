using Infrastructure.Entities;

namespace Core.Interfaces
{
    public interface IJobsService
    {
        Task AddJobAsync(Job item);
        
        Task UpdateJobAsync(Job item);

        Task DeleteJobAsync(Guid Id);
    }
}
