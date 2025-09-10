class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :tasks, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: [ :login ]
  attr_writer :login
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, length: { minimum: 8,  too_short: "Username be at least 8 characters long." }
  validate :password_complexity

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
    errors.add :password, "Password Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character"
  end

  def login
    @login || self.username || self.email
  end

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if (login = conditions.delete(:login))
        where(conditions.to_h).where([ "lower(username) = :value OR lower(email) = :value", { value: login.downcase } ]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
end
