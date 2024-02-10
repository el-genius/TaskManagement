using BL.CustomModels;
using DAL.CustomModels;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL.Managers.Interfaces
{
     public interface ITaskManager
     {
          IQueryable<DAL.Models.Task> GetAll();
          IQueryable<TaskModel> GetTasks();
          void AddTask(NewTaskModel taskData);

          void EditTask(NewTaskModel NewTaskParam);
          DAL.Models.Task GetTaskByID(long ID);

          IQueryable<TaskModel> GetTasksByUserID(long UserID);

          void DeleteTask(long ID);
     }
}
