require "rails_helper"

RSpec.describe Blog do
    it 'does not save when empty' do
        blog = Blog.new

        expect(blog.save).to eq(false)
    end
end
