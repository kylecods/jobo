
using Infrastructure;
using Infrastructure.Data;
using Infrastructure.Identity;
using jobo_api.Extensions;
using Microsoft.AspNetCore.Identity;


var builder = WebApplication.CreateBuilder(args);

//Configure auth
builder.AddAuthentication();
//builder.Services.AddAuthorizationBuilder().AddCurrentUserHandler();
            
//database configuration
builder.Services.ConfigureDbServices(builder.Configuration);

//Identity configuration
builder.Services.AddIdentity<ApplicationUser, IdentityRole>()
    .AddEntityFrameworkStores<JoboIdentityDbContext>();


// Add services to the container.
builder.Services.AddControllers();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

using var scope = app.Services.CreateScope();

var scopeProvider = scope.ServiceProvider;

try
{
    var joboContext = scopeProvider.GetRequiredService<JoboDbContext>();

    await JoboContextSeed.SeedAsync(joboContext);

    var userManager = scopeProvider.GetRequiredService<UserManager<ApplicationUser>>();
    var identityContext = scopeProvider.GetRequiredService<JoboIdentityDbContext>();

    await JoboIdentityDbContextSeed.SeedAsync(identityContext,userManager);

}catch(Exception)
{

}

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();


app.MapControllers();

app.Run();
   