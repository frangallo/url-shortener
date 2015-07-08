# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :string           not null
#  short_url    :string
#  submitter_id :integer          not null
#

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :presence => true, :uniqueness => true

  def self.random_code
    code = SecureRandom::urlsafe_base64
    until !ShortenedUrl.exists?(:short_url => code)
      code = SecureRandom::urlsafe_base64
    end
    code
  end

  def self.create_for_user_and_long_url!(long_url, user)
    ShortenedUrl.create!({:long_url => long_url, :short_url => ShortenedUrl.random_code, :submitter_id => user.id})
  end

  belongs_to(
    :submitter,
    :class_name => "User",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )

end
