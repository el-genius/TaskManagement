using BL.CustomModels;
using BL.Managers.Interfaces;
using BL.Utilities;
using DAL.CustomModels;
using DAL.Models;
using DAL.Repositories;
using DAL.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BL.Managers
{
     public class UserManager : IUserManager
     {
          private IUserRepository userRepo;
          public UserManager(IUserRepository _userRepo)
          {
               userRepo = _userRepo;
          }

          public IQueryable<User> GetAll()
          {
               return userRepo.GetAll();
          }
          public IQueryable<UserModel> GetUsers()
          {
               return userRepo.GetAll().Select(e => new UserModel
               {
                    ID = e.ID,
                    Name = e.Name,
                    Address = e.Address,
                    UserType = e.LKP_UserType.Name,
                    Email = e.Email
               });
          }

          public void AddUser(RegistrationModel userData)
          {
               //hashing the userPassword to be saved in DB 
               userData.Password = Hashing.HashPassword(userData.Password);
               userRepo.AddUser(userData);
          }

          public User GetUserByID(long ID)
          {
               return userRepo.GetUserByID(ID);

          }

          public void SaveUser()
          {
               userRepo.SaveUser();
          }

          public UserModel LogInCheck(string userName, string password)
          {
               User user = userRepo.getUserByName(userName.Trim());
               if (user != null && Hashing.ValidatePassword(password.Trim(), user.Password))
               {
                    return new UserModel
                    {
                         ID = user.ID,
                         Name = user.Name,
                         Address = user.Address,
                         UserType = user.LKP_UserType.Name,
                         Email = user.Email,
                         UserTypeID = user.LKP_UserType.ID
                    };
               }
               return null;
          }

          public void EditUser(RegistrationModel RegistrationParams)
          {
               User editedUser = userRepo.GetUserByID(RegistrationParams.ID);
               editedUser.Name = RegistrationParams.Name;
               editedUser.Address = RegistrationParams.Address;
               editedUser.Email = RegistrationParams.Email;
               editedUser.UserTypeID = (int)RegistrationParams.UserType;

               userRepo.SaveUser();
          }
     }
}
