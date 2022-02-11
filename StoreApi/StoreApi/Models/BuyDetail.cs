using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace StoreApi.Models
{
    [Table("buy_detail")]
    public class BuyDetail
    {

        [Column("id")]
        public int Id { get; set; }

        [Column("id_buy")]
        public int IdBuy { get; set; }

        [Column("id_product")]
        public int IdProduct { get; set; }

        [Column("quantity")]
        public int Quantity { get; set; }

        [Column("unit_price")]
        public float UnitPrice { get; set; }
    }
}
