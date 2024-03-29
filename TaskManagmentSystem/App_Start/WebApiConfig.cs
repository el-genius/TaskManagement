﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace TaskManagmentSystem
{
     public static class WebApiConfig
     {
          public static void Register(HttpConfiguration config)
          {
               // Web API configuration and services

               // Web API routes
               config.MapHttpAttributeRoutes();

               config.Routes.MapHttpRoute(
                   name: "DefaultApi",
                   routeTemplate: "api/{controller}/{action}/{id}",
                   defaults: new { id = RouteParameter.Optional }
               );

               config.Formatters.Remove(config.Formatters.XmlFormatter);

               // JSON formatter
               config.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
               //to convert date time to local
               config.Formatters.JsonFormatter.SerializerSettings.DateTimeZoneHandling = DateTimeZoneHandling.Local;

          }
     }
}
