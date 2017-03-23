class SearchesController < ApplicationController
	def new
		@search = Search.new
        0.times {@search.dvs.build}
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

	private

	def search_params
		params.require(:search).permit(:keywords, :section, :year, :month, :dvno)
		
	end
end
