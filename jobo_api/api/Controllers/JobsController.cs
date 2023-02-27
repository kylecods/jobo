using Core.Entities;
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

                return TypedResults.Ok(new Response("Created successfully",null));

            }catch(Exception ex)
            {
                return TypedResults.BadRequest(new Response(ex.Message,null));
            }
        }

        [HttpGet("all")]
        public async Task<Results<Ok<Response>, BadRequest<Response>>> Get()
        {
            try
            {
                var jobs = await _jobsService.GetAllJobs();

                var jobsModel = jobs.Select(jobs => new JobsModel()
                {
                    JobDescription = jobs.JobDescription,
                    Id = jobs.Id,
                    Name = jobs.Name,
                    Country = jobs.Country,
                    Category = jobs.Category,
                    CreatedDate = jobs.CreatedDate

                }).ToList();

                return TypedResults.Ok(new Response("Sucess",jobsModel));

            }catch(Exception ex)
            {
                return TypedResults.BadRequest(new Response(ex.Message,null));
            }
        }
    }
}
