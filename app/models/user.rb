class User < ActiveRecord::Base
  include Glysellin::Orderer
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders, class_name: 'Glysellin::Order', foreign_key: 'customer_id'
end
