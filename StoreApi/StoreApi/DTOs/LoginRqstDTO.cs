using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StoreApi.DTOs
{
    public class LoginRqstDTO
    {
        
        public string Email { set; get; }
        public string Password { set; get; }
    }
}
