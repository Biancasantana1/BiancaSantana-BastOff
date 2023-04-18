programa
{
	
	funcao inicio()
	{
		inteiro quant_num, contador
		inteiro anterior, atual, proximo

		anterior = 0
		atual = 1
		proximo = 1

		escreva("Digite a quantidade de numeros desejados\n")
		leia(quant_num)

		para(contador = 1; contador <= quant_num; contador++){
			escreva(proximo,"\n")
			proximo = atual + anterior
			anterior = atual
			atual = proximo
		
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 197; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */