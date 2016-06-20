class Formatter
  class << self
    def html(text)
      @text = text
      sanitize
      linkify_urls
      linkify_hashtags_and_usernames
      @text.strip.squeeze(" ")
    end

    private

    def sanitize
      @text.gsub!(/\</, "&lt;")
      @text.gsub!(/\>/, "&gt;")
    end

    def linkify_urls
      @text.gsub!(/http\S+/) do |text|
        "<a href=\"#{ text }\" target=\"_blank\">#{ text }</a> "
      end
    end

    def linkify_hashtags_and_usernames
      @text.gsub!(/(\#|\@)\w+/) do |text|
        "<a href=\"/#{ text[0] == "#" ? "hashtag/" : "users/profile/" }"\
        "#{ text[1..text.size] }\">#{ text }</a> "
      end
    end
  end
end
