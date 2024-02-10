using DAL.CustomModels;
using DAL.Models;
using System.Linq;

namespace DAL.Repositories.Interfaces
{
     public interface ICommentRepository
     {
          void AddComment(NewCommentModel comment);
          IQueryable<Comment> GetCommentByTask(long taskID);
          void DeleteCommentsByTask(long taskID);
     }
}
