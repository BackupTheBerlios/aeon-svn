require 'digest/sha1'

class User < ActiveRecord::Base
  attr_accessor :password

  validates_presence_of     :login
  validates_length_of       :login, :within => 3..40
  validates_uniqueness_of   :login, :case_sensitive => false
  validates_format_of       :login, :with => /^[\w\.-]+$/i

  validates_format_of       :email, :with => /^[^@][\w.-]+[.][a-z]{2,4}$/i

  validates_presence_of :password, :if => :password_required?
  validates_length_of   :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?

  before_save :encrypt_new_password

  def self.authenticate(login, password)
    user = find_by_login(login)
    return user if user && user.authenticates?(password)
  end

  def authenticated?(password)
    passwd == encrypt(password)
  end

  protected
    def encrypt_new_password
      return if password.blank?
      self.passwd = encrypt(password)
    end

    def password_required?
      passwd.blank? || !password.blank?

    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
end
