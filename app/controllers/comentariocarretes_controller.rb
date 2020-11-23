class ComentariocarretesController < ApplicationController
  before_action :set_comentariocarrete, only: [:show, :edit, :update, :destroy]

  # GET /comentariocarretes
  # GET /comentariocarretes.json
  def index
    if current_user
      @comentariocarretes = Comentariocarrete.all
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # GET /comentariocarretes/1
  # GET /comentariocarretes/1.json
  def show
    if current_user
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # GET /comentariocarretes/new
  def new
    if current_user
      @comentariocarrete = Comentariocarrete.new
      @carrete = params[:carrete]
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # GET /comentariocarretes/1/edit
  def edit
  end

  # POST /comentariocarretes
  # POST /comentariocarretes.json
  def create
    if current_user
      @carrete = Carrete.find(params[:carrete])
      @comentariocarrete = Comentariocarrete.new(comentariocarrete_params)
      @comentariocarrete.user = current_user
      @comentariocarrete.carrete = Carrete.find(params[:carrete].to_i)

      respond_to do |format|
        if @comentariocarrete.save
          format.html { redirect_to @carrete, notice: 'Comentario realizado!' }
          format.json { render :show, status: :created, location: @carrete }
        else
          format.html { render :new }
          format.json { render json: @comentariocarrete.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # PATCH/PUT /comentariocarretes/1
  # PATCH/PUT /comentariocarretes/1.json
  def update
    respond_to do |format|
      if @comentariocarrete.update(comentariocarrete_params)
        format.html { redirect_to @comentariocarrete, notice: 'Comentariocarrete was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentariocarrete }
      else
        format.html { render :edit }
        format.json { render json: @comentariocarrete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentariocarretes/1
  # DELETE /comentariocarretes/1.json
  def destroy
    if current_user
      @comentariocarrete.destroy
      respond_to do |format|
        format.html { redirect_to carrete_url(:id => params[:carrete], :bool => @bool), notice: 'Comentario eliminado correctamente' }
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
    def set_comentariocarrete
      @comentariocarrete = Comentariocarrete.find(params[:comentario])
    end

    # Only allow a list of trusted parameters through.
    def comentariocarrete_params
      params.require(:comentariocarrete).permit(:comentario)
    end
end
