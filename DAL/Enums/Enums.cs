using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Enums
{
     public class Enums
     {
          public enum UserType
          {
               Employee = 1,
               Manager = 2
          }

          public enum TaskStatus
          {
               Assigned = 1,
               InProgress = 2,
               Pending = 3,
               Completed = 4
          }
     }
}
