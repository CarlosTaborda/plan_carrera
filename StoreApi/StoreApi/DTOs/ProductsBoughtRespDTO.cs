using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StoreApi.DTOs
{
    public class ProductsBoughtRespDTO
    {
        public List<ItemBought> Products { get; set; }
    }


    public class ItemBought {
        public int Id { get; set; }

        public string CategoryName { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public float Price { get; set; }
        public string Image { get; set; }

        public int QuantityBought { get; set; }
    }
}
