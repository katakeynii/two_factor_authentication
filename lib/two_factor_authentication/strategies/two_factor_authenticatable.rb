module Devise
    module Strategies
    #   class TwoFactorAuthenticatable < Devise::Strategies::DatabaseAuthenticatable
        class TwoFactorAuthenticatable < Devise::Strategies::Base
            def authenticate!
                resource  = mapping.to.find_for_database_authentication(authentication_hash)
                success!(resource)
            end
        end
    end
  end

  Warden::Strategies.add(:two_factor_authenticatable, Devise::Strategies::TwoFactorAuthenticatable)