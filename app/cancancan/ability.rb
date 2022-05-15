class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all
    cannot [:create, :update, :destroy], ActiveRecord::SchemaMigration
  end
end
