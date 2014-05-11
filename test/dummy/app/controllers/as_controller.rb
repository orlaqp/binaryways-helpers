class AsController < ApplicationController
  before_action :set_a, only: [:show, :edit, :update, :destroy]

  # GET /as
  def index
    @as = A.all
  end

  # GET /as/1
  def show
  end

  # GET /as/new
  def new
    @a = A.new
  end

  # GET /as/1/edit
  def edit
  end

  # POST /as
  def create
    @a = A.new(a_params)

    if @a.save
      redirect_to @a, notice: 'A was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /as/1
  def update
    if @a.update(a_params)
      redirect_to @a, notice: 'A was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /as/1
  def destroy
    @a.destroy
    redirect_to as_url, notice: 'A was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a
      @a = A.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def a_params
      params.require(:a).permit(:a)
    end
end
