using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Core
{

     public abstract class Repository<T, TKey> : IRepository<T, TKey>
            where T : class
     {
          protected readonly IUnitOfWork _unitOfWork;
          readonly protected DbSet<T> _objectSet;


          public Repository(IUnitOfWork unitOfWork)
          {
               _unitOfWork = unitOfWork;
               _objectSet = unitOfWork.Context.SetDbSet<T>();

          }
          public IQueryable<T> GetAll(Func<T, bool> predicate = null)
          {
               if (predicate != null)
               {
                    return this._unitOfWork.Context.Get<T>().Where(predicate).AsQueryable();
               }

               return this._unitOfWork.Context.Get<T>().AsQueryable();
          }

          public T Get(Func<T, bool> predicate)
          {
               return this._unitOfWork.Context.Get<T>().FirstOrDefault(predicate);
          }

          public IQueryable<T> Get()
          {
               return this._unitOfWork.Context.Get<T>().AsQueryable();
          }

          public IQueryable<T> GetNoEntity()
          {
               return this._unitOfWork.Context.GetNoEntity<T>().AsQueryable();
          }


          public void Add(T entity)
          {

               _objectSet.Add(entity);
          }

          public void Attach(T entity)
          {
               _objectSet.Attach(entity);
          }

          public void Delete(T entity)
          {
               _objectSet.Remove(entity);
          }
          public void SaveChanges()
          {
               this._unitOfWork.SaveChanges();
          }
     }
}

