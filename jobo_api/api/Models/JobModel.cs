using Core.Entities;
using System.ComponentModel.DataAnnotations;

namespace jobo_api.Models
{
    public class JobsModel
    {
        public Guid Id { get; set; }
        [Required]
        public string? Name { get; set; }
        [Required]
        public byte Category { get; set; }
        [Required]
        public byte Country { get; set; }
        [Required]
        public string? JobDescription { get; set; }

        public DateTime? CreatedDate { get; set; }

        public Job ToJob()
        {
            return new Job()
            {
                Id = Guid.NewGuid(),
                Name = Name,
                Category = Category,
                Country = Country,
                JobDescription = JobDescription,
                CreatedDate = DateTime.UtcNow
            };
        }

    }
}
