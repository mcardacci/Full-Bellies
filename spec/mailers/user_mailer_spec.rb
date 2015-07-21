require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  before(:each) do
    # ActionMailer::Base.delivery_method = :test
    # ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @vendor = create(:vendor)
    @deal = create(:deal)
    @vendor.deals << @deal
    @user = create(:user)
    @user.favorites << @vendor
    UserMailer.email_followers(@deal).deliver
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it "sends an email" do
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  it 'renders the receiver email' do
    # expect(response)
  end

  it 'should set the title to the corerct title' do
    expect(ActionMailer::Base.deliveries.first.title).to eq(@deal.title)
  end
end

