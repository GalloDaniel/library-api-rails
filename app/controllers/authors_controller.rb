class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show update destroy ]

  # GET /authors
  def index
    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)

    @authors = Author.all.page(page_number).per(per_page)

    render json: @authors, include: [:books]
  end

  # GET /authors/1
  def show
    render json: @author, include: [:books]
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  def update
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    @author.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:name, :main_gender, :age)
    end
end
