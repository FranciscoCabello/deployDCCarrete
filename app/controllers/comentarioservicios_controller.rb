class ComentarioserviciosController < ApplicationController
  before_action :set_comentarioservicio, only: [:show, :edit, :update, :destroy]

  # GET /comentarioservicios
  # GET /comentarioservicios.json
  def index
    @comentarioservicios = Comentarioservicio.all
  end

  # GET /comentarioservicios/1
  # GET /comentarioservicios/1.json
  def show
  end

  # GET /comentarioservicios/new
  def new
    @comentarioservicio = Comentarioservicio.new
    @servicio = params[:servicio]
  end

  # GET /comentarioservicios/1/edit
  def edit
  end

  # POST /comentarioservicios
  # POST /comentarioservicios.json
  def create
    @comentarioservicio = Comentarioservicio.new(comentarioservicio_params)
    @comentarioservicio.user = current_user
    @comentarioservicio.servicio = Servicio.find(params[:servicio].to_i)

    respond_to do |format|
      if @comentarioservicio.save
        format.html { redirect_to @comentarioservicio, notice: 'Comentarioservicio was successfully created.' }
        format.json { render :show, status: :created, location: @comentarioservicio }
      else
        format.html { render :new }
        format.json { render json: @comentarioservicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarioservicios/1
  # PATCH/PUT /comentarioservicios/1.json
  def update
    respond_to do |format|
      if @comentarioservicio.update(comentarioservicio_params)
        format.html { redirect_to @comentarioservicio, notice: 'Comentarioservicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentarioservicio }
      else
        format.html { render :edit }
        format.json { render json: @comentarioservicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarioservicios/1
  # DELETE /comentarioservicios/1.json
  def destroy
    @comentarioservicio.destroy
    respond_to do |format|
      format.html { redirect_to comentarioservicios_url, notice: 'Comentarioservicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentarioservicio
      @comentarioservicio = Comentarioservicio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comentarioservicio_params
      params.require(:comentarioservicio).permit(:comentario)
    end
end
