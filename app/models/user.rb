# ==============================================================================
# Filename : user.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email


  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

  def fullname
    "#{firstname} #{lastname}"
  end

  def teacher?
    type == 'Teacher'
  end

  def student?
    type == 'Student'
  end

  def supervisor?
    type == 'Supervisor'
  end

  private
  def downcase_email
    self.email = email.downcase
  end
end
