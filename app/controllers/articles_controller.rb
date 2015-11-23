class  ArticlesController < ApplicationController
	# before_action :validate_user, except: [:show, :index]
	before_action :authenticate_user!, except: [:show, :index]

	before_action :set_article, except: [:new, :index, :create]

	def index
		@articles = Article.all
	end

	def show
		@article.update_visits_count
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new article_params
		
		if @article.save
			redirect_to articles_path
		else
			render :new
		end		
	end

	def destroy
		@article.destroy
		redirect_to articles_path	
	end

	def edit
	end

	def update
		if @article.update article_params
			redirect_to articles_path
		else
			render :edit	
		end	
	end	

	private
		def article_params
			params.require(:article).permit(:title, :body)
		end

		def validate_user
			redirect_to new_user_session_path, notice: "Necesitas iniciar sesion"
		end

		def set_article
			@article = Article.find(params[:id])	
		end	
end