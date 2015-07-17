require 'rails_helper'

describe 'canary test' do
  it "adds 2 and 1 to make 3" do
    expect(2 + 1).to eq 3
  end
end

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is valid with a username, email, and password" do
    expect(build(:user)).to be_valid
  end
  it "is invalid without a username" do
    user = FactoryGirl.build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    create(:user, email: "test@example.com")
    user = build(:user, email: "test@example")
    expect(user.errors[:email]).to include('has already been taken')
  end

  it "is invalid with a duplicate username" do
    create(:user, username: "bob")
    user = build(:user, username: "bob")
    expect(user.errors[:username]).to include('has already been taken')
  end
end
