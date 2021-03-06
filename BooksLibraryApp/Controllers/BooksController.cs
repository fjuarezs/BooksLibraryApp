﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using BooksLibraryApp;

namespace BooksLibraryApp.Models
{
    [RoutePrefix("api/books")]
    public class BooksController : ApiController
    {
        private BooksLibraryAppContext db = new BooksLibraryAppContext();

        // GET: api/Books
        public  IQueryable<BookDTO> GetBooks()
        {
            //return db.Books.OrderBy(e => e.authorID );
            var books = from b in db.Books
                        select new BookDTO()
                        {
                            Id = b.bookID,
                            Title = b.name,
                            AuthorName = b.Author.authorName,
                            CategoryName = b.Category.categoryName
                        };

            return books;
        }

        // GET: api/Books/byCategory
        [HttpGet]
        [Route("byCategory")]
        public IQueryable<BookDTO> GetBooksByCategory()
        {
            //return db.Books.OrderBy(e => e.authorID );
            var books = from b in db.Books
                        orderby b.Category.categoryName
                        select new BookDTO()
                        {
                            Id = b.bookID,
                            Title = b.name,
                            AuthorName = b.Author.authorName,
                            CategoryName = b.Category.categoryName
                        };

            return books;
        }

        // GET: api/Books/byAuthor
        [HttpGet]
        [Route("byAuthor")]
        public IQueryable<BookDTO> GetBooksbyAuthor()
        {
            //return db.Books.OrderBy(e => e.authorID );
            var books = from b in db.Books
                        orderby b.Author.authorName
                        select new BookDTO()
                        {
                            Id = b.bookID,
                            Title = b.name,
                            AuthorName = b.Author.authorName,
                            CategoryName = b.Category.categoryName
                        };

            return books;
        }

        // GET: api/Books/5
        [ResponseType(typeof(Book))]
        public async Task<IHttpActionResult> GetBook(int id)
        {
            Book book = await db.Books.FindAsync(id);
            if (book == null)
            {
                return NotFound();
            }

            return Ok(book);
        }

        // PUT: api/Books/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutBook(int id, Book book)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != book.bookID)
            {
                return BadRequest();
            }

            db.Entry(book).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Books
        [ResponseType(typeof(Book))]
        public async Task<IHttpActionResult> PostBook(Book book)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Books.Add(book);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = book.bookID }, book);
        }

        // DELETE: api/Books/5
        [ResponseType(typeof(Book))]
        public async Task<IHttpActionResult> DeleteBook(int id)
        {
            Book book = await db.Books.FindAsync(id);
            if (book == null)
            {
                return NotFound();
            }

            db.Books.Remove(book);
            await db.SaveChangesAsync();

            return Ok(book);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BookExists(int id)
        {
            return db.Books.Count(e => e.bookID == id) > 0;
        }
    }
}