class ComentariocarretesController < ApplicationController
  before_action :set_comentariocarrete, only: [:show, :edit, :update, :destroy]

  # GET /comentariocarretes
  # GET /comentariocarretes.json
  def index
    @comentariocarretes = Comentariocarrete.all
  end

  # GET /comentariocarretes/1
  # GET /comentariocarretes/1.json
  def show
  end

  # GET /comentariocarretes/new
  def new
    @comentariocarrete = Comentariocarrete.new
    @carrete = params[:carrete]
  end

  # GET /comentariocarretes/1/edit
  def edit
  end

  # POST /comentariocarretes
  # POST /comentariocarretes.json
  def create
    @comentariocarrete = Comentariocarrete.new(comentariocarrete_params)
    @comentariocarrete.user = current_user
    @comentariocarrete.carrete = Carrete.find(params[:carrete].to_i)

    respond_to do |format|
      if @comentariocarrete.save
        format.html { redirect_to @comentariocarrete, notice: 'Comentariocarrete was successfully created.' }
        format.json { render :show, status: :created, location: @comentariocarrete }
      else
        format.html { render :new }
        format.json { render json: @comentariocarrete.errors, status: :unprocessable_entity }
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
    @comentariocarrete.destroy
    respond_to do |format|
      format.html { redirect_to comentariocarretes_url, notice: 'Comentariocarrete was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentariocarrete
      @comentariocarrete = Comentariocarrete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comentariocarrete_params
      params.require(:comentariocarrete).permit(:comentario)
    end
end
