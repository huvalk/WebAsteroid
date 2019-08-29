class User < ApplicationRecord
  has_many :infos, dependent: :destroy
  validates :name, uniqueness: true
  def self.authenticate(login, submitted_password)
    user = find_by_name(login)
    return nil if user.nil?
    return user if user.password == submitted_password
  end
end
