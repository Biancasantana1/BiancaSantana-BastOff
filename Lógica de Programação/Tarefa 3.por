programa {
    inclua biblioteca Tipos --> tipo
    
    funcao inicio() {
        cadeia salario_pessoa
        cadeia valor_financiamento
        cadeia deseja_continuar

        limpa()
        escreva("***** Seja bem-vindo ao sistema de financiamento ***** \n")
	   
	   
        faca {
        	  escreva("  *** Digite valores apenas em decimais ***\n\n")
            escreva("Digite o valor do salário de uma pessoa: ")
            leia(salario_pessoa)
		  // Aceita apenas numeros real positivos
            enquanto(nao tipo.cadeia_e_real(salario_pessoa) ou tipo.cadeia_para_real(salario_pessoa) < 0 ) {
                escreva("Você digitou um valor não aceitável,  por favor, digite novamente: ")
                leia(salario_pessoa)
            }

            escreva("Digite o valor de um financiamento pretendido: ")
            leia(valor_financiamento)
		  // Aceita apenas numeros real positivos
            enquanto(nao tipo.cadeia_e_real(valor_financiamento) ou tipo.cadeia_para_real(valor_financiamento) < 0 ) {
                escreva("Você digitou um valor não aceitável, por favor, digite novamente: ")
                leia(valor_financiamento)
            }
            
		  se(tipo.cadeia_para_real(valor_financiamento) <= ( 5 * tipo.cadeia_para_real(salario_pessoa)) ){
		  	escreva("\nFinanciamento Concedido\n")
		  }senao {
		  	escreva("\nFinanciamento Negado\n")
		  }
		 
		  escreva("\nObrigado por nos consultar.\n")
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
 * @POSICAO-CURSOR = 318; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */