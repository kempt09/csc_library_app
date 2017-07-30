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
      :first_name => 'Whitney',
      :last_name => 'Kempton',
      :email => 'kemptondesigns@gmail.com',
      :phone => '1111111111',
      :user_type => 'STU'
    )

    com_user = User.create(
      :first_name => 'Piper',
      :last_name => 'Kempton',
      :email => 'chris@s13a.com',
      :phone => '2222222222',
      :user_type => 'COM'
    )

    Holding.create(:title => 'Circulation', :section => 'CIR')
    Holding.create(:title => 'Periodical', :section => 'PER')
    Holding.create(:title => 'Reference', :section => 'REF')
    Address.create(:street => '917 Ottawa Dr.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => staff.id)
    Address.create(:street => '917 Ottawa Dr.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => student.id)
    Address.create(:street => '917 Ottawa Dr.', :apt => nil, :city => 'Royal Oak', :state => 'Michigan', :country => 'US', :zip => '48073', :user_id => com_user.id)
    Staff.create(:user_id => staff[:id], :role => 1, :rank => 'Worker')
    CommunityUser.create(:user_id => com_user[:id])
    Student.create(:user_id => student[:id], :major => 'Design')

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