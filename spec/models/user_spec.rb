require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Reem Salim', photo: 'https://imgv3.fotor.com/images/homepage-feature-card/Fotor-AI-photo-enhancement-tool.jpg', bio: 'Hello my name is reem I am 22 years old', posts_counter: 5) }

  before { subject.save }

  it 'The name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'The name should be present' do
    expect(subject).to be_valid
  end

  it 'Posts counter should be valid value integer and greater than zero' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  it 'Posts counter should be valid value integer and greater than zero' do
    expect(subject).to be_valid
  end

  it 'It will displayed to each user 3 posts limit' do
    expect(subject.posts_counter).to eql(5)
  end
end
