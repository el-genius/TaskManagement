using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Core
{
     public class MainDBContext : DbContext
     {
          protected readonly DbContext _dbContext;



          public MainDBContext(DbContext DB)
          {
               if (this._dbContext == null)
               {
                    _dbContext = DB;
               }
          }

          public IQueryable<T> Get<T>()
               where T : class
          {
               DbSet<T> _objectSet = _dbContext.Set<T>();
               return _objectSet.AsQueryable();

          }

          public IQueryable<T> GetNoEntity<T>()
           where T : class
          {
               DbSet<T> _objectSet = _dbContext.Set<T>();
               return _objectSet.AsQueryable();
          }


          public DbSet<T> SetDbSet<T>()
      where T : class
          {
               DbSet<T> _objectSet = _dbContext.Set<T>();
               return _objectSet;
          }

          public void SaveChanges()
          {
               try
               {

                    _dbContext.SaveChanges();
               }
               catch (Exception ex)
               {
                    throw ex;
               }
          }
     }
}
