# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)     
    Student.where("name LIKE ?", "%#{query}%")
    #User.where(["name = ? and email = ?", "Joe", "joe@example.com"])
    #Client.where("first_name LIKE '%#{params[:first_name]}%'") is not safe. 
  end 
end
