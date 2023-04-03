using System.ComponentModel.DataAnnotations;

namespace jobo_supabase_api.Models
{
    public class JobsRequest
    {
        [Required]
        public string? Name { get; set; }
        [Required]
        public int Category { get; set; }
        [Required]
        public int Country { get; set; }
        [Required]
        public string? JobDescription { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}
