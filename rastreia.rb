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

param  = ARGV[0];


def lista_path(str)
  Dir.chdir(Dir.pwd) do
    Dir.glob("./**/#{str}");
  end
end

paths = lista_path(param)

unless(paths.empty?)

  paths.each do |path|
    puts path
  end

else
  puts "#{param} Não encontrado!"
end

