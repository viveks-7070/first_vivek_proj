class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  has_many :recipients
  has_many :logins, :through => :recipients


  def login_tokens=(ids)
    self.logins_ids = ids
  end
end
