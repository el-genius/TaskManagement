using DAL.CustomModels;
using DAL.Models;
using System.Linq;

namespace DAL.Repositories.Interfaces
{
     public interface IUserRepository
     {
          IQueryable<User> GetAll();

          void AddUser(RegistrationModel userData);

          void SaveUser();
          User getUserByName(string Name);

          User GetUserByID(long ID);
     }
}
