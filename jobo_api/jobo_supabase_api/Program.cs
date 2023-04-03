using jobo_supabase_api;
using jobo_supabase_api.Models;
using Supabase;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
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

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapPost("/jobs/create", async (Client client, JobsRequest jobRequest) =>
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

    var response = await client.From<JobsModel>().Insert(request);

    var model = response.Models.FirstOrDefault();

    return Results.Ok(new {Id = model?.Id.ToString(),Message = "Posted successfully"});
});

app.MapGet("/jobs/all", async (Client client) =>
{
    var response = await client.From<JobsModel>().Get();

    var result = response.Models.Select(data => new
    {
        data.Name,
        data.Description,
        data.Category,
        data.Country,
        data.CreatedAt
    }).ToList();

    return Results.Ok(new { Message = "Success", data = result });
});

app.Run();
