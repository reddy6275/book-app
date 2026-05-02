package com.example.library.repository;

import com.example.library.entity.Author;
import com.example.library.entity.Book;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
class BookRepositoryTest {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private AuthorRepository authorRepository;

    @Test
    void testFindAllWithAuthors() {
        Author author = new Author();
        author.setName("J.K. Rowling");
        author.setNationality("British");
        authorRepository.save(author);

        Book book = new Book();
        book.setTitle("Harry Potter");
        book.setIsbn("987654321");
        book.setGenre("Fantasy");
        book.setAuthor(author);
        bookRepository.save(book);

        List<Book> books = bookRepository.findAllWithAuthors();
        
        assertFalse(books.isEmpty());
        boolean found = books.stream().anyMatch(b -> b.getIsbn().equals("987654321"));
        assertTrue(found);
    }
}
