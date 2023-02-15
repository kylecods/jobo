namespace jobo_api.Models
{
    public class JobsModel
    {
        public Guid Id { get; set; }

        public string? Name { get; set; }

        public byte Category { get; set; }

        public byte Country { get; set; }

        public string? JobDescription { get; set; }

        public DateTime CreatedDate { get; set; }

    }
}
