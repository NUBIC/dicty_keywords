class KeywordsController < ApplicationController
    before_action :set_keyword, only: [:show, :get_info]

  # GET /keywords
  # GET /keywords.json
  def index
    @keywords = Keyword.all
  end

  # GET /keywords/1
  # GET /keywords/1.json
  def show
  end
    
    def get_info
        
        respond_to do |format|
            format.json { render :json => @keyword.to_json }
        end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
        @keyword = Keyword.find_by_id(params[:id]) || Keyword.find_by_word(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keyword_params
      params.require(:keyword).permit(:word, :strains)
    end
end
