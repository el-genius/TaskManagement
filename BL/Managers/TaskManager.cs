using BL.CustomModels;
using BL.Managers.Interfaces;
using DAL.CustomModels;
using DAL.Repositories.Interfaces;
using System.Linq;

namespace BL.Managers
{
     public class TaskManager : ITaskManager
     {
          private ITaskRepository taskRepo;
          public TaskManager(ITaskRepository _taskRepo)
          {
               taskRepo = _taskRepo;
          }

          public IQueryable<DAL.Models.Task> GetAll()
          {
               return taskRepo.GetAll();
          }

          public IQueryable<TaskModel> GetTasks()
          {
               return taskRepo.GetAll().Select(t => new TaskModel
               {
                    ID = t.ID,
                    Name = t.Name,
                    Description = t.Description,
                    TaskUser = t.User.Name
                    ,
                    Status = t.LKP_TaskStatus.Name
               });
          }

          public void AddTask(NewTaskModel taskData)
          {
               taskRepo.AddTask(taskData);
          }


          public void EditTask(NewTaskModel NewTaskParam)
          {
               DAL.Models.Task editedtask = taskRepo.GetTaskByID(NewTaskParam.ID);
               editedtask.Name = NewTaskParam.Name;
               if (NewTaskParam.TaskStatus != 0)
                    editedtask.TaskStatusID = (int)NewTaskParam.TaskStatus;
               editedtask.Description = NewTaskParam.Description;
               editedtask.UserID = NewTaskParam.User;
               editedtask.Attachment = NewTaskParam.Attachment;
               taskRepo.SaveTask();
          }

          public DAL.Models.Task GetTaskByID(long ID)
          {
               return taskRepo.GetTaskByID(ID);
          }


          public IQueryable<TaskModel> GetTasksByUserID(long UserID)
          {
               return taskRepo.GetAll().Where(s => s.UserID == UserID).Select(t => new TaskModel
               {
                    ID = t.ID,
                    Name = t.Name,
                    Description = t.Description,
                    TaskUser = t.User.Name
                    ,
                    Status = t.LKP_TaskStatus.Name
               });
          }

          public void DeleteTask(long ID)
          {
               taskRepo.DeleteTask(ID);
          }
     }
}
