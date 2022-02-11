using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using StoreApi.Models;
using Microsoft.EntityFrameworkCore;


namespace StoreApi.DBContexts
{
    public class MyDBContext : DbContext
    {
        public DbSet<Buy> Buyes { get; set; }
        public DbSet<BuyDetail> BuyDetails { get; set; }

        public DbSet<Product> Products { get; set; }
        public DbSet<ProductCategory> ProductCategories { get; set; }

        public DbSet<User> Users { get; set; }

        public MyDBContext(DbContextOptions<MyDBContext> options) : base(options)
        {

        }


    }
}
