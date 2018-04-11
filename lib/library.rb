class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(book_title)
    @books.any? do |book|
      book.title == book_title
    end
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end
end