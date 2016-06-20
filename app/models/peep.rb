class Peep
  include DataMapper::Resource

  belongs_to(:user)
  has(n, :hashtags, through: Resource)

  property(:id, Serial)
  property(:text, String, length: 140, required: true)
  property(:timestamp, DateTime, required: true)

  def extract_hashtags
    self.text.gsub(/\#\w+/) do |text|
      hashtag = Hashtag.first_or_create(name: text[1..text.size].downcase)
      HashtagPeep.create(hashtag: hashtag, peep: self)
    end
  end
end
