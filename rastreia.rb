def validaPermissao(str)
  if(str == "não" or str == "nao"  or str == "sim" )
    return true;
  else
    return false;
  end
end

def deleta_path(caminhos)
  
  caminhosFiltrados = caminhos.filter {|caminho| caminho != "./.git"}
  
  puts caminhosFiltrados
  
  print "Você deseja excluir os caminhos acima acima (sim ou não): "
  permissao = STDIN.gets.chomp.downcase;

  if(validaPermissao(permissao))
    caminhosFiltrados.each do | caminho|
      pastaDeletada = system("rm -rf #{caminho}");
      if(pastaDeletada)
        puts "O caminho #{caminho} foi deletado com sucesso"
      else
        puts "Erro ao tentar deletar o caminho #{caminho}: Caminho não encontrado"
      end
    end
  else
    puts "Escreva somente sim ou não para responder!"
  end

end

def lista_path(str)
  Dir.chdir(Dir.pwd) do
    return Dir.glob("./**/#{str}");
  end
end

param = ARGV[0];

if(!param)
  print "Informe o nome do diretório que você deseja excluir: ";
  param = gets.chomp;
end

paths = lista_path(param);

unless(paths.empty?)
  deleta_path(paths)
else
  puts "#{param} Não encontrado!"
end