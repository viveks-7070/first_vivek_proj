class Recipient < ActiveRecord::Base
  belongs_to :login
  belongs_to :message
end
