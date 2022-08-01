namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if(Rails.env.development?)
      spinner = TTY::Spinner.new("[:spinner] Executando Tarefas ... ", format: :dots)
      spinner.auto_spin

      puts %x(rails db:drop)
      puts %x(rails db:create)
      puts %x(rails db:migrate)
      puts %x(rails db:seed)

      spinner.stop('Tarefa concluída!')
    else
      puts "Você não está em um ambiente de desenvolvimento! "
    end

  end

end
