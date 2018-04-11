require './test/test_helper'
require './lib/book'

class BookTest < Minitest::Test

  def test_it_has_attributes
    book = Book.new({
                  author_first_name: "Harper",
                  author_last_name: "Lee",
                  title: "To Kill A Mockingbird",
                  publication_date: "July 11, 1960"
    })

    assert_equal "Harper", book.author_first_name
    assert_equal "Lee", book.author_last_name
    assert_equal "To Kill A Mockingbird", book.title
    assert_equal "1960", book.publication_date
  end

  def test_it_has_different_attributes
    book = Book.new({
      author_first_name: "Stephen",
      author_last_name: "King",
      title: "The Dark Tower",
      publication_date: "August 31, 1990"
      })

    assert_equal "Stephen", book.author_first_name
    assert_equal "King", book.author_last_name
    assert_equal "The Dark Tower", book.title
    assert_equal "1990", book.publication_date 
  end
end
