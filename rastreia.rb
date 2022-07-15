# def procuraDiretorio(pasta,pastaRemovida)
#   if Dir.exist?("./#{pasta}/#{pastaRemovida}")
#     puts "O arquivo existe no diretório especificado";
#   else
#     puts "O arquivo não existe no diretório especificado";
#   end
# end

# if(ARGV.length > 0 and ARGV.length >= 2)
#   procuraDiretorio(ARGV[0].to_s,ARGV[1].to_s);
# end

def lista_path(str)
  Dir.chdir(Dir.pwd) do
    local = Dir.entries(Dir.pwd)
    local.each do |pasta|
      if(pasta == str)
        exit;
      end
    end
    Dir.glob("./**/#{str}");
  end
end

param = ARGV[0];
paths = "";

if(param)
  paths = lista_path(param)
else
  print "Informe o nome do diretório que você deseja excluir: ";
  param = gets.chomp;
end

paths = lista_path(param);

unless(paths.empty?)
  paths.each do |path|
    puts path
  end
else
  puts "#{param} Não encontrado!"
end
