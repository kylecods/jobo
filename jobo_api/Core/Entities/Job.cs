namespace Infrastructure.Entities
{
    public class Job : Entity
    {
        public string? Name { get; set; }

        public byte Category { get; set; }

        public byte Country { get; set; }

        public string? JobDescription { get; set; }

    }
}
