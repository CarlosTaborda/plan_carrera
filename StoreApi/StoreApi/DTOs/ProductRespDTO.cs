using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StoreApi.DTOs
{
    public class ProductRespDTO
    {

        public bool Success { get; set; }
        public string Message { get; set; }

        public int Id { get; set; }
        public string Name { get; set;  }
        public int IdCategory { get; set; }

        public string CategoryName { get; set; }

        public string Code { get; set; }

        public string Description { get; set; }

        public float Price { get; set; }
        public string Image { get; set; }


    }
}
