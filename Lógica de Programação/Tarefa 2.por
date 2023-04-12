programa {
    inclua biblioteca Tipos --> tipo
    inclua biblioteca Matematica --> mat
    
    funcao inicio() {
        cadeia km_inicial
        cadeia km_final
        cadeia deseja_continuar
        cadeia quantidade_gasolina

        limpa()
        escreva("***** Seja bem-vindo ao sistema de KmMestre ***** \n")
	   
	   
        faca {
        	  escreva("  *** Digite valores apenas em decimais ***\n\n")
            escreva("Digite a km inicial: ")
            leia(km_inicial)
		  // Aceita apenas numeros real positivos
            enquanto(nao tipo.cadeia_e_real(km_inicial) ou tipo.cadeia_para_real(km_inicial) < 0 ) {
                escreva("Você digitou um valor não aceitável,  por favor, digite novamente: ")
                leia(km_inicial)
            }

            escreva("Digite a km final: ")
            leia(km_final)
		  // Aceita apenas numeros real positivos
            enquanto(nao tipo.cadeia_e_real(km_final) ou tipo.cadeia_para_real(km_final) < 0 ) {
                escreva("Você digitou um valor não aceitável, por favor, digite novamente: ")
                leia(km_final)
            }
		  // verifica se a quilometragem final é menor que a inicial
            enquanto(tipo.cadeia_para_real(km_final) < tipo.cadeia_para_real(km_inicial)) {
                escreva("Você digitou um valor não aceitável, por favor, digite novamente: ")
                leia(km_final)
            }

            escreva("Digite a quantidade de gasolina: ")
            leia(quantidade_gasolina)
            // Aceita apenas numeros real positivos
            enquanto(nao tipo.cadeia_e_real(quantidade_gasolina) ou tipo.cadeia_para_real(quantidade_gasolina) < 0) {
                escreva("Você digitou um valor não aceitável, por favor, digite novamente: ")
                leia(quantidade_gasolina)
            }
		  // faz a soma do gasto do km por litro
            real gasto_total = ( tipo.cadeia_para_real(km_final) - tipo.cadeia_para_real(km_inicial)) / tipo.cadeia_para_real(quantidade_gasolina)
            
            escreva("O carro fez ", mat.arredondar(gasto_total, 2), " km por litro. \n\n")

            escreva("Deseja monitorar outra quilometragem? (s/n): ")
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
 * @POSICAO-CURSOR = 1947; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */