class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :autocomplete_alias_name, Alias
    can :findTF, Alias
    can :search_by_isoforms, Reagent
    can :search, Reagent
    can :get_attributes, ReagentType

    can :autocomplete_transcription_factor_name, TranscriptionFactor
    can :get_isoforms, TranscriptionFactor
    if user.role? :normal
      can :update, User, :id => user.id

      can :create, Alias
      can :update, Reagent
      can :manage, ReagentValue
      can :manage, ReagentAttribute

      can :create, Attempt
      can :update, Attempt do |attempt|
        (attempt.reagent.source_id == user.source_id) || attempt.user_ids.include?(user.id)
      end
      can :destroy, Attempt do |attempt|
        attempt.user_ids.include? user.id
      end
      can :create, Status
      can :update, Status do |status|
        status.attempt.reagent.source_id == user.source_id
      end
      can :destroy, Status, :user_id => user.id
    end
    if user.role? :admin
      can :manage, [TranscriptionFactor, Isoform, Reagent, Tag, Source, User, Attempt, Status, ReagentType, ReagentAttribute, ReagentValue, Pipeline, Step, Alias]
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
