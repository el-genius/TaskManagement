using BL.Managers.Interfaces;
using DAL.CustomModels;
using DAL.Models;
using System.Linq;
using System.Web.Http;
using System.Web.Script.Serialization;

namespace TaskManagmentSystem.Controllers
{
     public class CommentController : ApiController
     {
          private ICommentManager commentManager;
          public CommentController(ICommentManager _commentManager)
          {
               commentManager = _commentManager;
          }

          [HttpPost]
          public void AddComment(string str_NewCommentModel)
          {
               NewCommentModel NewCommentParam =
                   (NewCommentModel)new JavaScriptSerializer().
                   Deserialize(str_NewCommentModel, typeof(NewCommentModel));
               commentManager.AddComment(NewCommentParam);
          }

          [HttpGet]
          public IQueryable<Comment> GetCommentByTask(long taskID)
          {

               return commentManager.GetCommentByTask(taskID);
          }
     }
}
