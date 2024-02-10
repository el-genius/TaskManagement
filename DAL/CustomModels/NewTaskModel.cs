using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.CustomModels
{
     public class NewTaskModel
     {
           public long ID { get; set; }
          public string Name { get; set; }
          public string Description { get; set; }
          public long User { get; set; }
          public DAL.Enums.Enums.TaskStatus TaskStatus { get; set; }
          public string Attachment { get; set; }
     }
}
