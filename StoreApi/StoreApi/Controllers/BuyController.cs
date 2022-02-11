using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using StoreApi.DBContexts;
using StoreApi.Models;
using StoreApi.DTOs;

namespace StoreApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BuyController : ControllerBase
    {

        private MyDBContext myDbContext;

        public BuyController(MyDBContext context)
        {
            myDbContext = context;
        }


        // POST api/<BuyController>
        [HttpPost]
        public int Buy(BuyRqstDTO BuyRqst)
        {

            Buy BuyToInsert = new Buy();
            BuyToInsert.IdUser = BuyRqst.IdUser;
            BuyToInsert.Created = new DateTime();
            BuyToInsert.Status = 0;
            BuyToInsert.Total = BuyRqst.Total;

            this.myDbContext.Add(BuyToInsert);
            this.myDbContext.SaveChanges();

            BuyDetail Detail;

            foreach (var p in BuyRqst.Products)
            {
                Detail = new BuyDetail();

                Detail.IdBuy = BuyToInsert.Id;
                Detail.IdProduct = p.IdProduct;
                Detail.Quantity = p.Quantity;
                Detail.UnitPrice = p.Price;

                this.myDbContext.Add(Detail);
                this.myDbContext.SaveChanges();

            }

            return BuyToInsert.Id;


        }
    }
}
