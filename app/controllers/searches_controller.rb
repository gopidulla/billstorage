class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def create
		@search = Search.create!(params[:bills])
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end
end
