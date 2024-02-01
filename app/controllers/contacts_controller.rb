class ContactsController < ApplicationController
  def create
    # Ici, vous traiteriez les données du formulaire, par exemple, en envoyant un email.
    Rails.logger.info "Contact Info: #{params[:contact].inspect}"
    flash[:notice] = "Merci de nous avoir contactés ! Nous reviendrons vers vous bientôt."
    redirect_to root_path
  end
end
