class Search::Book < Search::Base
  ATTRIBUTES = %i[isbn title].freeze
  attr_accessor(*ATTRIBUTES)

  def matches
    t = ::Book.arel_table
    results = ::Book.all
    results = results.where(isbn: ISBN.thirteen(isbn)) if isbn.present?
    results = results.where(contains(t[:title], title)) if title.present?
    results
  end
end
