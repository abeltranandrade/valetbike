Stripe.api_key = ENV['STRIPE_SECRET_KEY']

class CheckoutController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    # TODO: CHECK BIKE AVAILABILITY
    @bike_id = params[:id]
    begin
      product = Stripe::Product.retrieve('STANDARD_RIDE')
    rescue Stripe::InvalidRequestError => error
      flash[:alert] = "Something went wrong! Please choose another."
      Rails.logger.error "[!] Stripe: Retrieving product failed: #{error}"
      # Redirect to failure page
      redirect_to action: :index
      return
    end

    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    @checkout_session = current_user.payment_processor.checkout(
      mode: "payment",
      line_items: product.default_price,
      client_reference_id: @bike_id,
      success_url: checkout_success_url
    )
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    bike_id = @session[:client_reference_id]
    bike = Bike.find_by(identifier: bike_id)
  end
end
