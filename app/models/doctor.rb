
class Doctor < User
  belongs_to :category
  has_many :appointments
end
