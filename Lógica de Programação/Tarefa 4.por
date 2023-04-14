programa {
    inclua biblioteca Tipos --> tipo
    inclua biblioteca Matematica --> mat
    
    funcao inicio() {
        cadeia saldo_inicial
        cadeia valor_cheque
        cadeia deseja_continuar
        

        limpa()
        escreva("***** Seja bem-vindo ao sistema de desconto de cheques ***** \n")
	   
	   
        faca {
        	  escreva("  *** Digite valores apenas em decimais ***\n\n")
            escreva("Digite o saldo inicial do cliente no banco: ")
            leia(saldo_inicial)
		  // Aceita apenas numeros real positivos
            enquanto(nao tipo.cadeia_e_real(saldo_inicial) ou tipo.cadeia_para_real(saldo_inicial) < 0 ) {
                escreva("Você digitou um valor não aceitável,  por favor, digite novamente: ")
                leia(saldo_inicial)
            }

            escreva("Digite o valor do cheque que entrou: ")
            leia(valor_cheque)
		  // Aceita apenas numeros real positivos
            enquanto(nao tipo.cadeia_e_real(valor_cheque) ou tipo.cadeia_para_real(valor_cheque) < 0 ) {
                escreva("Você digitou um valor não aceitável, por favor, digite novamente: ")
                leia(valor_cheque)
            }
            
		  se(tipo.cadeia_para_real(valor_cheque) <= tipo.cadeia_para_real(saldo_inicial) ){
		  	escreva("\nO cheque foi descontado.\n")
		  	real saldo_atual = tipo.cadeia_para_real(saldo_inicial) - tipo.cadeia_para_real(valor_cheque)
		  	escreva("O saldo atual é de R$ ", mat.arredondar(saldo_atual, 2),"\n\n")
		  }senao {
		  	escreva("\n O cheque pode não ser descontado.\n")
		  }
		 
            escreva("Deseja fazer uma nova consulta? (s/n): ")
            leia(deseja_continuar)

            enquanto(deseja_continuar != "s" e deseja_continuar != "n") {
                escreva("Digite novamente apenas s (continuar) ou n (sair) : ")
                leia(deseja_continuar)
            }

            limpa()
        } enquanto(deseja_continuar == "s")

    }

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1348; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */