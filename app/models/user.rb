class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :email
  end
  has_many :galleries
  belongs_to :account, polymorphic: true
  has_many :authentications
  has_many :participant_lists
  has_many :conversations, through: :participant_lists
  has_many :email_notification_settings, dependent: :destroy
  has_many :messages
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :watched_posts, dependent: :destroy
  has_many :pictures, as: :owner
  has_many :bids
  has_many :reviews
  def is_vendor?
    self.account_type == 'Vendor'
  end

  # def apply_omniauth(omniauth)


  #   # Update user info fetching from social network
  #   case omniauth['provider']
  #     when 'facebook'
  #       self.email = omniauth['info']['email']

  #       # fetch extra user info from facebook
  #     when 'twitter'
  #       # fetch extra user info from twitter
  #   end
  # end

  def full_name
    self.first_name.camelize + " " + self.last_name.camelize
  end

  # new user is defined as a registered user that havent created any
  # profiles yet
  def new?
    self.account.nil?
  end
  def profile_pic
    if self.galleries.where(name: "Profile_Pictures").empty?
      return nil
    else
      if self.galleries.where(name: "Profile_Pictures").first.attachments.empty?
        return nil
      else
        return self.galleries.where(name: "Profile_Pictures").first.attachments.last
      end
    end
  end
end
