class User < ActiveRecord::Base

  before_validation :downcase_and_strip

  has_secure_password

  def self.authenticate_with_credentials(email, password)
   @user = User.find_by_email(email.downcase.strip)&.authenticate(password)
   
    if(@user)
      @user
    else
      nil
    end


  end

private

def downcase_and_strip
self.email = email.downcase.strip if email.present?
end



  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {uniqueness: true, case_sensitive: false}
  validates :password, presence: true, length: { minimum: 5}
  validates :password_confirmation, presence: true, length: { minimum: 5}

end
