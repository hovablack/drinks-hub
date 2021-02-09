class Client < ActiveRecord::Base
    has_secure_password
    has_many :drinks
    validates :username, uniqueness: true
end
