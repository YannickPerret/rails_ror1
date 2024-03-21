class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email

 
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

  def name
    "#{firstname} #{lastname}"
  end

  def teacher?
    type == 'Teacher'
  end

  def student?
    type == 'Student'
  end

  def doyen?
    type == 'Doyen'
  end

  private 
  def downcase_email
    self.email = email.downcase
  end
end
