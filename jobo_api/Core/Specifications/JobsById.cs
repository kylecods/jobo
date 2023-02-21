using Ardalis.Specification;
using Core.Entities;

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
