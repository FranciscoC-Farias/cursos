## Scaffold: Usado para criar tabelas no banco de dados
# OBS: A tabela é sempre escrita com a primeira letra maiúscula e no singular.
  #EX: 
  rails generate scaffold <Tabela> <campo:tipo> <campo:tipo>

# Sempre que criamos uma tabela, precisamos rodar o comando o migrate, para migrar as informações para o banco:
  rails db:migrate 

# Para acessar o banco de dados como(conectar e executar comandos para inspecioná-lo):
  rails db:create  # Deve ser rodado após o migrate
  rails db  #Da acesso ao que pode ser usado com o comando rails db

# Cria um novo controller ##
# OBS: Ao criarmos o novo controller ele automaticamente cria uma pasta com o nome do control;
	rails g controller <nomeControlador> <nome-do-Método-que-chamara-o-controlador> # > cria controller
  rails d controller nomeControlador4  # > Destroi o controller:


# ERB : Sistema de tamplate para o ruby > https://pt.wikipedia.org/wiki/ERuby
#Veja essa documentação: http://ruby-doc.org/stdlib-2.4.0/libdoc/erb/rdoc/ERB.html


#Helpers: São métodos prontos que podem ser usados nas views. E por já estarem prontos facilita a vida do programador, por não precisar escrever tanto código;
#documentação: https://api.rubyonrails.org/classes/ActionController/Helpers.html   -v 7.0.3 
#OBS: Devemos usar o mínimo possível de código HTMl, sempre que pudermos, devemos usar códigos ruby:
#Por exemplo para informarmos que utilizaremos links, ao invés de usarmos a tag "a" podemos usar o método 'link_to "Descrição", <rota_path ou url>' 
<%= link_to "Cadastrar moedas" , coins_path %>
<%= image_tag coin.url_image, size: 25x25 %>
#documentação: https:://api.rubyonrails.org/classes/ActiveonView/Helpers/AssetTagHelper.html#method-i-image_tag









# tasks de banco de dados que mais são usadas: ####
# Para verificar todas as task's disponíveis: 
  * rails -T *
# Para filtrar o:
 * rails -T <filtro> * 
#task's mais utilizadas: 
  * rails db:create *    # > cria o banco de dados;
  * rails db:drop *     # > apaga o db
  * rails db:rollback * # > desfaz a ultima migration








#### Para levantar a aplicação em ambiente diferente, de produção ####
  RAILS_ENV=production rails s 
  *rails s -e production*
OBS: NÃO FUNCIONARAM!