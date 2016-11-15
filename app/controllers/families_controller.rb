class FamiliesController < ApplicationController
  before_action :set_family, only: [:edit, :update, :destroy]

  # GET /families
  # GET /families.json
  def index
    @families = Family.all
  end

  # GET /families/1
  # GET /families/1.json
  def show
    logged_in_user
    if user_signed_in?
      set_family

      logger.debug("FamilyAll  #{Album.find_by(:family_id => 1).pictures}")
    end
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families
  # POST /families.json
  def create
    @family = Family.new
    respond_to do |format|
      if @family.save
        @album = @family.build_album
        @album.save
        current_user.update(family_id: @family.id)
        format.html { redirect_to @family, notice: 'Family was successfully created.' }
        format.json { render :show, status: :created, location: @family }
      else
        format.html { render :new }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /families/1
  # PATCH/PUT /families/1.json
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to @family, notice: 'Family was successfully updated.' }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.json
  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_url, notice: 'Family was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def timeline
    my_family = current_family
    @family_post = my_family.family_posts.build
    @sns_comment = my_family.sns_comments.build(user_id: current_user.id)
    @family_posts = my_family.all_posts.order(created_at: :desc).page(params[:page])
  end

  def notification

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      if params[:id]
        @family = Family.find(params[:id])
      else
        @family = Family.find(current_family)
      end
    end

    def set_current_family
      @family = Family.find(current_family)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_params
      params.require(:family).permit(:name, :friend_open, :general_open, :icon, :coverimage, :description, :title)
    end
    
    # # Need params when creating family
    # def family_params
    #   params.require(:family).permit(:name, :friend_open, :general_open, :icon, :coverimage, :description, :title)
    # end
end
