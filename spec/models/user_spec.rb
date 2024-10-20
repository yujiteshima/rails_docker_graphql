# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前があれば有効であること" do
    user = User.new(name: "Test User")
    expect(user).to be_valid
  end

  it "名前がなければ無効であること" do
    user = User.new(name: nil)
    expect(user).not_to be_valid
  end
end
