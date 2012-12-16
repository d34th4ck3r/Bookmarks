class BookmarksController < ApplicationController
	def index
		@bookmarks=Bookmark.all
		@searched=params[:searched]

		if @searched
			@searched=@searched.split(",")
		end

		@search_results=Bookmark.tagged_with(@searched,:any=>true)

		respond_to do |format|
			format.html 
			format.json { render :json => @bookmarks} 
			format.js 
		end
	end

	def show
		@bookmark=Bookmark.find(params[:id])
		render :json => @bookmark
		
	end

	def edit
		@bookmark=Bookmark.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render :json => @bookmarks} 
		end
	end

	def new
		@bookmark=Bookmark.new
	end

	def create
		@bookmark=Bookmark.new(params[:bookmark])
		if @bookmark.save
			redirect_to bookmarks_path , :notice => "Saved Sucessfully"
		else
			render "new"
		end
	end

	def update
		@bookmark=Bookmark.find(params[:id])
		if @bookmark.update_attributes(params[:bookmark])
			redirect_to bookmarks_path , :notice => "Saved Sucessfully"
		else
			render "new"
		end
	
	end
	
	def destroy
		@bookmark=Bookmark.find(params[:id])
		@bookmark.destroy
		redirect_to bookmarks_path , :notice => "Bookmark deleted"	
	end

	def search

		@tags=params[:tags]
		if @tags
			@tags=@tags.split(",")
		end

		@search_results=Bookmark.tagged_with(@tags,:any=>true)
		respond_to do |format|
			format.html
			format.js
		end
	end

	def ajax

	end
end
