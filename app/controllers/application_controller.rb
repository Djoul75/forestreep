class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def available?
    # récupérer tous les bookings d'une foret
    @forest = Forest.find(params[:forest_id])
    @bookings = @forest.bookings
    # récupérer les params de l'user (dates début / fin)

    # avec les dates de début et de fin de chaque booking
    # si la
    # on itere avec each pour voir si les dates de début et de fin des bookings,
    # sont incluses dans les dates de l'utlisateur. si les dates de début et de fin
    # incluent les dates de l'utlisateur : renvoie false
    # on itère pour voir si les dates de l'utilisateur sont incluses dans l'un
    # des bookings. si c'est le cas renvoie false
  end


  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
