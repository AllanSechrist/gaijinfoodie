class AddUserToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_reference :restaurants, :user, foreign_key: true

    reversible do |dir|
      dir.up do
        admin_user = User.find_by(email: 'sechristallan@gmail.com')

        unless admin_user
          raise ActiveRecord::MigrationError, "Admin user does not exist."
        end

        Restaurant.update_all(user_id: admin_user.id)
      end
    end
    change_column_null :restaurants, :user_id, false
  end
end
