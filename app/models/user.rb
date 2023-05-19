class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable, authentication_keys: [:phone]

  validates :phone,
    uniqueness: true,
    format: { with: /\A[0-9]{9,16}\z/ }
  
  before_save :set_type
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  # Possible methods: admin? doctor? patient?
  %w[admin doctor patient].each do |type|
    define_method("#{type}?") { is_a?(type.capitalize.constantize) }
  end
  
  private

  def email_required?
    false
  end

  def set_type
    self.type ||= Patient.name
  end
end
