class Blog < ApplicationRecord

    validates :title, presence: true
    validates :author, presence: true
    validates :body, presence: true, length: {minimum: 5}
    validates :excerpt, presence: true, length: {minimum: 5}

end
