using DAL.CustomModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.Interfaces
{
     public interface ITaskRepository
     {
          IQueryable<DAL.Models.Task> GetAll();
          void AddTask(NewTaskModel taskData);

          DAL.Models.Task GetTaskByID(long ID);
          void SaveTask();

          void DeleteTask(long ID);
     }
}
