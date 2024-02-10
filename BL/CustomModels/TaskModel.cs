using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL.CustomModels
{
     public class TaskModel
     {
          public long ID { get; set; }
          public string Name { get; set; }
          public string Description { get; set; }
          public string TaskUser { get; set; }
          public string Status { get; set; }

     }
}
