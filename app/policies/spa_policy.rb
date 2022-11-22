class SpaPolicy < ApplicationPolicy
  class Scope < Scope

    def show?
      true
    end

    def new?
      true
    end

    def create?
      true
    end
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
