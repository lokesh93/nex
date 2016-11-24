class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest account

    can :create, User

    # Admins can do everything
    if user.admin?
      can :manage, :all
    else
      if user.account_type == "Consumer"
        can :create, Review
        can [:update], Review do |r|
          r.user == user
        end

        can [:create], Post
        can :all_bids, Post
        can :manage_posts, User
        can [:update], Post do |p|
          p.user == user
        end
        can :activate_post, Post do |p|
          p.user == user
        end
        can [:change_status], Bid do |b|
          b.post.user == user
        end
      elsif user.account_type == "Vendor"
        can :all_bids, Post
        can [:create], Comment

        can [:edit], Vendor do |v|
          v.try(:user) == user
        end

      end
      # Anyone can see a Vendor's profile and the list of vendors
      can :read, Vendor
      can :read, Post
      # Since show_account redirects to the edit pages, we need
      # to have access to show_account in order to edit a user
      can [:update, :show_account,:overview,:bids,:inbox,:watched_posts,:account,:profile], User do |u|
        u == user
      end


      # Only the user who owns the vendor profile can edit it
      can :update, Vendor do |v|
        v.try(:user) == user
      end

      # Only guests can create a user
      if user.nil? || user.id.nil?
        can :create, User
      end

      # Only new vendors can create a vendor profile
      # to prevent them from creating more than one VP
      if user.new? && user.is_vendor?
        can :create, Vendor
      end

      # Any User, even guest can view a user's profile page but
      # cannot see the list of users
      can :read, User
      cannot :index, User
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
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
