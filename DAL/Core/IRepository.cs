using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Core
{

     public interface IRepository<T, TKey> where T : class
     {
          IQueryable<T> GetAll(Func<T, bool> predicate = null);
          IQueryable<T> Get();
          IQueryable<T> GetNoEntity();
          T Get(Func<T, bool> predicate);

          void Add(T entity);

          void Attach(T entity);

          void Delete(T entity);

          void SaveChanges();

     }
}

