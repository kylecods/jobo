using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Globalization;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace jobo_api.Services
{
    public interface ITokenService
    {
        string GenerateToken(string username, bool isAdmin = false);
    }
    public class TokenService : ITokenService
    {
        private readonly string _issuer;
        private readonly Claim[] _audiences;
        private readonly SigningCredentials _signingCredentials;

        public TokenService(IAuthenticationConfigurationProvider authenticationConfigurationProvider)
        {
            var bearerSection = authenticationConfigurationProvider.GetSchemeConfiguration(JwtBearerDefaults.AuthenticationScheme);

            var section = bearerSection.GetSection("SigningKeys:0");

            _issuer = bearerSection["ValidIssuer"] ?? throw new InvalidOperationException("Issuer is not specified");

            //var signingKeyBase64 = section["Value"] ?? throw new InvalidOperationException("Signing key is not specified");

            var signingKeyBytes = Convert.FromBase64String("");

            _signingCredentials = new SigningCredentials(new SymmetricSecurityKey(Encoding.ASCII.GetBytes("SecretKeyOfDoomThatMustBeAMinimumNumberOfBytes")), SecurityAlgorithms.HmacSha256Signature);

            _audiences = bearerSection.GetSection("ValidAudiences").GetChildren()
                .Where(s => !string.IsNullOrEmpty(s.Value))
                .Select(s => new Claim(JwtRegisteredClaimNames.Aud, s.Value!))
                .ToArray();
        }
        public string GenerateToken(string username, bool isAdmin = false)
        {
            var identity = new ClaimsIdentity(JwtBearerDefaults.AuthenticationScheme);

            identity.AddClaim(new Claim(JwtRegisteredClaimNames.Sub, username));

            var id = Guid.NewGuid().ToString().GetHashCode().ToString("x", CultureInfo.InvariantCulture);

            identity.AddClaim(new Claim(JwtRegisteredClaimNames.Jti, id));

            if(isAdmin)
            {
                identity.AddClaim(new Claim(ClaimTypes.Role, "admin"));
            }

            identity.AddClaims(_audiences);

            var handler = new JwtSecurityTokenHandler();

            var jwtToken = handler.CreateJwtSecurityToken(_issuer, null, identity, DateTime.UtcNow, DateTime.UtcNow.AddMinutes(30), DateTime.UtcNow, _signingCredentials);

            return handler.WriteToken(jwtToken);
        }
    }
}
