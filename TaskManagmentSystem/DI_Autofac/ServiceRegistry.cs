using Autofac;
using BL.Managers;
using BL.Managers.Interfaces;
using DAL.Core;
using DAL.Repositories;
using DAL.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DI_Autofac
{
     public static class ServiceRegistry
     {
          public static ContainerBuilder Register(ContainerBuilder builder)
          {

               // UnitOfWork
               builder.RegisterType<UnitOfWork>().As<IUnitOfWork>().InstancePerLifetimeScope();

               #region Repository
               builder.RegisterType<UserRepository>().As<IUserRepository>().InstancePerRequest();
               builder.RegisterType<TaskRepository>().As<ITaskRepository>().InstancePerRequest();
               builder.RegisterType<CommentRepository>().As<ICommentRepository>().InstancePerRequest();

               #endregion

               #region Managers
               // TODO : register your Managers here  
               builder.RegisterType<UserManager>().As<IUserManager>().InstancePerRequest();
               builder.RegisterType<TaskManager>().As<ITaskManager>().InstancePerRequest();
               builder.RegisterType<CommentManager>().As<ICommentManager>().InstancePerRequest();

               #endregion

               #region Factory
               // TODO : register your Factory here  

               #endregion

               return builder;
          }
     }
}