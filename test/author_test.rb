require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test
  def test_it_has_attributes
    author = Author.new({
      first_name: "Charlotte",
      last_name:  "Bronte"                  
    })

    assert_equal "Charlotte", author.first_name
    assert_equal "Bronte", author.last_name
    assert_equal [], author.books
  end

  def test_it_can_add_a_book
    author = Author.new({
      first_name: "Charlotte",
      last_name:  "Bronte"
    })

    assert_equal [], author.books

    result = author.add_book("Jane Eyre", "October 16, 1847")

    assert_instance_of Book, result
    assert_equal "Jane Eyre", result.title
    assert_equal "1847", result.publication_date
    assert_equal "Charlotte", result.author_first_name
    assert_equal "Bronte", result.author_last_name

    assert_equal 1, author.books.count
    assert_equal [result], author.books
  end

  def test_it_can_add_a_book
    author = Author.new({
      first_name: "Charlotte",
      last_name:  "Bronte"
    })

    assert_equal [], author.books

    result_1 = author.add_book("Jane Eyre", "October 16, 1847")

    assert_equal 1, author.books.count
    assert_equal [result_1], author.books

    result_2 = author.add_book("Twilight", "October 30, 2008")
    
    assert_equal 2, author.books.count
    assert_equal [result_1, result_2], author.books
  end
end
