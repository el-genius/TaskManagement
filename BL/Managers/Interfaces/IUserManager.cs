using BL.CustomModels;
using DAL.CustomModels;
using DAL.Models;
using System.Linq;

namespace BL.Managers.Interfaces
{
     public interface IUserManager
     {
          IQueryable<User> GetAll();
          void AddUser(RegistrationModel userData);
          IQueryable<UserModel> GetUsers();
          void SaveUser();
          UserModel LogInCheck(string userName, string password);
          User GetUserByID(long ID);

          void EditUser(RegistrationModel RegistrationParams);
     }
}
