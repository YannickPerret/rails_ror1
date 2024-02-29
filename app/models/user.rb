class User < ApplicationRecord
 
  def name
    "#{firstname} #{lastname}"
  end
end
