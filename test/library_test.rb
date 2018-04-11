require './test/test_helper'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test

  def test_it_has_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    
    dpl = Library.new
    
    assert_equal [], dpl.books

    dpl.add_to_collection(jane_eyre)
    assert_equal [jane_eyre], dpl.books
    
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    
    assert_equal [jane_eyre, mockingbird, villette], dpl.books
  end  

  def test_includes_books

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    
    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    
    assert dpl.include?("To Kill a Mockingbird")
    refute dpl.include?("Harry Potter and the Chamber of Secrets")

  end

  def test_alphabetical_card_catalogue
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    
    dpl = Library.new
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(villette)

    assert_equal [jane_eyre, villette, mockingbird], dpl.card_catalogue
  end
end
