class LgtmsController < ApplicationController
  def index
    @lgtms = Lgtm.all
    @lgtm = Lgtm.new
  end

  def lgtm_tweet
    @lgtms = Lgtm.all
    @tweet = ""
    content = lgtm_params[:content]

    if content.blank?
      # dont do anything
    else
      while @tweet.length < 140 do
        @tweet += "LGTM" + content
      end

      @tweet = @tweet[0..139]
    end

    @lgtm = Lgtm.new(content: @tweet)

    lgtm_save_flag = lgtm_params[:save]

      if lgtm_save_flag == "1"
        if @lgtm.save
          flash[:notice] = "LGTMの作成と保存に成功しました!"
          turbo_stream
        else
          render :index, status: :unprocessable_entity
          flash[:error] = @lgtm.errors.full_messages.join(", ")
        end
      else
        flash.now[:notice] = "LGTMの作成に成功しました!"
        turbo_stream
      end
  end

  private

  def lgtm_params
    params.require(:lgtm).permit(:content, :save)
  end

end
