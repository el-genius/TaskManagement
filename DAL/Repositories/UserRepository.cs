using DAL.Core;
using DAL.CustomModels;
using DAL.Models;
using DAL.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories
{
     public class UserRepository : Repository<User, long>, IUserRepository
     {
          public UserRepository(IUnitOfWork unitOfWork)
               : base(unitOfWork)
          {
          }

          public User getUserByName(string Name)
          {
               return this.Get().Where(s => s.Name == Name).FirstOrDefault();

          }

          public User GetUserByID(long ID)
          {
               return this.Get().Where(s => s.ID == ID).FirstOrDefault();

          }
          public IQueryable<User> GetAll()
          {
               return this.Get().OrderBy(s => s.ID);
          }

          public void AddUser(RegistrationModel userData)
          {
               User addedUser = new User();
               addedUser.Name = userData.Name;
               addedUser.Password = userData.Password;
               addedUser.UserTypeID = (int)userData.UserType;
               addedUser.Address = userData.Address;
               addedUser.Email = userData.Email;

               this.Add(addedUser);
               SaveUser();
          }

          public void SaveUser()
          {
               this.SaveChanges();
          }
     }
}
