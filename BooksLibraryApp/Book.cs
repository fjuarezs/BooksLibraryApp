//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BooksLibraryApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class Book
    {
        public int bookID { get; set; }
        public string name { get; set; }
        public Nullable<int> categoryID { get; set; }
        public Nullable<int> authorID { get; set; }
    
        public virtual Author Author { get; set; }
        public virtual Category Category { get; set; }
    }
}