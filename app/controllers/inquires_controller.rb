class InquiresController < ApplicationController
  def index; end

  def new
    @inquire = Inquire.new
  end

  def create
    @inquire = Inquire.new(inquire_params)
    if @inquire.save
      ContactMailer.send_mail(@inquire).deliver
      redirect_to inquires_path
    else
      render :new
    end
  end

  private

  def inquire_params
    params.require(:inquire).permit(:email, :body, :nickname)
  end
end
