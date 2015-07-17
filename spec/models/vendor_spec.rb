require 'rails_helper'

describe Vendor do

  it "has a valid factory" do
    expect(build(:vendor)).to be_valid
  end

  it "is valid with a username, email, password, name and address" do
    expect(build(:vendor)).to be_valid
  end

  it "is invalid without a username" do
    vendor = build(:vendor, username: nil)
    vendor.valid?
    expect(vendor.errors[:username]).to include("can't be blank")
  end

  it "is invalid without an email" do
    vendor = build(:vendor, email: nil)
    vendor.valid?
    expect(vendor.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    create(:vendor, email: "test@example.com")
    vendor = build(:vendor, email: "test@example.com")
    vendor.valid?
    expect(vendor.errors[:email]).to include('has already been taken')
  end

  it "is invalid with a duplicate username" do
    create(:vendor, username: "bob")
    vendor = build(:vendor, username: "bob")
    vendor.valid?
    expect(vendor.errors[:username]).to include('has already been taken')
  end

  it "is invalid with a duplicate business name" do
    create(:vendor, name: "ross's pizza")
    vendor = build(:vendor, name: "ross's pizza")
    vendor.valid?
    expect(vendor.errors[:name]).to include('has already been taken')
  end
end
