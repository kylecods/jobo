using Core.Interfaces;
using jobo_api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using System.ComponentModel.DataAnnotations;

namespace jobo_api.Controllers
{
    [Route("jobs/")]
    [Authorize("RequireCurrentUser")]
    [EnableRateLimiting("PerUserRatelimit")]
    public class JobsController : BaseController
    {
        private readonly IJobsService _jobsService;

        public JobsController(IJobsService jobsService)
        {
            _jobsService = jobsService;
        }

       
        [HttpPost("create")]
        public async Task<Results<Ok<Response>, BadRequest<Response>>> Post([Required]JobsModel jobsModel)
        {
            var job = jobsModel.ToJob();

            try
            {
                await _jobsService.AddJobAsync(job);

                return TypedResults.Ok(new Response("Created successfully"));

            }catch(Exception ex)
            {
                return TypedResults.BadRequest(new Response(ex.Message));
            }
        }
    }
}
