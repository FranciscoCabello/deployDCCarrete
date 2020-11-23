class ComentarioserviciosController < ApplicationController
  before_action :set_comentarioservicio, only: [:show, :edit, :update, :destroy]

  # GET /comentarioservicios
  # GET /comentarioservicios.json
  def index
    if current_user
      @comentarioservicios = Comentarioservicio.all
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # GET /comentarioservicios/1
  # GET /comentarioservicios/1.json
  def show
    if current_user
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # GET /comentarioservicios/new
  def new
    if current_user
      @comentarioservicio = Comentarioservicio.new
      @servicio = params[:servicio]
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # GET /comentarioservicios/1/edit
  def edit
    if current_user
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # POST /comentarioservicios
  # POST /comentarioservicios.json
  def create
    if current_user
      @servicio = Servicio.find(params[:servicio])
      @comentarioservicio = Comentarioservicio.new(comentarioservicio_params)
      @comentarioservicio.user = current_user
      @comentarioservicio.servicio = Servicio.find(params[:servicio].to_i)

      respond_to do |format|
        if @comentarioservicio.save
          format.html { redirect_to @servicio, notice: 'Comentario realizado!' }
          format.json { render :show, status: :created, location: @servicio }
        else
          format.html { render :new }
          format.json { render json: @comentarioservicio.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # PATCH/PUT /comentarioservicios/1
  # PATCH/PUT /comentarioservicios/1.json
  def update
    if current_user
      respond_to do |format|
        if @comentarioservicio.update(comentarioservicio_params)
          format.html { redirect_to @comentarioservicio, notice: 'Comentarioservicio was successfully updated.' }
          format.json { render :show, status: :ok, location: @comentarioservicio }
        else
          format.html { render :edit }
          format.json { render json: @comentarioservicio.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # DELETE /comentarioservicios/1
  # DELETE /comentarioservicios/1.json
  def destroy
    if current_user
      @comentarioservicio.destroy
      respond_to do |format|
        format.html { redirect_to servicio_url(:id => params[:servicio], :bool => @bool), notice: 'Comentario eliminado correctamente' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentarioservicio
      @comentarioservicio = Comentarioservicio.find(params[:comentario])
    end

    # Only allow a list of trusted parameters through.
    def comentarioservicio_params
      params.require(:comentarioservicio).permit(:comentario)
    end
end
