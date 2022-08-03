namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if(Rails.env.development?)

      show_spinner("Apagando DB...") {%x(rails db:drop)}

      show_spinner("Criando DB... ") {%x(rails db:create)}

      show_spinner("Migrando DB... ") {%x(rails db:migrate)}

      %x(rails dev:add_coins)
      # show_spinner("Populando DB... ") {%x(rails db:seed)}

    else
      puts "Você não está em um ambiente de desenvolvimento! "
    end

  end

  desc "Cadastrar as moedas"
  task add_coins: :environment do 

    show_spinner("Cadastrando Moedas") do
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image:  "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAh1BMVEX/////lBb/jgD/iwD/kAD/kQD/igD/kw7/kgv/xpb//fv/+fT/3cL/9/H/69v/1LL/8+n/wIv/7+L/y6D/vIL/483/z6j/2bv/5tL/rmP/tnX/p1H/s27/0q7/mSr/wo//pUz/okT/un7/sGj/nTf/nz3/q1v/lyD/yJv/o0b/plD/hAD/mzDTr9iIAAAOV0lEQVR4nO1d6WKyOhCtCQQUBdxwrVpbtd7P93++K1olk0wW0Epse359iyCMk8mZNS8vf/jDr0CU9uLxEXEvjep+FmeRDrPuZOPTI8gJ+Z/CzXv3dZjW/WwuIR11V+QoIs8PGgIC3zuKjcyWoz81e3npjKYBJV4oSgki9Aj7WA7rftha0fvcMOLr5VQomUforN+r+5nrQfq5oJ607gwaRuih36n7yR+O0YyRkpL6UjDCZqO6n/6RiJo+MVgpvX75zd9i79M19apL6gyPTn8DoUjnzNaka+Gz+U8XVzS9j6jO4pr+aFvfpHcT1UlcdFn3G30b2gG5p6hyEP9n7oydGTVxhSDMvZsCnh8aL6GzH7gWM/0KPDo0lO6262Y2Go7jOB6P26OsOZ01cp9RSzNCmtX9bndGtNKswFxQq+4I92Ra8ai713uPZPWjWFdb7QH6R0F9jk03GH++Ud092o94i8dgwFQ6Rehk1LK7STSaUCXvZ+vvfYOHIdoolqDH9omlpM5oJXumIP9k8yOWYuyjyycgZFAh3tIbENwBD734/s/+aLQZ9m4BCSrvYVmAiitgT2+4+qi5IsHrLTdNcHbL+vd66nrQpchLeeRmZpQRzHbR7j2euS5MEQ0I2aCUVVdgwJCdkTzxpjhHZEU2dwqj996wu0/vc/PHA9Gru/omGZWV61mltZZlRTbmgF3PPkXYQRgcGdz00DVhKdt2ZhN+ajK2sU4RLuXNln7e8tT14FWSVUisRLAPv1KEViRzKHtALLntyR+PofSTewerwFOLXUTLJjaf7xwkEsGMfrlbSCW9Ilu7K9tXM0QsNWQrGS7yXPHAneiQUFsGNLgqCuU2Ay0zW4u/TLi44dEfjq24NGjT9tLFRczBrvjH4T+tCZP2Eu/9lqd/LPriwkC9NpQhFOvX5zjA0gsJJfNERTz6orSeJ9Qci8Ydf/R/WBFRUpgsLojwcVI3n9CGgkVJ0mLPUm4jGiyc+YwJxhDm1+AXK+xUdJW+pyLoTUFawZOYrbVgsAgeC/g8fSxfXu+vxfK6yip8Kz46KtRNmSYcEKtvdQwiwyJz/HOrK5vMl9f67OTEVwXxuC1hXaib2hWaCL8Re4bIaQMuQv8N/1gLrJvgKLDchGWFDnHMMrjukB+aL95ALv8MC7ELl0MQKChSW6KSRxNGdoVCFh/tFeqmcy4joX6XOO8kpsIiVO5KXX2NVsj5Opy6ab1LcRdmrhP5GVwLVBlrX+irGPjI8+Rqsqj+yzOorb6Vc1kfhtTycdN/hnJuUrCwqwhCk3+5hVk36rZHDfUl8NWfHDf3moR8o1HEaeJiFZrSNy2oWqFuP6gdI/iwVB/AarXXiozp9W1zJ+f9qoLUyAbaULOpy6lEyN19BcPiMVqYinH9YrlqFPWCCVBWl+lDAhWLWKW85taVk75FMiISHsHdwkCoWLbBOywPiyJ8t/CO4Y4YHG57o+8D5Jlats1DChSqpUUPmVFb4R5jMJv1YQ/IgPW+XaYrJSB0bcimQfYSzm5+rW9BXPEpkWUYasoiffauFxf8zRwNbK2BpTZv81+Ikbz1LG6+MaLqGfPZWrcYx0D6nptJ14qKlSBZ5Zx8ttqDhaou0vN0BGoFLiKaT9YG+NL2ngZCHa5amWaqTjuqoRHQajnJHsDvGW6sr8NqYbj/jrIFql5ko16KH7x8XTTxHRAfsf85Y9m+i8y/jVbw+gultKCSOxipgWTQs75OSpthbHbkITRfFYN9EbT19jrDuwNs2NqIJsRMXmNUpgatPeJCEuW3gMhiuKr0Qt+ICKxCak9u5FXIp6ILzBDdYirC1QN31WQ56gFwdaw9nbxkSBKBjzOjQN4V1WGNA/9h5/ZDwEiNQboCSChe0YiD8DE+EQsBLKFNtOKhAAkwxOiocJD1RSUBxC1S6gwsebKIgz0S4OFKxEU6sgRC1Sa3krcCxYp9EWIPJUzoI/DKq32JvXAkry1PVZ00lU28mnAu+eVNburnuDvAixD7pAoiAOXVa/mz6rDx0GGjBQJ4huweD4QPKK9+R4TVUN4Z2AWUjNSFiH+08D/r63qIyVKmGj/kvUCTkAAWzimmNQYmy7okUkwh51A6Jy2kvyzcK28NjZZL2Vbw0iUalieIr6PauRD6qjNGgCU7ZeEHvDkpwbIQ6qTkRAPEvmnYLyAzToVLgTdsH5ocI76OUlewZKyuqoa/t7FI4pEAwbaV9WVNxNdRcXLM29Huu3wYRLNrPh68yvv2DZJviMlSRerkSZMGhQEUrgSb+W4A+2DvRSP7m5IRzdFVqAsnfPJXlLCj3w2QzbIPiMiVkqdBPFgvRRdbhPp4LPCkiDvVuHCbtuY02P52KfYGBKIj9zKdvkmrw4Bq2HXvPQTA+Nq7+OoiB/8osO0yGfbSTjp+neADkgxODPAOHIr/AU6qNNEi5DY7qGHeeb4yUdUHGgrdQfTHIVYKbantIAKUDNjD1MvUqrbrfDuAH2a9S9tXsaGyMnqggMLb+6vfDRBItybwtyhWyMzrCgjLnUmKlYSFpKJtEZAPi13kJwkLSUU3iLLMiJOURw9We9tPEhaWiu6dyowUtuw8a5ItupYE01FhVTLwqlR0J5n6WF1WMHufdrOhfZWHowa+CnXQpqLj/oaKdVnBotxwi8hR6lCFlC4NqehO/yAQ94AEZXh46igpreLuWKSiY3HAd0BX9quwonf/7ajgSHfk8AySik7nwsTAkFq/tauOdIUf0TYVHYu9PdQ2nJ44GqKpEPyzT0WL492IZcsliFlbe/cPAL+m7MLKJVLR4oA3S2nNHQ0rl09YlEtFC6RLXR7JY8M9lFOtdKVTYWVS0bIXyWzMNagocKlbunSStUwqWs4CBYH5G4Duei6NDymdvi+TikZ8botNBOYrXJpsV7YwpFQqGnONzIWP0Ll3hzkIhd0WFh7zdTT0TN4OzNrL23d1oW4tKFnMhuR1dE0jsrCM/ARE4EuUmj8CsEzStFmNkfCMrmhXbkk01vIBD6xERcEjYC7ATTizgcT9tPsV4huZFtYAmCy3unfAQkEpIKPeZWYfQrL02oiYOFNsA9blu2TfXwT3BXmTfEPzCfVm68G+bPGQ0PV8Fq7+/aGVc62ZdWpoR7m4taHvY62W2g7KCKkmNQSCgBftuzaIE5gVxFpvDBOgdCzzFVFFw8oC261TlDSH0EInvkpkSBJq3x0JqhpiLtCbpC4Vdp/wH2jOFCN0WCkW0CzNndFr9VwONGM4VVB6Blwr4ssjrSQ8tPOQsMokZTfUGfBZXFuF4joUH7ChN1l+V02bpliBpD6MAH8467KeB2LLr0PBxHc8/RS2hs82TZxp4QWSet8Q9M85OfkP0mxxulCazIn6XLTGeWrdVionbU1wY6fVFmjk3DyhDjwiZlTi/pZqKz/yctJts32ltHFXoY96bYGxQvupCY8EbHdWDK4aNvPj7nUCy4/QbOy3k+0HQY9tMmoLnK7iVJC0AJznqh6wErUHO4MJa4RHqCWqDyvDscHKcQY1YwuHjel+/aMJu6FIUhtFgAMlHSRZZ0D9N4Wc0splkvo7Q1rm7lxX2GtqyCpwgZoyg+wahkzYJ9xn7KctPRqCY6L337hFq672w6A94EqYfeDyVFfo8vpae3F9q3BiZmEcPG0LNpyu7FjwHUKc1qvJ2BTprS9zfWJhFnq10j3A6HkUS8odE3VwpAgVc3FVrA8aINCNr5Pm3xrc7bohzK/3V8pPFtFALmGKTJYEoiKhXlWECSyuH2MhTKogqux0EaTgU9FcJS/JO5zAGEGP7gxZmqYwPN+1cLIIMSSqOhGOOz+NM2xFZsJ7Sduf073P8rawvD3MmzVNlEk8l8W9CKkIsYhDcSIcdzpM8YGiD7iIBnZ68XgcpxYxqY74ze6UcyshRMxDPNV8JaJ85Kv8cX08FsJRMs4O7ObQExaDh7GtogqVjwoUcYsKDeAz8ZAit4ZmKbAUlwOy22f/LhSUT0Wjx/VZQqrTdadbRwupBhQJKcVZHggMQcyzcFXKj0MRjwpz+6wPDlLzM8V/5XHzjdFV8Xf8uD4rSJF6hwY5GJBYSuu4/404saDH9VlhIH2he+kvJaSzya36Iq4WWjMWy+7rnuucctFsNYiZTcfsclHJ7kApA/Q0BuuMSEriEKO2pMvL6QKlBqm1NmJaI/Cdp+4Q0rmsDb9htrlfuYwy9VS9QIobula7ZkZbklZg1/6WJvMSOeSESjFp5nQQC0cmVxlZn7xtjbn8JRYTHxyEeABvbowWd/VB4h1SbOr8eZk4ukgFN7tjG3yXyWkhJaNzHhJXPCnXnTJ5wx1WPfm0skIOpT8p1/wOO3tnIlt2m2k+LuMTKTRu+De/U6uLzh9jbjUHlEaCSatBbjq2uNXEy2uYO/MIKmKILZdcXMuKi7HTJWgOKHRqgHJFpA08Ne+xeYW3G78zvGjLWzjUYH8DZopsoE8X/VJvmPZ3+KzEo6a6WlpUGk2EEJ0QEPaWWYbp0uxNcchavsM+QSbHFmNfWSUTErobtA0K1jk52MrCES94OtdZh9ZE04+SFyrv5tkQVbHOMJvu9HW71OII5ufCSF+CFfh52vkwWTezZNRuD9vtJGuuJ4dTFl9b7KY/GPJJ0XrHSQQQ2WlS3QWerynCvVzBpg42UNwBqDd3G8jhB5ArBTJlZXs1UTk0cO0bcHTq7iYu77ndZhtEg/uIy6PdJ0tLVEK0JCpyaYuAkObPtOsIMqXbYoOjm/SjbZWE4dy2lFvAkfFXccCfHK1kxsrKKyRslvya9QcRJTNq4OcFcqdokvwGo65ENFovjB5N7guxzdKdWaM1Ihr357u8KFlyb47uT16qvHvvD3/p4sPRitv9wWTjUw7+x3b9OYr/5KREq5OmvV4v7fzJ6A+/Bf8DEQyrXrUAO28AAAAASUVORK5CYII= "
        },
        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png" 
        },
        {
          description: "XRP",
          acronym: "XRP",
          url_image: "https://icon-library.com/images/ripple-icon-png/ripple-icon-png-10.jpg"
        }
      ]
      coins.each do |coin|
        Coin.find_or_create_by!(coin);
      end
    end
  end

  desc "Cadastro dos tipso de mineração"
  task add_miningtypes: :environment do
    show_spinner("Adicionando miningtypes ...") do
      miningtypes = [
        {name: "Proof of Work", acronym: "PoW"},
        {name: "Proof of Stake", acronym: "PoS"},
        {name: "Proof of Capacity", acronym: "PoC"}
      ]
      miningtypes.each do |miningtype|
        Miningtype.find_or_create_by!(miningtype)
      end
    end
  end
  private

  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}") 
    spinner.auto_spin
    yield 
    spinner.success("(#{msg_end})");
  end
end
