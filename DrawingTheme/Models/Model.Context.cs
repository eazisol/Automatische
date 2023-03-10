//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DrawingTheme.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class AutomatischeEntities : DbContext
    {
        public AutomatischeEntities()
            : base("name=AutomatischeEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblAccessLevel> tblAccessLevels { get; set; }
        public virtual DbSet<tblMenu> tblMenus { get; set; }
        public virtual DbSet<tblRole> tblRoles { get; set; }
        public virtual DbSet<tblSetting> tblSettings { get; set; }
        public virtual DbSet<tblOrder> tblOrders { get; set; }
        public virtual DbSet<tblComponent> tblComponents { get; set; }
        public virtual DbSet<tblUser> tblUsers { get; set; }
        public virtual DbSet<tblLog> tblLogs { get; set; }
        public virtual DbSet<tblTransaction> tblTransactions { get; set; }
        public virtual DbSet<tblCategory> tblCategories { get; set; }
        public virtual DbSet<tblSubCategory> tblSubCategories { get; set; }
        public virtual DbSet<tblOrderDetail> tblOrderDetails { get; set; }
        public virtual DbSet<tblErrorLog> tblErrorLogs { get; set; }
    
        public virtual ObjectResult<string> SpOrderNumber()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("SpOrderNumber");
        }
    
        public virtual ObjectResult<Sp_GetAccesoires_Result> Sp_GetAccesoires(Nullable<int> iD)
        {
            var iDParameter = iD.HasValue ?
                new ObjectParameter("ID", iD) :
                new ObjectParameter("ID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetAccesoires_Result>("Sp_GetAccesoires", iDParameter);
        }
    
        public virtual ObjectResult<Sp_GetBOMData_Result> Sp_GetBOMData(Nullable<int> iD)
        {
            var iDParameter = iD.HasValue ?
                new ObjectParameter("ID", iD) :
                new ObjectParameter("ID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetBOMData_Result>("Sp_GetBOMData", iDParameter);
        }
    
        public virtual ObjectResult<Sp_GetRSprinkler_Result> Sp_GetRSprinkler()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetRSprinkler_Result>("Sp_GetRSprinkler");
        }
    
        public virtual ObjectResult<Sp_GetRecSprinkler_Result> Sp_GetRecSprinkler()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetRecSprinkler_Result>("Sp_GetRecSprinkler");
        }
    }
}
