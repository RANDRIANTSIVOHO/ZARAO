class ChargesController < ApplicationController

	before_action :utype, :confirmed_count
	require "stripe"
	Dotenv::Railtie.load

	$amont = 0

	def new
		@amount = $amont = params[:bob]
	end

	def create

		@amount = $amont

		platform_key = Stripe.api_key
		# create customer on a platform
		cus = Stripe::Customer.create({
		  	source: {object: params['stripeTokenType'], exp_month: 10, exp_year: 2022, number: '4242424242424242'},
		  	description: 'Example customer'
		}, platform_key)

		Stripe::Charge.create({
		  	:amount => @amount,
		  	:currency => "eur",
		  	:description => "Charge for ZARAO",
		  	:customer => cus.id
		})

		
		rescue Stripe::CardError => e
		  	flash[:error] = e.message
		  	redirect_to new_charge_path
	end

end

