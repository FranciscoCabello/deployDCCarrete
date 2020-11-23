class CarretesController < ApplicationController
  before_action :set_carrete, only: [:show, :edit, :update, :destroy]

  # GET /carretes
  # GET /carretes.json
  def index
    if current_user
      @carretes = Carrete.where(aprobado: 1, estado: 0)
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # GET /carretes/1
  # GET /carretes/1.json
  def show
    if current_user
      @bool = params[:bool]
      @comentarios = Comentariocarrete.where(carrete: Carrete.find(params[:id]))
      @carrete = Carrete.find(params[:id])
      @servicios_contratados = @carrete.servicios
      @weather = Faraday.get 'https://api.openweathermap.org/data/2.5/weather?q=' + 'Santiago' + '&appid=' + "1a241e5d7e24102523c54676905b3fea"
      @weather_json = JSON.parse(@weather.body)
      @weather_description = @weather_json['weather'][0]['description']
      @weather_temp_actual = @weather_json['main']['feels_like'] - 273.15
      @weather_temp_max = @weather_json['main']['temp_max'] - 273.15
      @weather_temp_min = @weather_json['main']['temp_min'] - 273.15
      @weather_humidity = @weather_json['main']['humidity']
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # GET /carretes/new
  def new
    if current_user
      @carrete = Carrete.new
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

  # GET /carretes/1/edit
  def edit
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


  # POST /carretes
  # POST /carretes.json
  def create
    if current_user
      @comuna = Comuna.find(params[:carrete][:comuna])
      @carrete = Carrete.new(carrete_params)
      @carrete.estado = 0
      @carrete.user = current_user.id
      @carrete.comuna = @comuna
      @carrete.code = rand(100000...10000000000)
      @carrete.avatar.attach(params[:carrete][:avatar])
      if current_user.admin == true
        @carrete.aprobado = 1
      else
        @carrete.aprobado = 0
      end

      respond_to do |format|
        if @carrete.save
          format.html { redirect_to @carrete, notice: 'Solicitud de carrete enviada con éxito.' }
          format.json { render :show, status: :created, location: @carrete }
        else
          format.html { render :new }
          format.json { render json: @carrete.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  def agregar_servicio
    if current_user
      @carrete = Carrete.find(params[:carrete_id])
      @servicios = Servicio.where(aprobado: 1)
      render 'inscribir_servicio'
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  def agregar_servicio_def
    if current_user
      @carrete = Carrete.find(params[:carrete_id])
      @servicio = params[:servicio]
      if @carrete.servicios.include? Servicio.find(@servicio)
        respond_to do |format|
          format.html { redirect_to carrete_path(params[:carrete_id]), notice: 'Ya se inscribió este servicio.' }
        end
      else
        if Servicio.find(@servicio).comunas.include? @carrete.comuna
          @carrete.servicios << Servicio.find(@servicio)
          respond_to do |format|
            format.html { redirect_to carrete_path(params[:carrete_id]), notice: 'Servicio inscrito.' }
          end
        else
          respond_to do |format|
            format.html { redirect_to carrete_path(params[:carrete_id]), notice: 'Servicio no se encuentra en esta comuna.' }
          end
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  def inscribirse
    if current_user
      @carrete = Carrete.find(params[:carrete_id])
      if @carrete.users.include? current_user
        respond_to do |format|
          format.html { redirect_to carrete_path(params[:carrete_id]), notice: 'Ya perteneces al carrete.' }
        end
      else
        #@carrete.users << current_user
        render 'introducir_apuesta'
        # respond_to do |format|
        #   format.html { redirect_to carrete_path(params[:carrete_id]), notice: 'Has accedido al carrete.' }
        #end
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  def ingresar_apuesta
    if current_user
      @apuesta = params[:apuesta]
      @carrete = Carrete.find(params[:carrete])
      @carretes = Carrete.where(aprobado: 1, estado: 0)
      if @apuesta.to_i > 0
        @bet = Bet.new({"user_id" => current_user.id, "carrete_id" => @carrete.id, "bet" => @apuesta})
        if @bet.save
          @carrete.users << current_user
          redirect_to controller: 'pages', action: 'show', notice: 'Apuesta realizada con exito!'
        else
          render 'introducir_apuesta'
        end
      else
        flash[:notice] = 'Debes ingresar una apuesta mayor a 0 CLP.'
        render 'introducir_apuesta'
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  def aprobar
    if current_user && current_user.admin
      @carrete = Carrete.find(params[:carrete])
      @carrete.update_attribute(:aprobado, 1)
      @carretes = Carrete.all
      redirect_to controller: 'pages', action: 'admin'
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # PATCH/PUT /carretes/1
  # PATCH/PUT /carretes/1.json
  def update
    respond_to do |format|
      if @carrete.update(carrete_params)
        format.html { redirect_to @carrete, notice: 'Carrete was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrete }
      else
        format.html { render :edit }
        format.json { render json: @carrete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carretes/1
  # DELETE /carretes/1.json
  def destroy
    @comentariocarrete = Comentariocarrete.where(carrete_id: @carrete.id)
    @comentariocarrete.each(&:destroy)
    @bet = Bet.where(carrete_id: @carrete.id)
    @bet.each(&:destroy)
    @carrete.destroy
    respond_to do |format|
      format.html { redirect_to carretes_url, notice: 'Carrete eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrete
      @carrete = Carrete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carrete_params
      params.require(:carrete).permit(:titulo, :descripcion, :direccion, :fecha, :capacidad, :costo, :estado, :imagen)
    end
end
