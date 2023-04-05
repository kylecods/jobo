using jobo_supabase_api;
using jobo_supabase_api.Models;
using jobo_supabase_api.Services;
using Supabase;
using System.Net;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//configure supabase
var settings = new AppSettings();

ConfigurationBinder.Bind(builder.Configuration.GetSection("AppSettings"),settings);

var options = new SupabaseOptions()
{
    AutoRefreshToken = true,
    AutoConnectRealtime = true
};

builder.Services.AddScoped(_ => new Client(settings.SupabaseUrl!,settings.SupabaseKey,options));

//add services
builder.Services.AddScoped<SupabaseService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapPost("/jobs/create", async (SupabaseService service, JobsRequest jobRequest) =>
{
    try
    {
        var request = new JobsModel()
        {
            Id = Guid.NewGuid(),
            Name = jobRequest.Name!,
            Description = jobRequest.JobDescription!,
            Category = jobRequest.Category,
            Country = jobRequest.Country,
            CreatedAt = DateTime.UtcNow,
        };

        var response = await service.AddAsync(request);

        var model = response.Models.FirstOrDefault();

        return Results.Ok(new { Id = model?.Id.ToString(), Message = "Posted successfully" });
    }
    catch(Postgrest.RequestException ex) 
    {

        var result = ex.Response.StatusCode switch
        {
            HttpStatusCode.Unauthorized => Results.Unauthorized(),
            _ => Results.BadRequest(new { StatusCode = 400, Message = $"Failed: {ex.Message}" })
        };
        return result;
    }
});

app.MapGet("/jobs/all", async (SupabaseService service) =>
{
    try
    {
        var response = await service.GetAllAsync<JobsModel>();

        var result = response.Models.Select(data => new
        {
            data.Name,
            data.Description,
            data.Category,
            data.Country,
            data.CreatedAt
        }).ToList();

        return Results.Ok(new { Message = "Success", data = result });

    }catch(Postgrest.RequestException ex)
    {

        var result = ex.Response.StatusCode switch
        {
            HttpStatusCode.Unauthorized => Results.Unauthorized(),
            _ => Results.BadRequest(new { StatusCode = 400, Message = $"Failed: {ex.Message}" })
        };

        return result;
    }
});

app.Run();
