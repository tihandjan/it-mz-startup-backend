module Authenticable
    def current_user
        current_api_v1_user || current_api_v1_admin
    end
end