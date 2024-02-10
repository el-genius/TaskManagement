//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Task
    {
        public Task()
        {
            this.Comments = new HashSet<Comment>();
        }
    
        public long ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Attachment { get; set; }
        public Nullable<long> UserID { get; set; }
        public Nullable<int> TaskStatusID { get; set; }
    
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual LKP_TaskStatus LKP_TaskStatus { get; set; }
        public virtual User User { get; set; }
    }
}
