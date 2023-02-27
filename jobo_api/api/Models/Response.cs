namespace jobo_api.Models
{
    public record Response(string Message, List<JobsModel>? jobs);
}
