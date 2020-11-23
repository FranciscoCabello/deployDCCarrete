class ServiciosController < ApplicationController
  before_action :set_servicio, only: [:show, :edit, :update, :destroy]

  # GET /servicios
  # GET /servicios.json
  def index
    @servicios = Servicio.where(aprobado: 1)

    # if current_user && @bool == '0'
    #   @servicios = Servicio.where(user: current_user.id)

    # elsif current_user && @bool == '1'
    #   @servicios = Servicio.where.not(user: current_user.id)

    # else
    #   @servicios = Servicio.all
    # end
  end

  # GET /servicios/1
  # GET /servicios/1.json
  def show
    if current_user
      @bool = params[:bool]
      @comentarios = Comentarioservicio.where(servicio: Servicio.find(params[:id]))
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # GET /servicios/new
  def new
    if current_user
      @servicio = Servicio.new
      coms = Comuna.all
      @comunas = []
      coms.each do |comuna|
        @comunas.append([comuna.nombre, comuna.id])
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # GET /servicios/1/edit
  def edit
    #<td><%= link_to 'Edit', edit_servicio_path(servicio), :class => 'btn btn-default' %></td>
    if current_user
      coms = Comuna.all
      @comunas = []
      coms.each do |comuna|
        @comunas.append([comuna.nombre, comuna.id])
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # POST /servicios
  # POST /servicios.json
  def create
    if current_user
      @servicio = Servicio.new(servicio_params)
      params[:servicio].each do |parametro|
        if parametro[0].to_i.is_a? Integer
          if parametro[1] == '1'
            @servicio.comunas << Comuna.find(parametro[0].to_i)
          end
        end
      end
      @servicio.valoracion = 0
      @servicio.user = current_user
      @servicio.avatar.attach(params[:servicio][:avatar])
      if current_user.admin == true
        @servicio.aprobado = 1
      else
        @servicio.aprobado = 0
      end

      respond_to do |format|
        if @servicio.save
          format.html { redirect_to @servicio, notice: 'Servicio was successfully created.' }
          format.json { render :show, status: :created, location: @servicio }
        else
          format.html { render :new }
          format.json { render json: @servicio.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  def aprobar
    if current_user
      @servicio = Servicio.find(params[:servicio])
      @servicio.update_attribute(:aprobado, 1)
      @servicios = Servicio.all
      redirect_to :controller => 'pages', :action => 'admin'
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # PATCH/PUT /servicios/1
  # PATCH/PUT /servicios/1.json
  def update
    if current_user
      respond_to do |format|
        if @servicio.update(servicio_params)
          format.html { redirect_to @servicio, notice: 'Servicio was successfully updated.' }
          format.json { render :show, status: :ok, location: @servicio }
        else
          format.html { render :edit }
          format.json { render json: @servicio.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # DELETE /servicios/1
  # DELETE /servicios/1.json
  def destroy
    if current_user
      @comentarioservicio = Comentarioservicio.where(servicio_id: @servicio.id)
      @comentarioservicio.each(&:destroy)
      @servicio.destroy
      respond_to do |format|
        format.html { redirect_to servicios_url, notice: 'Servicio eliminado.' }
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
    def set_servicio
      @servicio = Servicio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def servicio_params
      params.require(:servicio).permit(:nombre, :descripcion, :capacidad, :costo, :valoracion, :imagen, :categoria)
    end
end
