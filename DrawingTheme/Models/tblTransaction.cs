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
    using System.Collections.Generic;
    
    public partial class tblTransaction
    {
        public int Id { get; set; }
        public Nullable<System.DateTime> PaymentDateTime { get; set; }
        public string PaypalPaymentId { get; set; }
        public string PayerEmail { get; set; }
        public string PayerFirstName { get; set; }
        public string PayerLastName { get; set; }
        public string PayerId { get; set; }
        public string State { get; set; }
        public string Amount { get; set; }
        public string Currency { get; set; }
        public string PaymentDescription { get; set; }
        public Nullable<int> UserId { get; set; }
        public Nullable<int> OrderId { get; set; }
        public string Status { get; set; }
    
        public virtual tblOrder tblOrder { get; set; }
        public virtual tblUser tblUser { get; set; }
    }
}
