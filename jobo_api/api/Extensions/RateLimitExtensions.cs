using System.Security.Claims;
using System.Threading.RateLimiting;

namespace jobo_api.Extensions
{
    public static class RateLimitExtensions
    {
        private static readonly string Policy = "PerUserRatelimit";

        public static IServiceCollection AddRateLimiting(this IServiceCollection services)
        {
            return services.AddRateLimiter(options =>
            {
                options.RejectionStatusCode = StatusCodes.Status429TooManyRequests;

                options.AddPolicy(Policy, context =>
                {
                    var userName = context.User.FindFirstValue(ClaimTypes.NameIdentifier)!;

                    return RateLimitPartition.GetTokenBucketLimiter(userName, key =>
                    {
                        return new TokenBucketRateLimiterOptions()
                        {
                            ReplenishmentPeriod = TimeSpan.FromSeconds(10),
                            AutoReplenishment = true,
                            TokenLimit = 100,
                            TokensPerPeriod = 100,
                            QueueLimit = 100,
                        };
                    });
                });
            });
        }

    }
}
