class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  has_many :recipients
  has_many :users, :through => :recipients


  def user_tokens=(ids)
    self.user_ids = ids
  end
end
