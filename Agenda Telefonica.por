programa
{	
	/// <<< Projeto Agenda Telefônica 1.0 >>> ||| <<< By NewJr7 xD >>> ///
	
	inclua biblioteca Texto --> txt
	inclua biblioteca Tipos --> tps
	inclua biblioteca Arquivos --> arq
	
	cadeia contatos[100][2], g_opc, g_contato, nomeArq
	inteiro g_cont = 0, g_cont2 = 0
	inteiro arq, retorno = 0
	
	funcao inicio()
	{				
		se(g_cont2 == 0)
		{
			escreva("============================================\n")
			escreva("=== ALUNO: NEWTON BASTOS DA SILVA JUNIOR ===\n")
			escreva("=== RA: 1680482222021                    ===\n")
			escreva("============================================\n\n")
			pausar()
			g_cont2++
		}
		
		menu()
	}

	//Função menu:
	//Menu principal do programa.
	funcao menu()
	{	
		inteiro opcao
		
		faca
		{
			escreva("==================================================")
			escreva("\n=================   M  E  N  U   =================")
			escreva("\n==================================================")
			escreva("\n=== (1) - Listar Contatos..................... ===")
			escreva("\n=== (2) - Pesquisar Contatos.................. ===")
			escreva("\n=== (3) - Apagar Contatos..................... ===")
			escreva("\n=== (4) - Alterar Contatos.................... ===")
			escreva("\n=== (5) - Cadastrar Contatos.................. ===")
			escreva("\n=== (6) - Carregar/Gravar Arquivo............. ===")
			escreva("\n=== (0) - Sair................................ ===")
			escreva("\n==================================================\n")
			escreva("==================================================\n")
			escreva("==================================================\n")
			escreva("\nEscolha uma opção: ")
			leia(opcao)
			limpa()

			escolha(opcao)
			{
				caso 0:
					
					faca
					{
						escreva("=================  M E N U  =================\n\n")
						escreva("Deseja realmente sair?\n")
						escreva("(S) ou (N): ")
						leia(g_opc)
						g_opc = txt.caixa_alta(g_opc)
						limpa()

						se(g_opc != "S" e g_opc != "N")
						{	
							escreva("=================  M E N U  =================\n\n")
							escreva("Opção inválida!\n")
							pausar()
						} 
					
					}enquanto(g_opc != "S" e g_opc != "N")
					
					se(g_opc == "S")
					{					
						escreva("Até mais... xD\n")	
					}
					
					senao
					{
						opcao = 1
					}
					
					pare
				
				caso 1:
					
					listar_contatos()
					
					pare

				caso 2:
					
					pesquisar_contatos()
					
					pare

				caso 3:
					
					apagar_contatos()
					
					pare

				caso 4:
					
					alterar_contatos()
					
					pare

				caso 5:
					
					cadastrar_contatos()
					
					pare

				caso 6:

					ler_gravar_arquivo()
					
					pare
					
				caso contrario:

					escreva("=================  M E N U  =================\n\n")
					escreva("Opção inválida!\n\n")
					pausar()
					
					pare
				}			
		
		}enquanto(opcao != 0)		
		
		retorne
	}

	//Função para listar contatos (Menu - 1):
	//Lista todos os contatos conforme cadastrados, em ordem alfabética;
	//Ou pela letra inicial informada exibindo até 20 contatos por tela.
 	funcao listar_contatos()
 	{
 		cadeia aux[100][2], aux1, aux2
 		cadeia letra1, letra2
 		inteiro opcao, cont, cont2, qtd = 0

		faca
		{
			escreva("===============  L I S T A R  ===============\n\n")
			escreva("(1) - Todos os contatos......................\n")
			escreva("(2) - Todos os contatos em ordem alfabética..\n")
			escreva("(3) - Somente com a letra inicial informada..\n")
			escreva("\nEscolha uma opção: ")
			leia(opcao)
			limpa()
			escreva("===============  L I S T A R  ===============\n\n")
 		
			escolha(opcao)
			{
				caso 1:

 					para(cont = 0; cont < 100; cont++)
 					{	
						se(contatos[cont][0] != "" e contatos[cont][1] != "")
						{
							se(cont % 20 == 0 e cont != 0)
 							{ 			
 								pausar()	
 								escreva("===============  L I S T A R  ===============\n\n")
 							}
			
							escreva("----------------------------------------\n")
							escreva("Nome: ", contatos[cont][0], 
 							"\nTelefone: ", contatos[cont][1], "\n")	
 							escreva("----------------------------------------\n\n")	
 							qtd++
						}
 					}				

					se(qtd == 0)
					{
 						limpa()
 						escreva("===============  L I S T A R  ===============\n\n")
 						escreva("Nenhum cadastro foi encontrado.\n\n")
						pausar()
					}

					senao
					{
						pausar()
					}
					
 					pare

 				caso 2:

					para(cont = 0; cont < 100; cont++)
					{
						aux[cont][0] = contatos[cont][0]
						aux[cont][1] = contatos[cont][1]	
					}
				
					para(cont = 99; cont >= 0; cont--)
					{
						para(cont2 = 99; cont2 >= 0; cont2--)
						{
							se(aux[cont][0] != "" e aux[cont2][0] != "")
							{
								compara_texto(aux[cont][0], aux[cont2][0])
								
								se(retorno == 1 ou retorno == 0)
								{
									aux1 = aux[cont][0]
									aux2 = aux[cont][1]
									aux[cont][0] = aux[cont2][0]
									aux[cont][1] = aux[cont2][1]
									aux[cont2][0] = aux1
									aux[cont2][1] = aux2
								}
							}						
						}
					}
				
					para(cont = 0; cont < 100; cont++)
 					{		
 						se(aux[cont][0] != "" e aux[cont][1] != "")
 						{
 							se(cont % 20 == 0 e cont != 0)
 							{ 			
 								pausar()
 								escreva("===============  L I S T A R  ===============\n\n")
 							}
 						
 							escreva("----------------------------------------\n")
							escreva("Nome: ", aux[cont][0], 
 							"\nTelefone: ", aux[cont][1], "\n")	
 							escreva("----------------------------------------\n\n")
 							qtd++
 						}
 					}

					se(qtd == 0)
					{
 						limpa()
 						escreva("===============  L I S T A R  ===============\n\n")
 						escreva("Nenhum cadastro foi encontrado.\n\n")
						pausar()
					}

					senao
					{
						pausar()
					}
					
 					pare

				caso 3:

					escreva("Digite a letra inicial do nome: ")
					leia(letra1)
					letra1 = txt.caixa_alta(letra1)
					limpa()
					escreva("===============  L I S T A R  ===============\n\n")
			
					para(cont = 0; cont < 100; cont++)
					{				
						se(contatos[cont][0] != "" e contatos[cont][1] != "")
						{
							letra2 = tps.caracter_para_cadeia(txt.obter_caracter(contatos[cont][0], 0))					
							
							se(letra1 == letra2)
							{
								se(cont % 20 == 0 e cont != 0)
 								{ 			
 									pausar()
 									escreva("===============  L I S T A R  ===============\n\n")
 								}
									
								escreva("----------------------------------------\n")
								escreva("Nome: ", contatos[cont][0], 
 								"\nTelefone: ", contatos[cont][1], "\n")	
 								escreva("----------------------------------------\n\n")
 								qtd++
							}
						}
					}

					se(qtd == 0)
					{
 						limpa()
 						escreva("===============  L I S T A R  ===============\n\n")
 						escreva("Nenhum cadastro foi encontrado.\n\n")
						pausar()
					}

					senao
					{
						pausar()
					}
				
 					pare
 					
 				caso contrario:

					escreva("Opção inválida!\n")
					pausar()
								
 					pare	
				}

			escreva("===============  L I S T A R  ===============\n\n")
			voltar_menu(g_opc)
			qtd = 0
			
		}enquanto(g_opc != "S")
		
 		retorne
 	}

	//Função para pesquisar contatos (Menu - 2):
	//Pesquisa o contato pelo nome / telefone ou pelo primeiro nome.
 	funcao pesquisar_contatos()
 	{
 		cadeia nome
 		inteiro opcao, qtd = 0, cont, espaco

		faca
		{
			escreva("============  P E S Q U I S A R  ============\n\n")
			escreva("(1) - Pelo nome ou telefone..................\n")
			escreva("(2) - Pelo primeiro nome.....................\n")
			escreva("\nEscolha uma opção: ")
			leia(opcao)
			limpa()
			escreva("============  P E S Q U I S A R  ============\n\n")
	
			escolha(opcao)
			{
				caso 1:
				
					faca
					{	
						escreva("Digite o nome ou o telefone do contato: ")
 						leia(g_contato)
 						g_contato = txt.caixa_alta(g_contato)
 						limpa()
						escreva("============  P E S Q U I S A R  ============\n\n")
 	
 						faca
 						{
 							pesquisa(g_cont) 
 				
 				 			se(g_cont >= 0 e g_cont < 100)
 							{		
								escreva("----------------------------------------\n")
								escreva("Nome: ", contatos[g_cont][0], 
 								"\nTelefone: ", contatos[g_cont][1], "\n")	
 								escreva("----------------------------------------\n\n")
 								g_cont++
 								qtd++
 							}
 										
 						}enquanto(g_cont > -1)
 		
						se(qtd > 0)
 						{
 							pausar()
 							g_cont = -1
 						}	

 						senao
 						{
 							escreva("Nenhum cadastro foi encontrado.\n\n")
 							pausar()
 							g_cont = -1
 						}
 					
					}enquanto(g_cont > -1)
				
					pare
				
				caso 2:
				
					faca
					{	
						escreva("Digite o primeiro nome do contato: ")
 						leia(g_contato)
 						g_contato = txt.caixa_alta(g_contato)
 						limpa()
 						escreva("============  P E S Q U I S A R  ============\n\n")
 						
 						para(cont = 0; cont < 100; cont++)
 						{	
							se(contatos[cont][0] != "" e contatos[cont][1] != "")
							{
								espaco = txt.posicao_texto(" ", contatos[cont][0], 0)
								nome = txt.extrair_subtexto(contatos[cont][0], 0, espaco)
							
								se(g_contato == nome ou g_contato == contatos[cont][0])
								{
									escreva("----------------------------------------\n")
									escreva("Nome: ", contatos[cont][0], 
 									"\nTelefone: ", contatos[cont][1], "\n")	
 									escreva("----------------------------------------\n\n")
 									qtd++
								}
							}
 						}
 						
						se(qtd == 0)
 						{
 							escreva("Nenhum cadastro foi encontrado.\n\n")
 							pausar()
 							g_cont = -1
 						}	

 						senao
 						{					
 							pausar()
 							g_cont = -1
 						}
 					
					}enquanto(g_cont > -1)
				
					pare

 				caso contrario:
				
					escreva("Opção inválida!\n\n")
					pausar()
				
 					pare
			}	

			escreva("============  P E S Q U I S A R  ============\n\n")
			voltar_menu(g_opc)
			g_cont = 0
			qtd = 0
			
		}enquanto(g_opc != "S")
		
		retorne
 	}

	//Função para apagar contatos (Menu - 3):
	//Valida se existir mais de um contato com o mesmo nome ou telefone;
	//Reposiciona os contatos deixando os espaços vazios no final.
 	funcao apagar_contatos()
 	{	
 		cadeia opc
 		inteiro cont, qtd = 0

		faca
		{
 			escreva("===============  A P A G A R  ===============\n\n")
 			escreva("Digite o nome ou o telefone do contato: ")
 			leia(g_contato)
 			g_contato = txt.caixa_alta(g_contato)
 			limpa()	
 			pesquisa(g_cont)

			faca
			{		
				se(g_cont >= 0 e g_cont < 100)
				{
					faca
					{	
						escreva("===============  A P A G A R  ===============\n\n")	
						escreva("----------------------------------------\n")
 						escreva("Nome: ", contatos[g_cont][0], 
 						"\nTelefone: ", contatos[g_cont][1], "\n")	
 						escreva("----------------------------------------\n\n")
						escreva("Apagar contato?\n")
						escreva("(S) ou (N): ")
						leia(opc)
						opc = txt.caixa_alta(opc)
						limpa()
				
						se(opc != "S" e opc != "N")
						{	
							escreva("===============  A P A G A R  ===============\n\n")
							escreva("Opção inválida!\n\n")
							pausar()
						}
						
					}enquanto(opc != "S" e opc != "N")

 					se(opc == "S")
 					{
 						contatos[g_cont][0] = ""
 						contatos[g_cont][1] = ""
 					
 						para(cont = 0; cont < 99; cont++)
						{
							se(contatos[cont][0] == "" e contatos[cont+1][0] != "")
							{
								contatos[cont][0] = contatos[cont+1][0]
								contatos[cont+1][0] = ""
								contatos[cont][1] = contatos[cont+1][1]
								contatos[cont+1][1] = ""
							}
						}	
						
						escreva("===============  A P A G A R  ===============\n\n")	
						escreva("Cadastro apagado com sucesso.\n\n")
						pausar()
 						g_cont = -1
 					}
 					
 					senao
 					{
 						g_cont++
 						pesquisa(g_cont)				
 					}
 					
 					qtd++
				}
				
				senao
				{
					se(qtd == 0)
					{	
						escreva("===============  A P A G A R  ===============\n\n")	
						escreva("Nenhum cadastro foi encontrado.\n\n")
						pausar()
						g_cont = -1
					}
				}
			
			}enquanto(g_cont > -1)

			escreva("===============  A P A G A R  ===============\n\n")
			voltar_menu(g_opc)
			g_cont = 0
 			qtd = 0
			
 		}enquanto(g_opc != "S")

 		retorne
 	}

	//Função para alterar contatos (Menu - 4):
	//Valida para não aceitar um contato já existente;
	//Ou um telefone inválido (diferente do padrão do programa).
 	funcao alterar_contatos()
 	{	
		cadeia opc, nome, telefone
		inteiro cont, qtd

		faca
		{
			escreva("==============  A L T E R A R  ==============\n\n")
			escreva("Digite o nome ou o telefone do contato: ")
 			leia(g_contato)
 			g_contato = txt.caixa_alta(g_contato)
 			limpa()
 			pesquisa(g_cont)
			
			faca
			{
 				se(g_cont >= 0 e g_cont < 100)
 				{
 					faca
					{	
						escreva("==============  A L T E R A R  ==============\n\n")
						escreva("----------------------------------------\n")
 						escreva("Nome: ", contatos[g_cont][0], 
 						"\nTelefone: ", contatos[g_cont][1], "\n")	
 						escreva("----------------------------------------\n\n")
						escreva("Alterar contato?\n")
						escreva("(S) ou (N): ")
						leia(opc)
						opc = txt.caixa_alta(opc)
						limpa()

						se(opc != "S" e opc != "N")
						{
							escreva("==============  A L T E R A R  ==============\n\n")
							escreva("Opção inválida!\n\n")
							pausar()
						}
								
					}enquanto(opc != "S" e opc != "N")
 			
 					se(opc == "S")
 					{
 						faca
 						{
 							faca
 							{
 								escreva("==============  A L T E R A R  ==============\n\n")
 								escreva("Digite o nome do contato: ")
 								leia(nome)
 								nome = txt.caixa_alta(nome)
 								escreva("Digite o telefone do contato: ")
 								leia(telefone)
 								qtd = txt.numero_caracteres(telefone)
 								limpa()

 								se(nome == "")
								{
									escreva("==============  A L T E R A R  ==============\n\n")
									escreva("Nome inválido!\n\n")
									pausar()
								}
 				
 								se(telefone == "" ou qtd < 10 ou qtd > 11)
								{
									escreva("==============  A L T E R A R  ==============\n\n")
									escreva("Telefone inválido!\n")
									escreva("Digite apenas números (DDD + número do telefone)\n\n")
									pausar()
								}

								se(nome == telefone)
								{
									escreva("==============  A L T E R A R  ==============\n\n")
									escreva("Não é possível informar nome e telefone iguais!\n\n")
									pausar()
									nome = ""				
								}
								
 							}enquanto(nome == "" ou telefone == "" ou qtd < 10 ou qtd > 11)

 							qtd = 0
 							
 							para(cont = 0; cont < 100; cont++)
							{
 								se(nome == contatos[cont][0] e telefone == contatos[cont][1])
 								{
 									escreva("==============  A L T E R A R  ==============\n\n")
 									escreva("Cadastro já existente!\n\n")
 									pausar()
 									g_cont = -1
 									qtd++
 								}	
							}
							
							se(qtd == 0)
							{
								escreva("==============  A L T E R A R  ==============\n\n")
								contatos[g_cont][0] = nome
								contatos[g_cont][1] = telefone
								escreva("Cadastro alterado com sucesso.\n\n")
								pausar()
								g_cont = -1
							}	
													
 						}enquanto(g_cont > -1)
 					}			

 					senao
 					{
 						g_cont++
 						pesquisa(g_cont)
 					}
 				}
 				
				senao
				{
					escreva("==============  A L T E R A R  ==============\n\n")
					escreva("Nenhum cadastro foi encontrado.\n\n")
					pausar()
					g_cont = -1
				}
				
 			}enquanto(g_cont > -1)

			escreva("==============  A L T E R A R  ==============\n\n")
			voltar_menu(g_opc)
			g_cont = 0
			qtd = 0
			
		}enquanto(g_opc != "S")

		retorne
 	}

	//Função para cadastrar novos contatos (Menu - 5):
	//Valida para não aceitar um contato já existente;
	//Ou um telefone inválido (diferente do padrão do programa).
 	funcao cadastrar_contatos()
 	{
		cadeia nome, telefone
		inteiro cont, qtd
		
		faca
		{		
			faca
			{
				escreva("============  C A D A S T R A R  ============\n\n")
				escreva("Digite o nome do contato: ")
 				leia(nome)
 				nome = txt.caixa_alta(nome)
 				escreva("Digite o telefone do contato: ")
 				leia(telefone)
 				qtd = txt.numero_caracteres(telefone)
 				limpa()

				se(nome == "")
				{
					escreva("============  C A D A S T R A R  ============\n\n")
					escreva("Nome inválido!\n\n")
					pausar()
				}
 				
 				se(telefone == "" ou qtd < 10 ou qtd > 11)
				{
					escreva("============  C A D A S T R A R  ============\n\n")
					escreva("Telefone inválido!\n")
					escreva("Digite apenas números (DDD + número do telefone).\n\n")
					pausar()
				}	

				se(nome == telefone)
				{
					escreva("============  C A D A S T R A R  ============\n\n")
					escreva("Não é possível informar nome e telefone iguais!\n\n")
					pausar()
					nome = ""				
				}
								
 			}enquanto(nome == "" ou telefone == "" ou qtd < 10 ou qtd > 11)
 		
 			para(cont = 0; cont < 100; cont++)
			{
						
 				se(nome == contatos[cont][0] e telefone == contatos[cont][1])
 				{
 					escreva("============  C A D A S T R A R  ============\n\n")
 					escreva("Cadastro já existente!\n\n")
 					pausar()
 					cont = 100 					
 				}

 				senao
 				{
 					se(contatos[cont][0] == "" e contatos[cont][1] == "")
 					{	
 						contatos[cont][0] = nome
 						contatos[cont][1] = telefone
 						limpa()
 						escreva("============  C A D A S T R A R  ============\n\n")
 						escreva("Cadastro realizado com sucesso.\n\n")
						pausar()
						cont = 100				
 					}

 					se(contatos[99][0] != "" e contatos[99][1] != "")
 					{
 						escreva("============  C A D A S T R A R  ============\n\n")
 						escreva("Agenda cheia!\n\n")
 						pausar()
 						cont = 100	
 					}
 				}			
			}

			escreva("============  C A D A S T R A R  ============\n\n")
			voltar_menu(g_opc)
			
		}enquanto(g_opc != "S")	

		retorne
 	}

	//Função para ler ou gravar arquivos (Menu - 6):
	//Pergunta qual o nome do arquivo que deseja ler ou gravar;
	//Valida para saber se o nome de arquivo digitado existe.
	funcao ler_gravar_arquivo()
	{
		cadeia separador, nome, telefone
		inteiro opcao, cont
		
		faca
		{	
			escreva("======  C A R R E G A R / G R A V A R  ======\n\n")
			escreva("(1) - Carregar arquivo.......................\n")
			escreva("(2) - Gravar arquivo.........................\n")
			escreva("\nEscolha uma opção: ")
			leia(opcao)
			limpa()	
		
			escolha(opcao)
			{	
				caso 1:
					
					escreva("======  C A R R E G A R / G R A V A R  ======\n\n")
					escreva("Digite o nome do arquivo: ")
					leia(nomeArq)
					limpa()

					se(arq.arquivo_existe(nomeArq) == falso)
					{
						escreva("======  C A R R E G A R / G R A V A R  ======\n\n")
						escreva("Arquivo inexistente!\n\n")
						pausar()
					}

					senao
					{
						arq = arq.abrir_arquivo(nomeArq, arq.MODO_LEITURA)
						
						para(cont = 0; cont < 100; cont++)
						{
							nome = txt.caixa_alta(arq.ler_linha(arq))
							telefone = txt.caixa_alta(arq.ler_linha(arq))
							separador = arq.ler_linha(arq)
							
							se(nome != "" e nome != separador)
							{
								contatos[cont][0] = nome
							}
	
							se(telefone != "" e telefone != separador)
							{
								contatos[cont][1] = telefone
							}
						}
					
						arq.fechar_arquivo(arq)	
						escreva("======  C A R R E G A R / G R A V A R  ======\n\n")
						escreva("Arquivo carregado com sucesso.\n\n")
						pausar()
					}
					
					pare

				caso 2:
					
					escreva("======  C A R R E G A R / G R A V A R  ======\n\n")
					escreva("Digite o nome do arquivo: ")
					leia(nomeArq)
					limpa()
					arq = arq.abrir_arquivo(nomeArq, arq.MODO_ESCRITA)		
					
					para(cont = 0; cont < 100; cont++)
					{				
						se(contatos[cont][0] != "" e contatos[cont][1] != "")
						{
							arq.escrever_linha(contatos[cont][0], arq)
							arq.escrever_linha(contatos[cont][1], arq)
							arq.escrever_linha("#", arq)		
						}
					}
					
					arq.fechar_arquivo(arq)
					escreva("======  C A R R E G A R / G R A V A R  ======\n\n")
					escreva("Arquivo gravado com sucesso.\n\n")
					pausar()				
					
					pare
		
				caso contrario:
					
					escreva("======  C A R R E G A R / G R A V A R  ======\n\n")
					escreva("Opção inválida!\n\n")
					pausar()
					
					pare
			}

			escreva("======  C A R R E G A R / G R A V A R  ======\n\n")
			voltar_menu(g_opc)
		
		}enquanto(g_opc != "S")
		
		retorne
	}
	
	//Função para pausar o programa:
	//Pausa o programa quando necessário.
 	funcao pausar()
 	{	
		cadeia paginas
 		
 		escreva("\n\nTecle algo para continuar...")
 		leia(paginas)
 		limpa()

 		retorne
 	}

	//Função para pesquisar o índice do contato na matriz:
	//Pesquisa por nome ou telefone;
	//Retorna o índice do contato ou -1 se não existir.
 	funcao inteiro pesquisa (inteiro indice)
 	{	 		
 		enquanto(g_cont >= 0 e g_cont < 100 )
 		{
 			se(g_contato == contatos[g_cont][0] ou g_contato == contatos[g_cont][1])
 			{
 				retorne g_cont
 			}
 			
 			se(g_contato == contatos[g_cont][0] e g_contato == contatos[g_cont][1])
 			{
 				g_cont = -1
 				retorne g_cont
 			}
 			
			g_cont++
  		}
  		
  		g_cont = -1
  		
 		retorne g_cont
 	}

	//Função para perguntar se deseja retornar ao menu principal:
	//Pergunta se deseja retornar ao menu principal;
	//Ou continuar no submenu escolhido.
	funcao cadeia voltar_menu (cadeia validar)
	{		
		faca
			{	
				escreva("Voltar ao menu principal?\n")
				escreva("(S) ou (N): ")
				leia(g_opc)
				g_opc = txt.caixa_alta(g_opc)
				limpa()	
				
				se(g_opc != "S" e g_opc != "N")
				{	
					escreva("Opção inválida!\n")
					pausar()
				} 
				
			}enquanto(g_opc != "S" e g_opc != "N")

			retorne g_opc
			
	}

	//Função para comparar cadeias passada em aula.
	funcao inteiro compara_texto(cadeia texto1, cadeia texto2)
	{
		caracter t1, t2 
		inteiro tamanhoT1, tamanhoT2

		tamanhoT1 = txt.numero_caracteres(texto1)
		tamanhoT2 = txt.numero_caracteres(texto2)
		
		para(inteiro pos=0; pos < txt.numero_caracteres(texto1); pos++)
		{
			se(pos >= tamanhoT2)
				pare 
			
			senao
			{
				t1 = txt.obter_caracter(texto1, pos)				
				t2 = txt.obter_caracter(texto2, pos)				

				se(t1 > t2) 
				{
					retorno = 1
					pare
				}
		
				senao se (t1 < t2)
				{
					retorno = -1
					pare
				}
			}
		}

		se(retorno == 0 e tamanhoT2 > tamanhoT1)
			retorno = -1

		se(retorno == 0 e tamanhoT2 < tamanhoT1)
			retorno = 1
			
		retorne retorno			
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 593; 
 * @DOBRAMENTO-CODIGO = [29, 139, 320, 446, 543, 680, 768, 871, 885, 911, 934];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */