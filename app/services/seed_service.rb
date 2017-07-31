class SeedService

  def self.seed
    staff = User.create(
      :first_name => 'Chris',
      :last_name => 'Kempton',
      :email => 'kempt09@gmail.com',
      :phone => '0000000000',
      :user_type => 'STA'
    )

    staff.hash_password('password')

    student = User.create(
      :first_name => 'Chris',
      :last_name => 'Kempton',
      :email => 'kempton-student@gmail.com',
      :phone => '1111111111',
      :user_type => 'STU'
    )

    student.hash_password('password')

    com_user = User.create(
      :first_name => 'Chris',
      :last_name => 'Kempton',
      :email => 'kempton-com-user@gmail.com',
      :phone => '2222222222',
      :user_type => 'COM'
    )

    com_user.hash_password('password')

    Holding.create(:title => 'Circulation', :section => 'CIR')
    Holding.create(:title => 'Periodical', :section => 'PER')
    Holding.create(:title => 'Reference', :section => 'REF')
    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => student.id)
    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => com_user.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')
    CommunityUser.create(:user_id => com_user[:id])
    Student.create(:user_id => student[:id], :major => 'CSC')

    staff = User.create(
      :first_name => 'David',
      :last_name => 'Agustin',
      :email => 'davidsyagustin@gmail.com',
      :phone => '4444444444',
      :user_type => 'STA'
    )

    staff.hash_password('password')

    student = User.create(
      :first_name => 'David',
      :last_name => 'Agustin',
      :email => 'david-student@gmail.com',
      :phone => '5555555555',
      :user_type => 'STU'
    )

    student.hash_password('password')

    com_user = User.create(
      :first_name => 'David',
      :last_name => 'Agustin',
      :email => 'david-com-user@gmail.com',
      :phone => '6666666666',
      :user_type => 'COM'
    )

    com_user.hash_password('password')

    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => student.id)
    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => com_user.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')
    CommunityUser.create(:user_id => com_user[:id])
    Student.create(:user_id => student[:id], :major => 'CSC')

    staff = User.create(
      :first_name => 'Chris',
      :last_name => 'Romano',
      :email => 'cromano@lji.org',
      :phone => '1112223333',
      :user_type => 'STA'
    )

    staff.hash_password('password')

    student = User.create(
      :first_name => 'Chris',
      :last_name => 'Romano',
      :email => 'chris-student@gmail.com',
      :phone => '3332221111',
      :user_type => 'STU'
    )

    student.hash_password('password')

    com_user = User.create(
      :first_name => 'Chris',
      :last_name => 'Romano',
      :email => 'chris-com-user@gmail.com',
      :phone => '2221113333',
      :user_type => 'COM'
    )

    com_user.hash_password('password')

    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => student.id)
    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => com_user.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')
    CommunityUser.create(:user_id => com_user[:id])
    Student.create(:user_id => student[:id], :major => 'CSC')

    staff = User.create(
      :first_name => 'Dominic',
      :last_name => 'Stafford',
      :email => 'dominicstaffordd@yahoo.com',
      :phone => '4443332222',
      :user_type => 'STA'
    )

    staff.hash_password('password')

    student = User.create(
      :first_name => 'Dominic',
      :last_name => 'Stafford',
      :email => 'dominic-student@gmail.com',
      :phone => '8887776666',
      :user_type => 'STU'
    )

    student.hash_password('password')

    com_user = User.create(
      :first_name => 'Dominic',
      :last_name => 'Stafford',
      :email => 'dominic-com-user@gmail.com',
      :phone => '9991113333',
      :user_type => 'COM'
    )

    com_user.hash_password('password')

    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => student.id)
    Address.create(:street => '123 Main St.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => com_user.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')
    CommunityUser.create(:user_id => com_user[:id])
    Student.create(:user_id => student[:id], :major => 'CSC')

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