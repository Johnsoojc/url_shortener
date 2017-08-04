class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.shorten
      if @url.save
        # redirect_to url_path(@url)
        redirect_to @url
      else
        render 'new'
      end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path
  end

  def short
    url = Url.find(params[:id])
    redirect_to url.long_url
  end

  # def shorten do
  #
  #   @url = Url.new(long_url: url_params, short_url: SecureRandom.hex(4))
  #     if @url.save
  #       redirect_to @url
  #     #   else
  #     #    @errors = @url.errors.full_messages.join(",")
  #     #    #this is the error message give from ActiveRecord because it does
  #     #    #not pass the validation stated on model erb
  #     #
  #     # #   i need my code to remember my error variaable when its not saved successfully, thats why
  #     # #   i load the erb instead of redirecting to '/' because once i do redirecting to '/',
  #     # #   my code will forget the defined local variable
  #     # end
  #     end
  #     # @urls = Url.all.order("created_at DESC")
  #     redirect_to urls_path
  #   end

  private
  def url_params
    params.require(:url).permit(:long_url)
  end


end
