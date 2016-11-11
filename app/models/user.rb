class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :family

  def set_family_id(family_id)
    family_id = family_id
    save
  end

  def has_family?
    family_id.present?
  end

  has_many :sns_comments, class_name: SnsComment, foreign_key: 'user_id', dependent: :destroy
  has_many :sns_commented_posts, through: :sns_comments, source: :family_post
end
