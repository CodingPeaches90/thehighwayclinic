class ApplicationController < ActionController::Base
    # def hello
    #     render html: "hello, world!"
    # end
    # layout 'application'
    protect_from_forgery with: :exception

    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        "/signedinuserprofile"
    end
end
