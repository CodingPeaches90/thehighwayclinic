module ApplicationHelper
    def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-danger", notice: "alert-success" }.stringify_keys[flash_type.to_s] || flash_type.to_s
    end

    def flash_messages(opts = {})
        flash.each do |msg_type, message|
            concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do
                concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
                concat message
                end)
        end
        nil
    end

    # For Toaster GEM : https://coderwall.com/p/ximm8a/coverting-rails-flash-messages-to-toastr-notifications
    def custom_bootstrap_flash
        flash_messages = []
        flash.each do |type, message|
            type = 'success' if type == 'notice'
            type = 'error'   if type == 'alert'
            text = "<script>
                        toastr.#{type}('#{message}');
                    </script>"
            flash_messages << text.html_safe if message
        end
        flash_messages.join("\n").html_safe
    end
    # https://stackoverflow.com/questions/4081744/devise-form-within-a-different-controller
    
    def resource_name
        :user
    end
end
