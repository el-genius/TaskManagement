using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.CustomModels
{
     public class NewCommentModel
     {
          public string Body { get; set; }
          public long TaskID { get; set; }
          public long UserID { get; set; }
          public long ParentID { get; set; }
     }
}
