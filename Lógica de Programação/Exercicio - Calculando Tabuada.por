programa
{
	
	funcao inicio()
	{
		inteiro num,cont
		caracter continua = 's'
		enquanto(continua == 's'){
			escreva("Entre com o número para mostrar sua tabuada:")
			leia(num)
			para(cont = 1; cont <= 10; cont++){
				escreva("\n",cont,"x",num, " = ",cont*num)
			}
			escreva("\n Deseja continuar? Tecle 'S' para sim: ")
			leia(continua)
			limpa()
		}
		
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 328; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */