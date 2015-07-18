require 'rails_helper'

describe User do

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should have_many(:purchased_items) }
  it { should have_many(:deals) }
  it { should have_many(:favorite_vendors) }
  it { should have_many(:favorites) }


  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is valid with a username, email, and password" do
    expect(build(:user)).to be_valid
  end
  it "is invalid without a username" do
    user = build(:user, username: nil)
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
    user = build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it "is invalid with a duplicate username" do
    create(:user, username: "bob")
    user = build(:user, username: "bob")
    user.valid?
    expect(user.errors[:username]).to include('has already been taken')
  end
end
