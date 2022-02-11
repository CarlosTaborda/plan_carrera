using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StoreApi.DTOs
{
    public class LoginRespDTO
    {
        public bool Success { set; get; }
        public int Id { set; get; }
        public string FirstName { set; get; }
        public string LastName { set; get; }
        public int Role { set; get; }
        public string Address { set; get; }
        public string Email { set; get; }


    }
}
