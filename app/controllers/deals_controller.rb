class DealsController < ApplicationController

  def index
    @deals = Deal.order(:created_at :desc)
  end

  def new
    @deal = Deal.new

  end

  def create

  end

  def edit
  end

  def update

  end

  def show

  end

  def destroy

  end

  private

    def deal_params
      params.require().permit()
    end


end