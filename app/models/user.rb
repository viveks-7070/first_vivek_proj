class User < ActiveRecord::Base
  has_many :messages, foreign_key: :sender_id


  attr_accessor :password, :password_confirmation

  before_save :encrypted_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    return nil if user.blank?
    if user[:encrypted_password] == user.encrypt(password)
      return user
    end
  end

  def encrypt(password)
    Digest::SHA2.hexdigest("#{password}")
  end

  private

  def encrypted_password
    self.salt = Digest::SHA2.hexdigest("#{password}") if self.new_record?
    self.encrypted_password = encrypt(password)
  end
end
