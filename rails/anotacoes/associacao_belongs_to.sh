#Para criar a associação belongs_to, devemos especificar no model inserindo o comando: 
  belongs_to :mining_type # Que significa que está associado á ...

#Em seguida entrando no rails console;
#Adicionamos o rails o Coin.first a uma variável
  c = Coin.first

#Depois criamos uma referencia para a tabela MiningType.first
  m = MiningType.first

#Depois adicionamos o valor do Primeiro Valor da tabela MiningTyope na associação do coin
  c.mining_type = m