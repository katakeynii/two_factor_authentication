module Devise
    module Strategies
    #   class TwoFactorAuthenticatable < Devise::Strategies::DatabaseAuthenticatable
        class TwoFactorAuthenticatable < Devise::Strategies::Base
            def authenticate!
                resource  = mapping.to.find_for_database_authentication(authentication_hash)
                hashed = false

                if validate(resource){ hashed = true; resource.valid_password?(password) }
                    super
                end

                fail(Devise.paranoid ? :invalid : :not_found_in_database) unless resource

                @halted = false if @result == :failure
            end
        end
    end
  end

  Warden::Strategies.add(:two_factor_authenticatable, Devise::Strategies::TwoFactorAuthenticatable)