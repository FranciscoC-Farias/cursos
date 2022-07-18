# Buscar o arquivo gitIgnore;

# Copiar o conteúdo de dentro do arquivo;

# Verificar se já existe um arquivo gitIgnore na pasta Raiz, se existir adicionar sem apagar o conteúdo já contido, as informações da pasta do projeto que o gitIgnore está dentro;



require_relative 'lista_path.rb'

caminhosEncontrados = lista_path('.gitignore');
caminhosFiltrados = caminhosEncontrados.filter { |caminho| caminho != "./../.gitignore"}
puts caminhosFiltrados
