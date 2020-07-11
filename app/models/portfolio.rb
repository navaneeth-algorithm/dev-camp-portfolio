class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.angular
        where(subtitle:'Angular Programming')
    end

    scope:ruby_programming,->{where(subtitle:'Ruby Programming')}
end
