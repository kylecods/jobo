using System.Collections.Generic;
using System.Threading.Tasks;

namespace jobo_api.Repositories
{
    public interface IRepository<TItem, TId> where TItem : class
    {
        Task AddAsync(TItem item);

        Task UpdateAsync(TItem item);

        Task DeleteAsync(TId id);

        Task<TItem> GetByIdAsync(TId id);

        Task<IEnumerable<TItem>> GetAllAsync();
    }
}
