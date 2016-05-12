class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  # devise :omniauthable, :omniauth_providers => [:facebook]
  # devise :omniauthable, :omniauth_providers => [:google_oauth2]

  # Associations
  has_many :addresses, dependent: :destroy
  has_many :cart_items
  has_many :products, through: :cart_items
  has_many :user_orders, dependent: :destroy
  has_many :wish_lists
  has_many :used_coupons
  has_many :coupons, through: :used_coupons

  # Callbacks
  after_create :welcome_user

  # validates_presence_of :fname
  # validates :fname, length: { minimum: 3, too_short: "should be atleast 3 characters long."}, format: { with: /[a-zA-Z]+/ }
  # validates :phone, length: { minimum: 10, too_short: "should be atleast 10 digits long."}, format: { with: /\A[7-9]{1}[0-9]+/ }

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize# do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.fname = auth.info.name   # user model has a fname
      # image = auth.info.image # assuming the user model has an image
    # end
    user.save
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
        user = User.create(fname: data["name"],
        email: data["email"],
        password: Devise.friendly_token[0,20]
      )
    user
  end

  def facebook_profile_image(size)
    "http://graph.facebook.com/#{self.uid}/picture?type=#{size}"
  end

  private
    def welcome_user
      UserMailer.welcome_email(self).deliver_now
    end
end
