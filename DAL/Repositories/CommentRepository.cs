using DAL.Core;
using DAL.CustomModels;
using DAL.Models;
using DAL.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories
{
     public class CommentRepository : Repository<Comment, long>, ICommentRepository
     {
          public CommentRepository(IUnitOfWork unitOfWork)
               : base(unitOfWork)
          {

          }
          public void AddComment(NewCommentModel comment)
          {
               Comment addedComment = new Comment();
               addedComment.Body = comment.Body;
               addedComment.TaskID = comment.TaskID;
               if (comment.ParentID != 0)
                    addedComment.ParentID = comment.ParentID;
               addedComment.UserID = comment.UserID;

               this.Add(addedComment);
               this.SaveChanges();
          }

          public IQueryable<Comment> GetCommentByTask(long taskID)
          {
               return this.Get().Where(w => w.TaskID == taskID);

          }

          public void DeleteCommentsByTask(long taskID)
          {
               IQueryable<Comment> allComments = GetCommentByTask(taskID);
               if (allComments != null && allComments.Count() > 0)
               {
                    foreach (var comment in allComments)
                    {
                         this.Delete(comment);
                    }
                    this.SaveChanges();
               }

          }
     }
}
