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
        @codigos[carrete.id] = ["#{carrete.code}-#{current_user.id}", @apuestas_filtradas_usuario[0].bet]
      else
        @codigos[carrete.id] = [0, 'No califica'] 
      end
    end
    #puts @codigos
  end

  def admin
    @carretes = Carrete.where(aprobado: 0)
    @servicios = Servicio.where(aprobado: 0)
  end

end
