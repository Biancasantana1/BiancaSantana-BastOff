Classe ContaBanco
	// Atributos
	publico numConta: inteiro
	protegido tipo: caracter
	privado dono: caracter
	privado saldo: real
	privado status: logico

	// Métodos especiais
	publico metodo construtor()
		saldo = 0
		status = falso
	fimMetodo
	
	publico metodo setNumConta(n:inteiro)
		numConta = n
	fimMetodo
	
	publico metodo getNumConta()
		retorne numConta
	fimMetodo
	
	publico metodo setTipo(t:caracter)
		tipo = t
	fimMetodo
	
	publico metodo getTipo()
		retorne tipo
	fimMetodo

	publico metodo setDono(d:caracter)
		dono = d
	fimMetodo
	
	publico metodo getDono()
		retorne dono
	fimMetodo

	publico metodo setSaldo(s:real)
		saldo = s
	fimMetodo
	
	publico metodo getSaldo()
		retorne saldo
	fimMetodo

	publico metodo setStatus(s:logico)
		status = s
	fimMetodo
	
	publico metodo getStatus()
		retorne status
	fimMetodo
	
	// Métodos

	publico metodo abrirConta(t:caracter)
		setTipo(t)
		setStatus(verdadeiro)
		se(t ="CC") entao
			saldo = 50
		senao se(t = "CP") entao
			saldo = 150
		fimSe
	fimMetodo

	publico metodo fecharConta()
		se(saldo > 0 ) entao
			escreva("Conta com dinheiro")
		senao se (saldo < 0 ) entao
			escreva("Conta em débito")
		senao
			setStatus(falso)
		fimSe
	fimMetodo

	publico metodo depositar(v:real)
		se(status = verdadeiro) entao
			saldo = saldo + v
		senao
			escreva("Impossivel depositar")
		fimSe
	fimMetodo

	publico metodo sacar(v:real)
		se(status = verdadeiro) entao
			se(saldo > v) entao
				saldo = saldo - v
			senao
				escreva("Saldo insuficiente")
			fimSe
		senao 
			escreva("Impossivel sacar")
		fimSe
	fimMetodo

	publico metodo pagarMensal()
		var v:real
		se(tipo = "CC") entao
			v = 12
		senao se (tpo = "CP") entao
			v = 20
		fimSe
		se (status = verdadeiro) entao
			se(saldo > v) entao
				saldo = saldo - v
			senao 
				escreva("Saldo insuficiente")
			fimSe
		senao
			escreva("Impossivel pagar")
		fimSe
		
	fimMetodo

fimClasse
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1796; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */