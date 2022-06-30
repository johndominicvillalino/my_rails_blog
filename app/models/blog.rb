class Blog < ApplicationRecord

    validates :title, presence: true, length: {minimum: 5}
    validates :author, presence: true, length: {minimum: 5}
    validates :body, presence: true, length: {minimum: 5}
    validates :excerpt, presence: true, length: {minimum: 5}

end
