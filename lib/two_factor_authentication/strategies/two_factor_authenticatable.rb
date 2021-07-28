module Devise
    module Strategies
    #   class TwoFactorAuthenticatable < Devise::Strategies::DatabaseAuthenticatable
    class TwoFactorAuthenticatable < Devise::Strategies::Base

      end
    end
  end

  Warden::Strategies.add(:two_factor_authenticatable, Devise::Strategies::TwoFactorAuthenticatable)