class Admins::Aml::NameScreeningsController < Admins::ApplicationController
  before_action :set_name_screening, only: %i[ show edit update destroy ]

  # GET /admins/aml/name_screenings or /admins/aml/name_screenings.json
  def index
    @name_screenings = NameScreening.all
  end

  # GET /admins/aml/name_screenings/1 or /admins/aml/name_screenings/1.json
  def show
  end

  # GET /admins/aml/name_screenings/new
  def new
    @name_screening = NameScreening.new
  end

  # GET /admins/aml/name_screenings/1/edit
  def edit
  end

  # POST /admins/aml/name_screenings or /admins/aml/name_screenings.json
  def create
    @name_screening = NameScreening.new(name_screening_params)

    respond_to do |format|
      if @name_screening.save
        format.html { redirect_to [ :admins, :aml, @name_screening ], notice: "Name screening was successfully created." }
        format.json { render :show, status: :created, location: @name_screening }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @name_screening.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /admins/aml/name_screenings/1 or /admins/aml/name_screenings/1.json
  def update
    respond_to do |format|
      if @name_screening.update(name_screening_params)
        format.html { redirect_to [ :admins, :aml, @name_screening ], notice: "Name screening was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @name_screening }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @name_screening.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /admins/aml/name_screenings/1 or /admins/aml/name_screenings/1.json
  def destroy
    @name_screening.destroy!

    respond_to do |format|
      format.html { redirect_to admins_aml_name_screenings_path, notice: "Name screening was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name_screening
      @name_screening = NameScreening.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def name_screening_params
      params.fetch(:name_screening, {})
    end
end
