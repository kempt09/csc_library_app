class SeedService

  def self.seed
    cir = Holding.create(:title => 'Circulation', :section => 'CIR')
    per = Holding.create(:title => 'Periodical', :section => 'PER')
    ref = Holding.create(:title => 'Reference', :section => 'REF')

    one = Publisher.create(:name => 'Publisher One')
    two = Publisher.create(:name => 'Publisher Two')
    three = Publisher.create(:name => 'Publisher Three')
    four = Publisher.create(:name => 'Publisher Four')
    five = Publisher.create(:name => 'Publisher Five')

    Author.create(:first_name => 'Jane', :last_name => 'Doe')
    Author.create(:first_name => 'Jill', :last_name => 'Doe')
    Author.create(:first_name => 'John', :last_name => 'Doe')
    Author.create(:first_name => 'Bob', :last_name => 'Doe')
    Author.create(:first_name => 'Tom', :last_name => 'Doe')

    Reference.create(:title => 'Reference One', :subtitle => 'Subtitle', :holding_id => ref.id, :publisher_id => one.id)
    Reference.create(:title => 'Reference Two', :subtitle => 'Subtitle', :holding_id => ref.id, :publisher_id => two.id)
    Reference.create(:title => 'Reference Three', :subtitle => 'Subtitle', :holding_id => ref.id, :publisher_id => three.id)
    Reference.create(:title => 'Reference Four', :subtitle => 'Subtitle', :holding_id => ref.id, :publisher_id => four.id)
    Reference.create(:title => 'Reference Five', :subtitle => 'Subtitle', :holding_id => ref.id, :publisher_id => five.id)

    Periodical.create(:title => 'Periodical One', :volume => '1', :volume_no => '1', :holding_id => per.id, :publisher_id => one.id)
    Periodical.create(:title => 'Periodical Two', :volume => '1', :volume_no => '1', :holding_id => per.id, :publisher_id => two.id)
    Periodical.create(:title => 'Periodical Three', :volume => '1', :volume_no => '1', :holding_id => per.id, :publisher_id => three.id)
    Periodical.create(:title => 'Periodical Four', :volume => '1', :volume_no => '1', :holding_id => per.id, :publisher_id => four.id)
    Periodical.create(:title => 'Periodical Five', :volume => '1', :volume_no => '1', :holding_id => per.id, :publisher_id => five.id)

    Circulation.create(:title => 'Book One', :subtitle => 'Subtitle', :cost => '10.00', :holding_id => cir.id, :publisher_id => one.id)
    Circulation.create(:title => 'Book Two', :subtitle => 'Subtitle', :cost => '10.00', :holding_id => cir.id, :publisher_id => two.id)
    Circulation.create(:title => 'Book Three', :subtitle => 'Subtitle', :cost => '10.00', :holding_id => cir.id, :publisher_id => three.id)
    Circulation.create(:title => 'Book Four', :subtitle => 'Subtitle', :cost => '10.00', :holding_id => cir.id, :publisher_id => four.id)
    Circulation.create(:title => 'Book Five', :subtitle => 'Subtitle', :cost => '10.00', :holding_id => cir.id, :publisher_id => five.id)

    staff = User.create(
      :first_name => 'Chris',
      :last_name => 'Kempton',
      :email => 'kempt09@gmail.com',
      :phone => '0000000000',
      :user_type => 'STA'
    )

    staff.hash_password('password')

    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')

    staff = User.create(
      :first_name => 'David',
      :last_name => 'Agustin',
      :email => 'davidsyagustin@gmail.com',
      :phone => '4444444444',
      :user_type => 'STA'
    )

    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')

    staff = User.create(
      :first_name => 'Chris',
      :last_name => 'Romano',
      :email => 'cromano@lji.org',
      :phone => '1112223333',
      :user_type => 'STA'
    )

    staff.hash_password('password')

    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')

    staff = User.create(
      :first_name => 'Dominic',
      :last_name => 'Stafford',
      :email => 'dominicstaffordd@yahoo.com',
      :phone => '4443332222',
      :user_type => 'STA'
    )

    staff.hash_password('password')

    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')

    staff = User.create(
      :first_name => 'Michael',
      :last_name => 'Herrera',
      :email => 'mpherrera100@gmail.com',
      :phone => '9832146633',
      :user_type => 'STA'
    )

    staff.hash_password('password')

    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')

    staff = User.create(
      :first_name => 'Albanie',
      :last_name => 'Bolton',
      :email => 'Albanie.Bolton@natuniv.edu',
      :phone => '9837646633',
      :user_type => 'STA'
    )

    staff.hash_password('password')

    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')

  end

  def self.drop
    Staff.all.each do |record|
      record.destroy
    end
    Student.all.each do |record|
      record.destroy
    end
    CommunityUser.all.each do |record|
      record.destroy
    end
    Circulation.all.each do |record|
      record.destroy
    end
    Reference.all.each do |record|
      record.destroy
    end
    Periodical.all.each do |record|
      record.destroy
    end
    Holding.all.each do |record|
      record.destroy
    end
    Author.all.each do |record|
      record.destroy
    end
    Publisher.all.each do |record|
      record.destroy
    end
    LogEntry.all.each do |record|
      record.destroy
    end
    Address.all.each do |record|
      record.destroy
    end
    User.all.each do |record|
      record.destroy
    end
  end

end