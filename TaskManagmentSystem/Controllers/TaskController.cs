using BL.Managers.Interfaces;
using DAL.CustomModels;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL.CustomModels;
using System.Web.Script.Serialization;
using System.Threading.Tasks;
using System.Web;

namespace TaskManagmentSystem.Controllers
{
     public class TaskController : ApiController
     {
          private ITaskManager taskManager;
          public TaskController(ITaskManager _taskManager)
          {
               taskManager = _taskManager;
          }

          [HttpGet]
          public IQueryable<TaskModel> GetTasks()
          {
               return taskManager.GetTasks();
          }

          [HttpPost]
          public void UploadFile()
          {
               if (HttpContext.Current.Request.Files.AllKeys.Any())
               {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["file"];

                    if (httpPostedFile != null)
                    {
                         // Get the complete file path
                         String fileSavePath = HttpContext.Current.Server.MapPath("~/UploadedFiles/") + httpPostedFile.FileName;

                         // Save the uploaded file to "UploadedFiles" folder
                         httpPostedFile.SaveAs(fileSavePath);
                    }
               }
          }

          [HttpPost]
          public void AddEditTask(string str_NewTaskModel)
          {
               NewTaskModel NewTaskParam =
                   (NewTaskModel)new JavaScriptSerializer().
                   Deserialize(str_NewTaskModel, typeof(NewTaskModel));

               if (NewTaskParam.ID == -1)
               {
                    taskManager.AddTask(NewTaskParam);
               }
               else
               {
                    taskManager.EditTask(NewTaskParam);
               }
          }

          [HttpGet]
          public DAL.Models.Task GetTaskByID(long ID)
          {
               return taskManager.GetTaskByID(ID);
          }

          [HttpGet]
          public IQueryable<TaskModel> GetTaskByUserID(long UserID)
          {
               return taskManager.GetTasksByUserID(UserID);
          }

          [HttpPost]
          public void DeleteTask(long ID)
          {
               taskManager.DeleteTask(ID);
          }

     }
}
