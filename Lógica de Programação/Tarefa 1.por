programa {
    inclua biblioteca Tipos --> tipo

    funcao inicio() {
        cadeia nome_funcionario
        cadeia quantidade_software
        cadeia deseja_continuar
        inteiro salario = 500

        limpa()
        escreva("***** Seja bem-vindo ao sistema *****\n\n")

        faca {
        	  escreva("*** Digite apenas letras *** \n")
            escreva("Digite o nome do funcionário: ")
            leia(nome_funcionario)
            // verifica se o nome é uma cadeia de caracter
            enquanto(tipo.cadeia_e_inteiro(nome_funcionario,10) ou tipo.cadeia_e_caracter(nome_funcionario) ou 
            tipo.cadeia_e_real(nome_funcionario)) {
                escreva("Você digitou um nome não aceitável, por favor, digite novamente: ")
                leia(nome_funcionario)
            }
		  escreva("\n*** Digite apenas numeros inteiros positivos *** \n")
            escreva("Digite a quantidade de software que foi vendido pelo funcionário: ")
            leia(quantidade_software)
		  // verifica se é um numero inteiro e positivo
            enquanto(nao tipo.cadeia_e_inteiro(quantidade_software, 10) ou tipo.cadeia_para_inteiro(quantidade_software, 10) < 0) {
                escreva("Você digitou um valor não aceitável, por favor, digite novamente: ")
                leia(quantidade_software)
            }
		  // faz a soma do salario total
            real salario_total = salario + 50.00 * tipo.cadeia_para_inteiro(quantidade_software, 10)
            escreva("\nO salário final do vendedor ", nome_funcionario, " é de R$ ", salario_total, "\n\n")

            escreva("Deseja monitorar outro funcionário? (s/n): ")
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
 * @POSICAO-CURSOR = 1494; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */