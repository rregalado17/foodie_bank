class User < ActiveRecord::Base

has_secure_password
validates :email, uniqueness: true
validates :email, presence: true

has_many :recipes

    def slug
        self.email.downcase.gsub(" ")
    end

    def self.find_by_slug(slug)
        self.all.find {|e| e.email if e.slug == slug}
    end

end
