using Infrastructure.Identity;
using jobo_api.Models;
using jobo_api.Services;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using System.ComponentModel.DataAnnotations;

namespace jobo_api.Controllers
{
    [Route("v1")]
    [EnableRateLimiting("PerUserRatelimit")]
    public class AuthController : BaseController
    {
        private readonly ITokenService _tokenService;

        private readonly UserManager<ApplicationUser> _userManager;

        public AuthController(ITokenService tokenService, UserManager<ApplicationUser> userManager) 
        { 
            _tokenService = tokenService;

            _userManager = userManager;
        }

        [HttpPost]
        [Route("token")]
        public async Task<Results<Ok<AuthTokenModel>,BadRequest<AuthTokenResponse>>> Token([Required]UserModel userModel)
        {
            var user = await _userManager.FindByNameAsync(userModel.Username);

            if(user is null || !await _userManager.CheckPasswordAsync(user, userModel.Password))
            {
                return TypedResults.BadRequest(new AuthTokenResponse("Either the user does not exist or the password is invalid"));
            }

            var token = _tokenService.GenerateToken(userModel.Username);

            return TypedResults.Ok(new AuthTokenModel(token));
        }
    }
}
