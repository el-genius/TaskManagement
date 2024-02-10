using BL.CustomModels;
using BL.Managers.Interfaces;
using DAL.CustomModels;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Script.Serialization;

namespace TaskManagmentSystem.Controllers
{
     public class UserController : ApiController
     {
          private IUserManager userManager;
          public UserController(IUserManager _userManager)
          {
               userManager = _userManager;
          }

          [HttpGet]
          public User GetUserByID(long ID)
          {
               return userManager.GetUserByID(ID);
          }

          [HttpGet]
          public IQueryable<UserModel> GetUsersTable()
          {
               return userManager.GetUsers();
          }





          //for simplacity i'm putting the security here not in a seperate controller

          [HttpGet]
          public UserModel LogIn([FromUri]string userName, [FromUri]string password)
          {
               if (!string.IsNullOrEmpty(userName) && !string.IsNullOrEmpty(password)
                    && !string.IsNullOrWhiteSpace(userName) && !string.IsNullOrWhiteSpace(password))
               {
                    UserModel validUser = userManager.LogInCheck(userName, password);
                    if (validUser != null)
                    {
                         return validUser;
                    }
               }
               return null;
          }


          [HttpPost]
          public void Register(string str_RegistrationParams)
          {
               RegistrationModel RegistrationParams =
                   (RegistrationModel)new JavaScriptSerializer().
                   Deserialize(str_RegistrationParams, typeof(RegistrationModel));
               if (RegistrationParams.ID == 0)
               {
                    userManager.AddUser(RegistrationParams);
               }
               else
               {
                    userManager.EditUser(RegistrationParams);
               }

          }

     }
}
