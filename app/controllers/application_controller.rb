class ApplicationController < ActionController::Base
    # def hello
    #     render html: "hello, world!"
    # end
    # layout 'application'
    before_action :authenticate_user!
end
