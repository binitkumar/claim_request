class ClaimsController < ApplicationController
  before_action :set_claim, only: [:show, :edit, :update, :destroy, :render_image]
  before_action :authenticate_user!

  # GET /claims
  # GET /claims.json
  def index
    @claims = Claim.all
  end

  # GET /claims/1
  # GET /claims/1.json
  def show
  end

  # GET /claims/new
  def new
    @claim = Claim.new
    @generated_claim_id = Claim.count + 1
  end

  # GET /claims/1/edit
  def edit
  end

  # POST /claims
  # POST /claims.json
  def create
    @claim = Claim.new(claim_params)
    @claim.user = current_user
    
    if params[:claim][:damage_room_overview_1]
      @claim.damage_room_overview_1 = params[:claim][:damage_room_overview_1].read
    end
    if params[:claim][:details_of_damage_1]
      @claim.details_of_damage_1 = params[:claim][:details_of_damage_1].read
    end
    if params[:claim][:damage_room_overview_2]
      @claim.damage_room_overview_2 = params[:claim][:damage_room_overview_2].read
    end
    if params[:claim][:details_of_damage_2]
      @claim.details_of_damage_2 = params[:claim][:details_of_damage_2].read
    end

    params[:claim][:photos_attributes].each do |key, value|
      photo = @claim.photos.build
      photo.content = value["content"].read
      photo.filename = value["content"].original_filename
      photo.content_type = value["content"].content_type
    end

    respond_to do |format|
      if @claim.save
        format.html { redirect_to @claim, notice: 'Claim was successfully created.' }
        format.json { render :show, status: :created, location: @claim }
      else
        format.html { render :new }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claims/1
  # PATCH/PUT /claims/1.json
  def update
    if params[:claim][:damage_room_overview_1]
      @claim.damage_room_overview_1 = params[:claim][:damage_room_overview_1].read
    end
    if params[:claim][:details_of_damage_1]
      @claim.details_of_damage_1 = params[:claim][:details_of_damage_1].read
    end
    if params[:claim][:damage_room_overview_2]
      @claim.damage_room_overview_2 = params[:claim][:damage_room_overview_2].read
    end
    if params[:claim][:details_of_damage_2]
      @claim.details_of_damage_2 = params[:claim][:details_of_damage_2].read
    end
    respond_to do |format|
      if @claim.update(claim_params)
        format.html { redirect_to @claim, notice: 'Claim was successfully updated.' }
        format.json { render :show, status: :ok, location: @claim }
      else
        format.html { render :edit }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claims/1
  # DELETE /claims/1.json
  def destroy
    @claim.destroy
    respond_to do |format|
      format.html { redirect_to claims_url, notice: 'Claim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def render_image
    send_data @claim.send(params[:image_name]), :type => 'image/jpg',:disposition => 'inline'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim
      @claim = Claim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claim_params
      params.require(:claim).permit(:user_id, :terms_and_conditions, :damage_room_overview_1, :damage_room_overview_2, :details_of_damage_1, :details_of_damage_2)
    end
end
