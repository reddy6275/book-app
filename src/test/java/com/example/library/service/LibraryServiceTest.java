package com.example.library.service;

import com.example.library.entity.Author;
import com.example.library.entity.Book;
import com.example.library.repository.AuthorRepository;
import com.example.library.repository.BookRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class LibraryServiceTest {

    @Mock
    private BookRepository bookRepository;

    @Mock
    private AuthorRepository authorRepository;

    @InjectMocks
    private LibraryService libraryService;

    private Book book;
    private Author author;

    @BeforeEach
    void setUp() {
        author = new Author();
        author.setId(1L);
        author.setName("Test Author");
        author.setNationality("Test Nationality");

        book = new Book();
        book.setId(1L);
        book.setTitle("Test Title");
        book.setIsbn("1234567890");
        book.setGenre("Test Genre");
        book.setAuthor(author);
    }

    @Test
    void testGetAllBooks() {
        when(bookRepository.findAllWithAuthors()).thenReturn(Arrays.asList(book));
        List<Book> books = libraryService.getAllBooks();
        assertEquals(1, books.size());
        assertEquals("Test Title", books.get(0).getTitle());
    }

    @Test
    void testGetAllAuthors() {
        when(authorRepository.findAll()).thenReturn(Arrays.asList(author));
        List<Author> authors = libraryService.getAllAuthors();
        assertEquals(1, authors.size());
        assertEquals("Test Author", authors.get(0).getName());
    }

    @Test
    void testGetBookById() {
        when(bookRepository.findById(1L)).thenReturn(Optional.of(book));
        Optional<Book> foundBook = libraryService.getBookById(1L);
        assertTrue(foundBook.isPresent());
        assertEquals("Test Title", foundBook.get().getTitle());
    }

    @Test
    void testSaveBook() {
        when(bookRepository.save(any(Book.class))).thenReturn(book);
        Book savedBook = libraryService.saveBook(book);
        assertNotNull(savedBook);
        assertEquals("1234567890", savedBook.getIsbn());
    }

    @Test
    void testDeleteBook() {
        doNothing().when(bookRepository).deleteById(1L);
        libraryService.deleteBook(1L);
        verify(bookRepository, times(1)).deleteById(1L);
    }
}
