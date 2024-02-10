using DAL.Core;
using DAL.CustomModels;
using DAL.Models;
using DAL.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories
{
     public class TaskRepository : Repository<DAL.Models.Task, long>, ITaskRepository
     {
          private ICommentRepository commentRepo;
          public TaskRepository(IUnitOfWork unitOfWork, ICommentRepository _commentRepo)
               : base(unitOfWork)
          {
               commentRepo = _commentRepo;
          }

          public IQueryable<DAL.Models.Task> GetAll()
          {
               return this.Get().OrderBy(s => s.ID);
          }

          public void AddTask(NewTaskModel taskData)
          {
               DAL.Models.Task addedtask = new DAL.Models.Task();
               addedtask.Name = taskData.Name;
               addedtask.Description = taskData.Description;
               addedtask.UserID = (int)taskData.User;
               addedtask.TaskStatusID = (int)taskData.TaskStatus;
               addedtask.Attachment = taskData.Attachment;
               this.Add(addedtask);
               SaveTask();
          }
          public void SaveTask()
          {
               this.SaveChanges();
          }


          public Models.Task GetTaskByID(long ID)
          {
               return this.Get().Where(s => s.ID == ID).FirstOrDefault();
          }


          public void DeleteTask(long ID)
          {
               DAL.Models.Task deletedtask = this.Get().Where(s => s.ID == ID).FirstOrDefault();
               commentRepo.DeleteCommentsByTask(ID);
               this.Delete(deletedtask);
               SaveTask();
          }
     }
}
