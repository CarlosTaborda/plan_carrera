using Microsoft.AspNetCore.Mvc;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


using StoreApi.DBContexts;
using StoreApi.Models;
using StoreApi.DTOs;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace StoreApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {

        private MyDBContext myDbContext;
        private readonly IWebHostEnvironment _env;

        public ProductController(MyDBContext context, IWebHostEnvironment env)
        {
            myDbContext = context;
            _env = env;
        }

        // GET: api/<ProductController>
        [HttpGet]
        public IList<Product> Get()
        {
            return this.myDbContext.Products.OrderByDescending((p)=>p.Id).ToList();
        }

        // GET api/<ProductController>/5
        [HttpGet("{id}")]
        public Product Get(int id)
        {
            return this.myDbContext.Products.Find(id);
        }

        [HttpGet("[Action]/{qty}")]
        public ProductsBoughtRespDTO MostBought(int qty) {

            var ProductsBought = (from p in this.myDbContext.Products
                                  join pb in this.myDbContext.BuyDetails on p.Id equals pb.IdProduct
                                  group p by p.Id into ps
                                           select new { ProductId = ps.Key, Count = ps.Count()}
                                 ).OrderByDescending(p=>p.Count).Take(qty).ToList();

            List<ItemBought> MostsBought = new List<ItemBought>();
            foreach (var p in ProductsBought) {

                var ProductReg = this.myDbContext.Products.Find(p.ProductId);
                var CategoryReg = this.myDbContext.ProductCategories.Find(ProductReg.IdCategory);

                MostsBought.Add(new ItemBought() { 
                    Id = ProductReg.Id,
                    CategoryName = ProductReg.Name,
                    Code = ProductReg.Code,
                    Name = ProductReg.Name,
                    Description = ProductReg.Description,
                    Image = ProductReg.Image,
                    Price = ProductReg.Price,
                    QuantityBought = p.Count
                });

            }

            var resp = new ProductsBoughtRespDTO() { Products = MostsBought};

            return resp;

        }


        [HttpGet("[Action]/{qty}")]
        public ProductsBoughtRespDTO LeastBought(int qty)
        {

            var ProductsBought = (from p in this.myDbContext.Products
                                  join pb in this.myDbContext.BuyDetails on  p.Id equals pb.IdProduct
                                  group p by p.Id into ps
                                  select new { ProductId = ps.Key, Count = ps.Count() }
                                 ).OrderBy(p => p.Count).Take(qty).ToList();

            List<ItemBought> MostsBought = new List<ItemBought>();
            foreach (var p in ProductsBought)
            {

                var ProductReg = this.myDbContext.Products.Find(p.ProductId);
                var CategoryReg = this.myDbContext.ProductCategories.Find(ProductReg.IdCategory);

                MostsBought.Add(new ItemBought()
                {
                    Id = ProductReg.Id,
                    CategoryName = ProductReg.Name,
                    Code = ProductReg.Code,
                    Name = ProductReg.Name,
                    Description = ProductReg.Description,
                    Image = ProductReg.Image,
                    Price = ProductReg.Price,
                    QuantityBought = p.Count
                });

            }

            var resp = new ProductsBoughtRespDTO() { Products = MostsBought };

            return resp;

        }

        // GET api/<ProductController>/GetByName
        [HttpGet("[Action]")]
        public IList<ProductRespDTO> GetByName(FilterProductRqstDTO filter)
        {

            List<Product> ProductsFiltered = (from p in this.myDbContext.Products
            where p.Name.Contains(filter.FilterTerm)
            select p).ToList();

            List<ProductRespDTO> ProductsResponse = new List<ProductRespDTO>();

            foreach (var p in ProductsFiltered) {
                var Cat = this.myDbContext.ProductCategories.Find(p.IdCategory);

                ProductsResponse.Add(new ProductRespDTO() { 
                    Id=p.Id,
                    Name=p.Name,
                    IdCategory=p.IdCategory,
                    CategoryName = Cat.Name,
                    Code = p.Code,
                    Image = p.Image,
                    Description  = p.Description,
                    Success =true,
                    Price = p.Price
                    

                });
            }



            return ProductsResponse;
        }

        // POST api/<ProductController>
        [HttpPost]
        public ProductRespDTO Post()
        {
            

            //Variable que retorna el valor del resultado del metodo
            //El valor predeterminado es Falso (false)
            bool resultado = false;


            var file = Request.Form.Files[0];
            string NombreCarpeta = "/Files/";
            string RutaRaiz = _env.ContentRootPath;
            string RutaCompleta = RutaRaiz + NombreCarpeta;       
            if (!Directory.Exists(RutaCompleta))
            {
                //En caso de no existir se crea esa carpeta
                Directory.CreateDirectory(RutaCompleta);
            }
            string RutaFullCompleta = "";
            //Se valida si la variable "file" tiene algun archivo
            if (file.Length > 0)
            {
                //Se declara en esta variable el nombre del archivo cargado
                string NombreArchivo = file.FileName;

                //Se declara en esta variable la ruta completa con el nombre del archivo
                RutaFullCompleta = Path.Combine(RutaCompleta, NombreArchivo);

                //Se crea una variable FileStream para carlo en la ruta definida
                using (var stream = new FileStream(RutaFullCompleta, FileMode.Create))
                {
                    file.CopyTo(stream);

                    //Como se cargo correctamente el archivo
                    //la variable "resultado" llena el valor "true"
                    resultado = true;
                }
            }

            ProductRespDTO response = new ProductRespDTO();
            if ( !resultado ) {
                response.Success = false;
                response.Message = "No se pudo subir la imagen";


            }

            Product productToInsert = new Product();


            productToInsert.IdCategory = int.Parse(HttpContext.Request.Form["IdCategory"]);
            productToInsert.Code = HttpContext.Request.Form["Code"];
            productToInsert.Name = HttpContext.Request.Form["Name"];
            productToInsert.Description = HttpContext.Request.Form["Description"];
            productToInsert.Price = float.Parse(HttpContext.Request.Form["Price"]);
            productToInsert.Image = RutaFullCompleta;

            this.myDbContext.Products.Add(productToInsert);

            int InsertId = this.myDbContext.SaveChanges();


            var InsertedProduct = this.myDbContext.Products.Find(InsertId);

            response.Success = true;
            response.Id = InsertedProduct.Id;
            response.Name = InsertedProduct.Name;
            response.IdCategory = InsertedProduct.IdCategory;
            response.Code = InsertedProduct.Code;
            response.Description = InsertedProduct.Description;
            response.Price = InsertedProduct.Price;
            response.Image = InsertedProduct.Image;



            return response;
        }

        // PUT api/<ProductController>
        [HttpPut]
        public Product Put()
        {
            Product productToEdit = new Product();

            productToEdit.Id = int.Parse(HttpContext.Request.Form["Id"]);
            productToEdit.IdCategory = int.Parse(HttpContext.Request.Form["IdCategory"]);
            productToEdit.Code = HttpContext.Request.Form["Code"];
            productToEdit.Name = HttpContext.Request.Form["Name"];
            productToEdit.Description = HttpContext.Request.Form["Description"];
            productToEdit.Price = float.Parse(HttpContext.Request.Form["Price"]);
            
            string RutaFullCompleta = "";
            var file = Request.Form.Files[0];
            string NombreCarpeta = "/Files/";
            string RutaRaiz = _env.ContentRootPath;
            string RutaCompleta = RutaRaiz + NombreCarpeta;
            bool resultado = false;
            if (file.Length > 0)
            {
                //Se declara en esta variable el nombre del archivo cargado
                string NombreArchivo = file.FileName;

                //Se declara en esta variable la ruta completa con el nombre del archivo
                RutaFullCompleta = Path.Combine(RutaCompleta, NombreArchivo);

                //Se crea una variable FileStream para carlo en la ruta definida
                using (var stream = new FileStream(RutaFullCompleta, FileMode.Create))
                {
                    file.CopyTo(stream);
                    productToEdit.Image = Path.Combine(NombreCarpeta,NombreArchivo);

                    //Como se cargo correctamente el archivo
                    //la variable "resultado" llena el valor "true"
                    resultado = true;
                }
            }

            this.myDbContext.Update( productToEdit );
            this.myDbContext.SaveChanges();

            return productToEdit;
        } 
 
        // DELETE api/<ProductController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
