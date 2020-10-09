class CarretesController < ApplicationController
  before_action :set_carrete, only: [:show, :edit, :update, :destroy]

  # GET /carretes
  # GET /carretes.json
  def index
    @bool = params[:bool]

    if current_user && @bool == '0'
      @carretes = Carrete.where(user: current_user.id)

    elsif current_user && @bool == '1'
      @carretes = Carrete.where.not(user: current_user.id)

    elsif current_user && @bool == '2'
      @carretes = Carrete.joins(:carretes_users).where(carretes_users: { user_id: current_user.id })

    else
      @carretes = Carrete.all
    end
  end

  # GET /carretes/1
  # GET /carretes/1.json
  def show
    @bool = params[:bool]
    @comentarios = Comentariocarrete.where(carrete: Carrete.find(params[:id]))
  end

  # GET /carretes/new
  def new
    @carrete = Carrete.new
  end

  # GET /carretes/1/edit
  def edit
  end

  # POST /carretes
  # POST /carretes.json
  def create
    @carrete = Carrete.new(carrete_params)
    @carrete.user = current_user.id

    respond_to do |format|
      if @carrete.save
        format.html { redirect_to @carrete, notice: 'Carrete was successfully created.' }
        format.json { render :show, status: :created, location: @carrete }
      else
        format.html { render :new }
        format.json { render json: @carrete.errors, status: :unprocessable_entity }
      end
    end
  end

  def inscribirse
    @carrete = Carrete.find(params[:carrete_id])
    if @carrete.users.include? current_user
      respond_to do |format|
        format.html { redirect_to carrete_path(params[:carrete_id]), notice: 'Ya perteneces al carrete.' }
      end
    else
      @carrete.users << current_user
      respond_to do |format|
        format.html { redirect_to carrete_path(params[:carrete_id]), notice: 'Has accedido al carrete.' }
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
    @carrete.destroy
    respond_to do |format|
      format.html { redirect_to carretes_url, notice: 'Carrete was successfully destroyed.' }
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
      params.require(:carrete).permit(:titulo, :descripcion, :direccion, :capacidad, :costo, :estado, :imagen)
    end
end
