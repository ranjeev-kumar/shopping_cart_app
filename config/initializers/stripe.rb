Rails.configuration.stripe = { 
  :publishable_key => 'pk_test_NiXpEvSzRX5AFco4u3c92E5I', 
  :secret_key => 'sk_test_DmsmIiCA3S0lneEvXNG7acOV'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]