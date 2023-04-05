using Postgrest.Models;
using Postgrest.Responses;
using Supabase;

namespace jobo_supabase_api.Services
{
    public class SupabaseService
    {
        private readonly Client _client;

        public SupabaseService(Client client)
        {
            _client = client;
        }

        public Task<ModeledResponse<TModel>> AddAsync<TModel>(TModel item) where TModel : BaseModel, new()
        {
            return _client.From<TModel>().Insert(item);
        }

        public Task<ModeledResponse<TModel>> GetAllAsync<TModel>() where TModel : BaseModel, new()
        {
            return _client.From<TModel>().Get();
        }
    }
}
