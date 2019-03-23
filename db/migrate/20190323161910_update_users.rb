class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
      @u = User.find_by( email: 'jordan@admin.com' )
      @u.update_attribute :admin, true
  end
end
