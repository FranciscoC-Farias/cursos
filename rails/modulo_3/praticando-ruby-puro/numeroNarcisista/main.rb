=begin
Um número narcisista é um número positivo que é a soma de seus próprios dígitos, cada um elevado à potência do número de dígitos em uma determinada base. Neste Kata, vamos nos restringir ao decimal (base 10).

Por exemplo, tome 153 (3 dígitos), que é narcisista:
1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153

e 1652 (4 dígitos), que não é:
    1^4 + 6^4 + 5^4 + 2^4 = 1 + 1296 + 625 + 16 = 1938

A verificação de erros para strings de texto ou outras entradas inválidas não é necessária, apenas inteiros positivos diferentes de zero válidos serão passados ​​para a função.

=end

def narcissistic(value)

  arrValue = value.to_s.split("");
  arrLeng = arrValue.length;
  
  arrSumNumber = Array.new;
  totalSum = 0;

  arrValue.each do |num|
    num = num.to_i
    if(num != 0)
      arrSumNumber.push(num**arrLeng);
    end
  end 

  arrSumNumber.each do |result|
    totalSum = totalSum + result;
  end
  if totalSum == value
    return true;
  else 
    return false;
  end

end

puts narcissistic(222);