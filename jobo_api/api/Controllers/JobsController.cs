using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.RateLimiting;

namespace jobo_api.Controllers
{
    [Route("v1/jobs")]
    [Authorize("RequireCurrentUser")]
    [EnableRateLimiting("PerUserRatelimit")]
    public class JobsController : BaseController
    {
    }
}
