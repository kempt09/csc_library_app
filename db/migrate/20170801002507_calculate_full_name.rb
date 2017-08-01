class CalculateFullName < ActiveRecord::Migration[5.1]
  def change
    User.all.each do |user|
      user.update(:full_name => "#{user.first_name} #{user.last_name}")
    end
  end
end
