namespace :seed do
  desc "Create or update the base records required by the application"
  task base: :environment do
    user = User.find_or_initialize_by(user_name: "admin")
    user.assign_attributes(
      first_name: "admin",
      last_name: "admin",
      email: "roga.zero@gmail.com",
      role: :admin
    )
    user.password = "186425" if user.new_record? || user.encrypted_password.blank?
    user.save!

    puts "Base seed completed."
  end
end
