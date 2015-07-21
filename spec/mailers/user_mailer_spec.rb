require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "email_vendor" do
    before(:each) do
      ActionMailer::Base.deliveries = []
      @deliveries = ActionMailer::Base.deliveries
      @vendor = create(:vendor)
      @deal = create(:deal)
      @vendor.deals << @deal
      @user = create(:user)
      @user.favorites << @vendor
      UserMailer.email_followers(@deal).deliver
    end

    after(:each) do
      @deliveries.clear
    end

    it "sends an email" do
      expect(@deliveries.count).to eq(1)
    end

    it 'renders the receiver name' do
      expect(@deliveries.first.from).to eq(["fullbellies@example.com"])
    end

    it 'renders the subject of the email should contain the vendor name' do
      expect(@deliveries.first.subject).to include(@vendor.name)
    end

    it 'should include a link to full bellies in the body' do
      expect(@deliveries.first.body).to include("https://afternoon-meadow-3523.herokuapp.com/")
    end
  end

  describe "email_followers" do
    before(:each) do
      ActionMailer::Base.deliveries = []
      @deliveries = ActionMailer::Base.deliveries
      @vendor = create(:vendor)
      @deal = create(:deal)
      @vendor.deals << @deal
      @user = create(:user)
      @user.favorites << @vendor
      @purchase = create(:purchased_item)
      UserMailer.email_vendor(@deal, @purchase).deliver
    end

    it "sends an email" do
      expect(@deliveries.count).to eq(1)
    end

    it 'renders the receiver name' do
      expect(@deliveries.first.from).to eq(["fullbellies@example.com"])
    end

    it 'renders the subject of the email should contain the vendor name' do
      expect(@deliveries.first.subject).to include(@vendor.name)
    end

    it 'should include a link to full bellies in the body' do
      expect(@deliveries.first.body).to include("https://afternoon-meadow-3523.herokuapp.com/")
    end
  end
end
