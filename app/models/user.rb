class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_books, through: :favorites, source: :book

  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following

  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries
  has_many :massages, dependent: :destroy

  has_many :view_counts, dependent: :destroy

  has_many :group_users
  has_many :groups, through: :group_users

  attachment :profile_image

  validates :name, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }

  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?", "#{word}%")
    elsif search == "backword_match"
      @user = User.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?", "%#{word}%")
    else
      @user = User.all
    end
  end
end
