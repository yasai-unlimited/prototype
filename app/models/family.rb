class Family < ActiveRecord::Base
  mount_uploader :coverimage, FamilyCoverimageUploader

  mount_uploader :icon, FamilyIconUploader

  has_many :users

  has_many :following_relationships, class_name: 'FamilyRelationship',
                                     foreign_key: 'follow_id',
                                     dependent: :destroy
  has_many :following_families, through: :following_relationships, source: :follower
  has_many :follower_relationships, class_name: 'FamilyRelationship',
                                foreign_key: 'follower_id',
                                dependent: :destroy
  has_many :follower_families, through: :follower_relationships, source: :follow

  has_many :family_posts, dependent: :destroy

  def follow(another_family)
    following_relationships.find_or_create_by(follower_id: another_family.id)
  end

  def unfollow(another_family)
    follow_relationship = following_relationships.find_by(follower_id: another_family.id)
    follow_relationship.destroy if follow_relationship
  end

  def following?(another_family)
    following_families.include?(another_family)
  end

  def has_family_relationship?(another_family)
    following?(another_family) && another_family.following?(self)
  end

  # def friend_families
  #   followers = follower_families
  #   friends = []
  #   following_families.each do |follow|
  #     if followers.include?(follow)
  #       friends.push(follow)
  #     end
  #   end
  #   logger.debug(friends)
  #   friends
  # end

  def my_and_friend_families_posts
    followers = follower_families
    my_and_friends_posts = family_posts
    following_families.each do |follow|
      if followers.include?(follow)
        my_and_friends_posts.push(follow.family_posts)
      end
    end
    my_and_friends_posts
  end

  def all_posts
    all_posts = family_posts
    following_families.each do |f|
      all_posts.push(f.family_posts)
    end
    all_posts
  end


  has_many :family_post_stars, class_name: FamilyPostStar, foreign_key: 'family_id', dependent: :destroy
  has_many :stared_family_posts, through: :family_post_stars, source: :family_post

  def family_post_star(family_post)
    family_post_stars.find_or_create_by(family_post_id: family_post.id)
  end

  def family_post_unstar(family_post)
    family_post = family_post_stars.find_by(family_post_id: family_post.id)
    family_post.destroy if family_post
  end

  def family_post_stared?(family_post)
    stared_family_posts.include?(family_post)
  end

  has_many :sns_comments, class_name: SnsComment, foreign_key: 'family_id', dependent: :destroy
  has_many :sns_commented_posts, through: :sns_comments, source: :family_post

  def sns_comment(family_post, content)
    sns_comments.find_or_create_by(family_post_id: family_post.id, user_id: current_user.id, content: content)
  end

  def delete_sns_comment(family_post)
    sns_comment = sns_comments.find_by(family_post_id: family_post.id, user_id: current_user.id)
    sns_comment.destroy if sns_comment
  end


  has_many :questions, class_name: Question, foreign_key: 'family_id', dependent: :destroy

  has_many :question_stars, class_name: QuestionStar, dependent: :destroy, foreign_key: 'family_id'
  has_many :stared_questions, through: :question_stars, source: :question

  def question_star(question)
    question_stars.find_or_create_by(question_id: question.id)
  end

  def question_unstar(question)
    question = question_stars.find_by(question_id: question.id)
    question.destroy if question
  end

  def question_stared?(question)
    stared_questions.include?(question)
  end
end
