class SearchController < ApplicationController
  before_action :validate_user

  def customers
    name = params[:name] != nil && params[:name] != '' ? params[:name] : ''
    customers = Customer.where('LOWER(name) LIKE ? AND admin_id = ?', name, @current_user.id)
    render json: customers, status: :ok
  end

  def books
    title = params[:title]
    records = []

    books = Circulation.includes(:authors).where('LOWER(title) LIKE ? AND admin_id = ?', "%#{title.downcase}%", @current_user.id)
    books.each do |book|
      records << {
        id: book[:id],
        title: book[:title],
        subtitle: book[:subtitle],
        cost: book[:cost],
        publisher: book.publisher != nil ? book.publisher[:name] : '',
        author: book.author != nil ? "#{book.author[:first_name]} #{book.author[:last_name]}" : '',
        available: book.available?
      }
    end
    render json: records
  end

  def authors
    name = params[:name] != nil && params[:name] != '' ? params[:name] : ''
    authors = Author.where('LOWER(name) LIKE ? AND admin_id = ?', name, @current_user.id)
    render json: authors, status: :ok
  end

end
