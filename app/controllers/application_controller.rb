class ApplicationController < ActionController::Base
    # def hello
    #     render html: "hello, world!"
    # end
    # layout 'application'

    def index
        render html: "hello", layout: true
    end
end
