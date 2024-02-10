using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;
using Autofac;
using System.Reflection;
using DAL.DI_Autofac;
using Autofac.Integration.WebApi;

namespace TaskManagmentSystem
{
     public class Global : HttpApplication
     {
          void Application_Start(object sender, EventArgs e)
          {
               // Code that runs on application startup
               GlobalConfiguration.Configure(WebApiConfig.Register);
               // DI - dependency injection
               // Autofac
               var builder = new ContainerBuilder();
               var config = GlobalConfiguration.Configuration;
               // Register all api controllers
               builder.RegisterApiControllers(Assembly.GetExecutingAssembly()).AsSelf();
               // Register business objects            
               builder = ServiceRegistry.Register(builder);
               config.DependencyResolver = new AutofacWebApiDependencyResolver(builder.Build());
          }
     }
}