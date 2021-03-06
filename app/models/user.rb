class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_and_belongs_to_many :communities, -> { order "name" }
  has_many :articles
  has_many :comments, -> { order("created_at DESC").limit(12) }
  has_many :epithet_votes
  has_many :series
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Always remember me, even without the checkbox
  # http://dev.mensfeld.pl/2013/12/rails-devise-and-remember_me-rememberable-by-default/
  def remember_me
    true
  end
end
