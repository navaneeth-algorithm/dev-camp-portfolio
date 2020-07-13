class Portfolio < ApplicationRecord
    has_many :technologies
    validates_presence_of :title, :body, :main_image, :thumb_image
    include Placeholder

    def self.angular
        where(subtitle:'Angular Programming')
    end

    scope:ruby_programming,->{where(subtitle:'Ruby Programming')}

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height:600,width:400)
        self.thumb_image ||= Placeholder.image_generator(height:300,width:200)
    end
end
