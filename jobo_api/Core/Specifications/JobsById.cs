using Ardalis.Specification;
using Infrastructure.Entities;

namespace Core.Specifications
{
    public sealed class JobsByIdSpec : Specification<Job>
    {
        public JobsByIdSpec(Guid id) {

            Query
                .Where(jobs => jobs.Id == id);
        }
    }
}
