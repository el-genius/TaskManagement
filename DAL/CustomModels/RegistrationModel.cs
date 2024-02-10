using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL.CustomModels
{
     public class RegistrationModel
     {
          public long ID { get; set; }
          public string Name { get; set; }
          public string Password { get; set; }
          public string Address { get; set; }
          public string Email { get; set; }
          public DAL.Enums.Enums.UserType UserType { get; set; }
     }
}
