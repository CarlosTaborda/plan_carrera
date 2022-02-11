using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace StoreApi.Models
{
    [Table("product")]
    public class Product
    {
        [Column("id")]
        public int Id { get; set; }

        [Column("id_category")]
        public int IdCategory { get; set; }

        [Column("code")]
        public string Code { get; set; }

        [Column("name")]
        public string Name { get; set; }

        [Column("description")]
        public string Description { get; set; }

        [Column("price")]
        public float Price { get; set; }

        [Column("image")]
        public string  Image { get; set; }

    }
}
