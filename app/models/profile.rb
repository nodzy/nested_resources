class Profile < ActiveRecord::Base
  belongs_to :user
  validate :names_null, :man_cant_be_sue
  validates :gender, :inclusion=>{:in=>%w(female male)}
  
  def names_null
  if first_name == nil && last_name == nil
  errors.add(:last_name, "Can't be both null!")
end
end

   def man_cant_be_sue
   if first_name == "Sue" && gender == "male"
   errors.add(:first_name, "can't be!")
   end
   end
   
   
   def self.get_all_profiles(min_year, max_year)
   Profile.where("birth_year BETWEEN ? AND ?" , min_year, max_year ).order("birth_year ASC")
   

end
end