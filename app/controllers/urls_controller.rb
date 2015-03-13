class UrlsController < ApplicationController

 def new
  	@url = Url.new
  	@defaultShortenedUrl = randomUrlString
  end

  def create
  	@url = Url.new(url_params)
    if !@url.target.include? "http://"
      @url.target = "http://#{@url.target}"
    end
  	if @url.save
  		# Handle a successful save
  	else
  		render 'new'
  	end
  end

  def show
    @url = current_url
    @target_url = @url.target
  end


  private

  	def randomUrlString
  		(0...20).map { ('a'..'z').to_a[rand(26)] }.join
  	end

  	def url_params
  		params.require(:url).permit(:target, :shortened)
  	end

    def current_url
      @url ||= Url.find_by(shortened: params[:id])
    end
end
