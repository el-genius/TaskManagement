using BL.Managers.Interfaces;
using DAL.CustomModels;
using DAL.Models;
using DAL.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL.Managers
{
     public class CommentManager : ICommentManager
     {
          private ICommentRepository commentRepo;
          public CommentManager(ICommentRepository _commentRepo)
          {
               commentRepo = _commentRepo;
          }

          public void AddComment(NewCommentModel commentData)
          {
               commentRepo.AddComment(commentData);
          }


          public IQueryable<Comment> GetCommentByTask(long taskID)
          {
               return commentRepo.GetCommentByTask(taskID);
          }
     }
}
