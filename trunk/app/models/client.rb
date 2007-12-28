class Client < ActiveRecord::Base
  has_many :appointments, :order => "occurs_on DESC", :dependent => :destroy
  validates_format_of :email, :with => /^[^@][\w.-]+@[\w.-]+.[a-z]{2,4}$/i
end
