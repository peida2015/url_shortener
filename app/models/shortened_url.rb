class ShortenedUrl < ActiveRecord::Base

  def self.random_code
    code = '8'#SecureRandom.urlsafe_64
    #
    while exists?(short_url: code) #while there's something in the database with a short_url of the code we generated
      code = SecureRandom.urlsafe_base64 #make the code something else
    end
    code
  end

  def self.create_for_user_and_long_url(user, long_url)
    create!(submitter_id: user, long_url: long_url, short_url: self.random_code)
  end

  validates :short_url, presence: true, uniqueness: true

end
