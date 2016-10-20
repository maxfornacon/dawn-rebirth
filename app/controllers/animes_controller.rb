class AnimesController < ApplicationController
  before_action :set_anime, only: [:show, :edit, :update, :destroy, :change]
  before_action :authenticate_user!

  # GET /animes
  # GET /animes.json
  def index
    @to_watch = current_user.animes.where(state: "to_watch")
    @watching = current_user.animes.where(state: "watching")
    @watched = current_user.animes.where(state: "watched")
  end

  # GET /animes/1
  # GET /animes/1.json
  def show
  end

  # GET /animes/new
  def new
    @anime = Anime.new
  end

  # GET /animes/1/edit
  def edit
  end

  # POST /animes
  # POST /animes.json
  def create
    @anime = current_user.animes.new(anime_params)

    respond_to do |format|
      if @anime.save
        format.html { redirect_to anime_kanban_path(@anime.user), notice: 'Anime was successfully created.' }
        format.json { render :show, status: :created, location: @anime }
      else
        format.html { render :new }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animes/1
  # PATCH/PUT /animes/1.json
  def update
    respond_to do |format|
      if @anime.update(anime_params)
        format.html { redirect_to @anime, notice: 'Anime was successfully updated.' }
        format.json { render :show, status: :ok, location: @anime }
      else
        format.html { render :edit }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animes/1
  # DELETE /animes/1.json
  def destroy
    @anime.destroy
    respond_to do |format|
      format.html { redirect_to anime_kanban_path(@anime.user), notice: 'Anime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change
    @anime.update_attributes(state: params[:state])
    respond_to do |format|
      format.html {redirect_to :back}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime
      @anime = Anime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anime_params
      params.require(:anime).permit(:name, :start, :end, :state)
    end
end
