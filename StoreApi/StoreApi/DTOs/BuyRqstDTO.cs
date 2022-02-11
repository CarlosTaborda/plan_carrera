using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StoreApi.DTOs
{
    public class BuyRqstDTO
    {
        public int IdUser { get; set; }
        public List<ProductBought> Products { get; set; }
        public float Total {
            get {
                if (this.Products == null || !this.Products.Any())
                    return 0;
                float value = (from p in Products
                               select p.Price * p.Quantity).Sum();

                return value;
            }
        
       }
    }

    public class ProductBought {
        
        public int IdProduct { get; set; }
        public int Quantity { get; set; }
        public float Price { get; set; }
    }
}
