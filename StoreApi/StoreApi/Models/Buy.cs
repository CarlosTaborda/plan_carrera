using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace StoreApi.Models
{
    [Table("buy")]
    public class Buy
    {
        [Column("id")]
        public int Id { get; set; }

        [Column("id_user")]
        public int IdUser { get; set; }

        [Column("created")]
        public DateTime Created { get; set; }

        [Column("status")]
        public int Status { get; set; }

        [Column("total")]
        public float Total { get; set; }

        [Column("payment_method")]
        public string PaymentMethod { get; set; }
    }
}
