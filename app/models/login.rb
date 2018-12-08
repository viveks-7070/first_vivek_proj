class Login < ActiveRecord::Base
  has_many :messages, foreign_key: :sender_id


  attr_accessor :password, :password_confirmation

  before_save :encrypted_password

  def self.authenticate(email, password)
    login = find_by_email(email)
    return nil if login.blank?
    if login[:encrypted_password] == login.encrypt(password)
      return login
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
