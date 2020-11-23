class PagesController < ApplicationController

  def home
    @servicios = Servicio.all
    if @servicios.length >= 3
      @servicios = @servicios[0..2]
    elsif @servicios.length == 2
      @servicios = @servicios[0..1]
    end
    if current_user
      @carretes = Carrete.where(estado: 0, aprobado: 1)
      currenttime = Time.now.to_s.split(' ')[0]
      @carretes.each do |carrete|
        if carrete.fecha.to_s == currenttime
          if carrete.estado == 1
            carrete.update_attribute(:estado, 2)
          end
          if carrete.estado == 0
            carrete.update_attribute(:estado, 1)
          end
        end
      end
    end
  end

  def show
    if current_user
      @carretes_propios = Carrete.where(user: current_user.id, aprobado:1)
      @carretes_inscritos = Carrete.joins(:carretes_users).where(carretes_users: { user_id: current_user.id }, estado: 0)
      @carretes_asistidos = Carrete.joins(:carretes_users).where(carretes_users: { user_id: current_user.id }, estado: 1)
      @servicios_propios = Servicio.where(user: current_user.id, aprobado:1)

      @codigos = {}
      @carretes_inscritos.each do |carrete|
        @apuestas = Bet.where(carrete_id: carrete.id)
        @apuestas.sort_by {|bet| -bet.bet}
        if @apuestas.length > carrete.capacidad
          @apuestas_filtradas = @apuestas[0...carrete.capacidad]
        else
          @apuestas_filtradas = @apuestas
        end
        @apuestas_filtradas_usuario = @apuestas_filtradas.select{|bet| bet.user_id == current_user.id}
        if @apuestas_filtradas_usuario.length > 0
          @codigos[carrete.id] = ["Asistes!", @apuestas_filtradas_usuario[0].bet]
        else
          @codigos[carrete.id] = ["Fuera!", @apuestas_filtradas_usuario[0].bet]
        end
      end

      @codigos_asistir = {}
      @carretes_asistidos.each do |carrete|
        @apuestas = Bet.where(carrete_id: carrete.id)
        @apuestas.sort_by {|bet| -bet.bet}
        if @apuestas.length > carrete.capacidad
          @apuestas_filtradas = @apuestas[0...carrete.capacidad]
        else
          @apuestas_filtradas = @apuestas
        end
        @apuestas_filtradas_usuario = @apuestas_filtradas.select{|bet| bet.user_id == current_user.id}
        if @apuestas_filtradas_usuario.length > 0
          @codigos_asistir[carrete.id] = ["#{carrete.code}-#{current_user.id}", @apuestas_filtradas_usuario[0].bet]
        end
      end

    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end

    #puts @codigos
  end

  def attach_user_avatar
    if current_user.avatar.attached?
      current_user.avatar.purge
      current_user.avatar.attach(params[:avatar])
    else
      current_user.avatar.attach(params[:avatar])
    end
    redirect_to home_path
  end

  def admin
    if current_user && current_user.admin
      @carretes = Carrete.where(aprobado: 0)
      @servicios = Servicio.where(aprobado: 0)
      @usuarios = User.all
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  def resultado_buscador
    @busqueda = params[:busqueda]
    session[:passed_parameter] = @busqueda
    redirect_to '/pages/display_resultado_buscador'
  end

  def display_resultado_buscador
    if current_user
      @busqueda = session[:passed_parameter].titleize
      if @busqueda == ''
        @carretes_validos = []
        @servicios_validos = []
      else
        @carretes = Carrete.where(aprobado: 1, estado: 0)
        @servicios = Servicio.where(aprobado: 1)

        @carretes_validos = []
        @carretes.each do |carrete|
          if (carrete.comuna.nombre.include? @busqueda) || (carrete.titulo.include? @busqueda)
            @carretes_validos.append(carrete)
          end
        end

        @servicios_validos = []
        @servicios.each do |servicio|
          if servicio.nombre.include? @busqueda
            @servicios_validos.append(servicio)
          end
          servicio.comunas.each do |comuna|
            if comuna.nombre.include? @busqueda
              @servicios_validos.append(servicio)
            end
          end
        end
      end    
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  def destroyselecteduser
    if current_user && current_user.admin
      @userdestroy = User.find(params[:destroyuser])
      @bets = Bet.where(user_id: @userdestroy.id)
      @bets.each do |bet|
        bet.destroy
      end
      @carretes = Carrete.where(user: @userdestroy.id)
      @carretes.each do |carrete|
        @comentariocarrete = Comentariocarrete.where(carrete_id: carrete.id)
        @comentariocarrete.each do |comment|
          comment.destroy
        end
        @bet = Bet.where(carrete_id: carrete.id)
        @bet.each do |bet|
          bet.destroy
        end
        carrete.destroy
      end
      @servicios = Servicio.where(user: @userdestroy.id)
      @servicios.each do |servicio|
        @comentarioservicio = Comentarioservicio.where(servicio_id: servicio.id)
        @comentarioservicio.each do |comment|
          comment.destroy
        end
        servicio.destroy
      end
      @commentscarrete = Comentariocarrete.where(user_id: @userdestroy.id)
      @commentscarrete.each(&:destroy)
      @commentsservicio = Comentarioservicio.where(user_id: @userdestroy.id)
      @commentsservicio.each(&:destroy)
      @userdestroy.destroy
      respond_to do |format|
        format.html { redirect_to pages_admin_path, notice: 'Accion realizada correctamente' }
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Necesitar iniciar sesion.' }
      end
    end
  end

  # private
  # def request_api(url)
  #   puts 'REQUEST API'
  #   @response = Excon.get(
  #     url,
  #     headers: {
  #       'X-RapidAPI-Host' => URI.parse(url).host,
  #       'X-RapidAPI-Key' =>  "1a241e5d7e24102523c54676905b3fea"
  #     }
  #   )
  #   puts @response
  #   return nil if @response.status != 200
  #   puts JSON.parse(@response.body)
  #   JSON.parse(@response.body)
  # end

  # def find_country(name)
  #   puts 'FIND COUNTRY'
  #   request_api(
  #     "https://restcountries-v1.p.rapidapi.com/name/#{URI.encode(name)}"
  #   )
  # end

end
