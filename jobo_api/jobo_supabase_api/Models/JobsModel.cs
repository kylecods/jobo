using Postgrest.Attributes;
using Postgrest.Models;

namespace jobo_supabase_api.Models
{
    [Table("jobs")]
    public class JobsModel: BaseModel
    {
        [PrimaryKey("id",true)]
        public Guid Id { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("job_description")]
        public string Description { get; set; } = string.Empty;

        [Column("country")]
        public int Country { get; set; }

        [Column("category")]
        public int Category { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; }
    }
}
