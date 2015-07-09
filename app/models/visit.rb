class Visit < ActiveRecord::Base

  def self.record_visit!(user, shortened_url)
    Visit.new({:visitor_id => user.id, :shortened_url_id => shortened_url.id})
  end

  belongs_to(
    :shortened_url,
    :class_name => "ShortenedUrl",
    :foreign_key => :shortened_url_id,
    :primary_key => :id
  )

  belongs_to(
    :user,
    :class_name => "User",
    :foreign_key => :visitor_id,
    :primary_key => :id
  )

end
