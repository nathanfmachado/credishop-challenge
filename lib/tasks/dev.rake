namespace :dev do
  desc "Set the development environment up"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Droping DB...") { %x(rails db:drop) }
      show_spinner("Creating DB...") { %x(rails db:create) }
      show_spinner("Migrating DB...") { %x(rails db:migrate) }
      show_spinner("Populating DB...") { %x(rails db:seed) }

    else
      puts "You are not in development environment!"
    end
  end

  def show_spinner(msg_start, msg_end = "Success!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end
end
