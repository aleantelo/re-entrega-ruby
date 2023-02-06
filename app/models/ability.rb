# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.rol == 'Admin'
      return unless user.rol == 'Admin'  
      
      can :destroy, User do |usuario|
        usuario.id != user.id
      end

      can :manage, User
      can :manage, Sucursal
      can :manage, Horario

    elsif user.rol == 'Personal Bancario'
      return unless user.rol == 'Personal Bancario' 
      can :read, User do |usuario|
        usuario.id == user.id || usuario.rol == 'Cliente'
      end

      can :update, User do |usuario|
        usuario.id == user.id
      end

      can :manage, Turno

      can :update, Turno do |turn|
        turn.sucursal_id == user.sucursal_id
      end

      can :read, Sucursal

      can :read, Horario

      can :read, User do |usuario|
        usuario.rol == 'Cliente'
      end
      
    
    else
      return unless user.rol == 'Cliente' 
      can :read, User do |usuario|
        usuario.id == user.id
      end

      can :update, User do |usuario|
        usuario.id == user.id
      end

      can :manage, Turno

      can :manage, Turno  do |turn|
        turn.cliente_id == user.id
      end

      can :read, Horario
      can :read, Sucursal

    end
  end
end
