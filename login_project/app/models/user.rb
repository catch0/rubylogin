class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }
    #validates :age, presence:true, numericality: true, {:min => 10, :max => 150}
    validates_numericality_of :age, less_than_or_equal_to: 150, greater_than: 10
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
