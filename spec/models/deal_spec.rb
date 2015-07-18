require 'rails_helper'

describe Deal do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:item_quantity) }
  it { should validate_presence_of(:item_price) }
  it { should have_many(:purchased_items) }

  it "should be valid with a title, description, and item quantity" do
    expect(build(:deal)).to be_valid
  end

  it "should not be valid without a title" do
    deal = build(:deal, title: nil)
    deal.valid?
    expect(deal.errors[:title]).to include("can't be blank")
  end

  it "should not be valid without a description" do
    deal = build(:deal, description: nil)
    deal.valid?
    expect(deal.errors[:description]).to include("can't be blank")
  end

  it "should not be valid without a item_quantity" do
    deal = build(:deal, item_quantity: nil)
    deal.valid?
    expect(deal.errors[:item_quantity]).to include("can't be blank")
  end

  it "should not be valid without a item_price" do
    deal = build(:deal, item_price: nil)
    deal.valid?
    expect(deal.errors[:item_price]).to include("can't be blank")
  end

  it "should belong to a vendor" do
    vendor = create(:vendor)
    deal = create(:deal, vendor_id: vendor.id)
    expect(vendor.deals.count).to eq(1)
  end
end
