module Devise
    module Strategies
      class TwoFactorAuthenticatable < Devise::Strategies::DatabaseAuthenticatable

      end
    end
  end

  Warden::Strategies.add(:two_factor_authenticatable, Devise::Strategies::TwoFactorAuthenticatable)