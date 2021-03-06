class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :set_family

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)
    # @picture = @family.album.pictures.bulid(picture_params)

    respond_to do |format|
      if @picture.save
        # @album = @family.album.pictures.bulid
        # @album.save

        logger.debug("kosakfodskof #{@family.album}")
        logger.debug("ddddddd #{Album.find_by(family_id: @family.id)}")
        logger.debug("ddddddd #{@family.id}")
        @family.album.pictures << @picture
        format.html { redirect_to [@family, @picture], notice: 'Picture was successfully created.', :flash => {:family_id => @family} }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to [@family, @picture], notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to family_pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      # params.require(:picture).permit(:date)
      params.require(:picture).permit(:date, :image, :image_cache, :remove_image)
      # params.require[:picture]
    end

    def set_family
      @families = Family.all
      @family = Family.find(params[:family_id])
    end
end
