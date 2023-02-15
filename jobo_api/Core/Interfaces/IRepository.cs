using Ardalis.Specification;

namespace Core.Repositories
{
    public interface IRepository<T> : IRepositoryBase<T> where T : class
    {
    }
}
