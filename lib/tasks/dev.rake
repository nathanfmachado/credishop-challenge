namespace :dev do
  DEFAULT_PASSWORD = "123456"

  desc "Set the development environment up"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Droping DB...") { `rails db:drop` }
      show_spinner("Creating DB...") { `rails db:create` }
      show_spinner("Migrating DB...") { `rails db:migrate` }
      show_spinner("Creating default user...") { `rake dev:add_default_user` }
      show_spinner("Populating brazilian states...") { `rails db:seed` }
      show_spinner("Populating other tables using fakes...") { `rake dev:faker_populate` }
    else
      puts "You are not in development environment!"
    end
  end

  desc "Add default user"
  task add_default_user: :environment do
    User.create!(
      email:                 "admin@admin.com",
      password:              DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Populate Proponents, Addresses and Contacts with fake data"
  task faker_populate: :environment do
    20.times do |i|
      salary = rand(500...8500)
      inss_discount = CalculateInssDiscountJob.perform_now(salary.to_f)
      proponent = Proponent.create!(
        name:          Faker::Name.name,
        cpf:           Faker::IDNumber.valid,
        birth_date:    Faker::Date.between(from: Date.today.ago(75.years),
                                           to:   Date.today.ago(16.years)),
        salary:        salary,
        inss_discount: inss_discount
      )
      Address.create!(
        proponent_id: proponent.id,
        street:       Faker::Address.street_address,
        number:       Faker::Address.building_number,
        neighborhood: Faker::Address.street_name,
        city:         Faker::Address.city,
        state_id:     rand(1..27),
        cep:          Faker::Address.zip_code
      )
      rand(1..4).times do |i|
        Contact.create!(
          proponent_id: proponent.id,
          phone:        Faker::PhoneNumber.phone_number,
          phone_type:   rand(1..2)
        )
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Success!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success(msg_end.to_s)
  end
end
