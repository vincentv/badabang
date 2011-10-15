class User
  include MongoMapper::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  key :nickname, String

  key :location, Array

  key :reward, Integer, :default => 1000
  key :won, Integer, :default => 0
  key :lost, Integer, :default => 0

  key :facebook_id, String
  key :gender, String, :default => "male"

  ensure_index [[:location, '2d']]

  def win
    increment(:won => 1, :reward => 2000)
  end

  def lose
    increment(:lost => 1)
    decrement(:reward => 1000) unless reward <= 1000
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.first(:email => data["email"])
      user
    else # Create a user with a stub password.
      username = data['username']? data['username'] : data["name"]
      gender = data["gender"]? data['gender'] : 'male'
      id = data["id"]? data['id'] : nil
      User.create(:nickname => data["username"], :email => data["email"], :password => Devise.friendly_token[0,20], :gender => gender, :facebook_id => id )
    end
  end
end
