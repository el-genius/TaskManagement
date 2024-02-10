using DAL.CustomModels;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL.Managers.Interfaces
{
     public interface ICommentManager
     {
          void AddComment(NewCommentModel commentData);
          IQueryable<Comment> GetCommentByTask(long taskID);
     }
}
