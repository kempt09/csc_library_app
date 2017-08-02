class SearchController < ApplicationController
  before_action :validate_staff

  def search_user
    name = params[:name] != nil && params[:name] != '' ? params[:name] : ''
    email = params[:email] != nil && params[:email] != '' ? params[:email] : ''
    phone = params[:phone] != nil && params[:phone] != '' ? params[:phone] : ''

    @users = User.where('full_name LIKE ? AND email LIKE ? AND phone LIKE ? AND user_type != ? AND active = ?', "%#{name.downcase}%", "%#{email.downcase}%", "%#{phone}%", 'STA', true)
    render json: @users, status: :ok
  end

  def search_book
    section = params[:section]
    title = params[:title]
    books = []
    records = []

    case section
      when 'REF'
        books = Reference.includes(:authors).where('LOWER(title) LIKE ? AND active = ?', "%#{title.downcase}%", true)
      when 'PER'
        books = Periodical.includes(:authors).where('LOWER(title) LIKE ? AND active = ?', "%#{title.downcase}%", true)
      when 'CIR'
        books = Circulation.includes(:authors).where('LOWER(title) LIKE ? AND active = ?', "%#{title.downcase}%", true)
    end
    books.each do |book|
      if book.available?
        schema = {
          id: book[:id],
          title: book[:title],
          subtitle: book[:subtitle],
          volume: book[:volume],
          volume_no: book[:volume_no],
          publisher: book.publisher != nil ? book.publisher[:name] : '',
          authors: []
        }
        book.authors.each do |author|
          schema[:authors] << "#{author[:first_name]} #{author[:last_name]}"
        end
        records << schema
      end
    end
    render json: records
  end

  def search_inventory
    user = User.includes({log_entries: [:holding]}).where(
      :id => params[:user_id],
      :user_type => ['STU', 'COM'],
      :active => true
    ).first
    logs = user.log_entries.where(:checkin_dt => nil, :active => true)
    collection = []
    logs.each do |log|
      item = log.holding.find_item(log.item_id)
      collection << {
        id: log.id,
        user_id: log.user_id,
        item_id: item.id,
        holding_id: item.holding_id,
        title: item.title,
        checkout_dt: log.checkout_dt,
        due_dt: log.due_dt
      }
    end
    render json: collection
  end


end
