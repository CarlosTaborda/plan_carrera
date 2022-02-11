using Microsoft.AspNetCore.Mvc;
using StoreApi.DBContexts;
using StoreApi.Models;
using StoreApi.DTOs;


using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace StoreApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {

        private readonly MyDBContext myDbContext;

        public UserController(MyDBContext context)
        {
            myDbContext = context;
        }


        // POST api/<UserController>
        [HttpPost]
        public LoginRespDTO Login(LoginRqstDTO loginData) {
            var UserLogged = this.myDbContext.Users.Where(u => u.Email == loginData.Email && loginData.Password == u.Password).FirstOrDefault();

            if (UserLogged == null) { 
                return new LoginRespDTO(){ Success = false};
            }

            LoginRespDTO LoginResponse = new LoginRespDTO() {
                Success = true,
                Id = UserLogged.Id,
                FirstName = UserLogged.FirstName,
                LastName = UserLogged.LastName,
                Role = UserLogged.Role,
                Address = UserLogged.Address,
                Email = UserLogged.Email
            };

            return LoginResponse;

        }
    }
}