algoritmo "Holandês Voador - BN v3"

// Disciplina     : [Lógica de Programação e Algoritmos]
// Professor      : Edson Pedro Ferlin
// Função         : Simula um jogo de Batalha Naval (Refatorado v3)
// Autor          : Renan Rocha
// Data           : 05/07/2026

//------------------------------------------------------------------
//                         VARIÁVEIS
//------------------------------------------------------------------

var
   // Matrizes
   cord_p1, cord_p2, tiro_p1, tiro_p2: vetor [1..10,1..10] de caractere
   ship_grid_p1, ship_grid_p2: vetor [1..10,1..10] de inteiro
   ship_hits_p1, ship_hits_p2: vetor [1..5] de inteiro

   // Inteiros
   linha, coluna, tiro_linha, tiro_coluna, afundou_p1, afundou_p2, tentativas_p1, tentativas_p2, dir: inteiro
   temErro, posicaoBarco, opcao_posicionamento: inteiro
   pontos_p1, pontos_p2, primeiro_jogador: inteiro
   
   // Loop variables (using separate ones to avoid collision)
   idx_rodada, idx_tiro, idx_navio: inteiro
   l_idx, c_idx: inteiro

   // Caracteres
   barcos_ref, resp, enter, line_none, line_full, topo, player1, player2, novamente, auto, sair, input_str: caractere
   player_atual: caractere
   msg_erro: caractere

   // Lógicos
   barcos_definidos, sair_global: logico

   // Mensagens com repetição
   line: vetor [0..20] de caractere

//------------------------------------------------------------------
//                       PROCEDIMENTOS E FUNÇÕES
//------------------------------------------------------------------

PROCEDIMENTO topo_campos()
VAR
   cont_i: inteiro
   rest_p1, dest_p1: inteiro
   rest_p2, dest_p2: inteiro
   p1_score, p2_score: caractere
INICIO
   ESCREVAL
   ESCREVAL(topo)
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL ("       Campo: ",player1,"                                                                                                       Campo: ",player2)
   SE barcos_definidos ENTAO
      rest_p1 <- 0
      dest_p1 <- 0
      rest_p2 <- 0
      dest_p2 <- 0
      
      PARA cont_i DE 1 ATE 5 FACA
         SE ship_hits_p1[cont_i] > 0 ENTAO
            rest_p1 <- rest_p1 + 1
         SENAO
            dest_p1 <- dest_p1 + 1
         FIMSE
         
         SE ship_hits_p2[cont_i] > 0 ENTAO
            rest_p2 <- rest_p2 + 1
         SENAO
            dest_p2 <- dest_p2 + 1
         FIMSE
      FIMPARA
      
      p1_score <- "       Pontos: " + numpcarac(afundou_p1) + " | Tiros: " + numpcarac(tentativas_p1) + " | Barcos: " + numpcarac(rest_p1) + " Rest / " + numpcarac(dest_p1) + " Dest"
      p2_score <- "Pontos: " + numpcarac(afundou_p2) + " | Tiros: " + numpcarac(tentativas_p2) + " | Barcos: " + numpcarac(rest_p2) + " Rest / " + numpcarac(dest_p2) + " Dest"
      
      p1_score <- pad_str(p1_score, 111)
      ESCREVAL (p1_score, p2_score)
   FIMSE
   ESCREVAL
   ESCREVAL ("                                      COLUNA                                                                                          COLUNA")
   ESCREVAL ("                                    (vertical)                                                                                      (vertical)")
   ESCREVAL
// /**
FIMPROCEDIMENTO
//  * Recupera o valor contido em uma dada coordenada no tabuleiro de
//  * posicionamento (barcos) ou no tabuleiro de tiros de um jogador.
//  *
//  * @param layout O tipo de tela/tabuleiro a ser consultado.
//  * @param lado O lado da tela consultado (1 para esquerda, 2 para direita).
//  * @param l A linha da coordenada (1 a 10).
//  * @param c A coluna da coordenada (1 a 10).
//  * @return O caractere contido naquela coordenada (ex: "~", "#", "O", "X").
//  */
FUNCAO obter_val(layout: inteiro; lado: inteiro; l, c: inteiro): caractere
INICIO
   SE layout = 1 ENTAO
      SE lado = 1 ENTAO
         RETORNE cord_p1[l, c]
      SENAO
         RETORNE cord_p2[l, c]
      FIMSE
   FIMSE
   SE layout = 2 ENTAO
      SE lado = 1 ENTAO
         RETORNE tiro_p1[l, c]
      SENAO
         RETORNE cord_p2[l, c]
      FIMSE
   FIMSE
   SE (layout = 3) OU (layout = 4) ENTAO
      SE lado = 1 ENTAO
         RETORNE tiro_p1[l, c]
      SENAO
         RETORNE tiro_p2[l, c]
      FIMSE
   FIMSE
// /**
FIMFUNCAO
//  * Preenche uma string à direita com espaços até atingir o
//  * comprimento total desejado. Útil para alinhamento de colunas.
//  *
//  * @param s A string original a ser preenchida.
//  * @param total_len O comprimento final desejado.
//  * @return A string preenchida com espaços adicionais na direita.
//  */
FUNCAO pad_str(s: caractere; total_len: inteiro): caractere
VAR
   s_res: caractere
   i_pad: inteiro
   diff: inteiro
INICIO
   s_res <- s
   diff <- total_len - compr(s)
   SE diff > 0 ENTAO
      PARA i_pad DE 1 ATE diff FACA
         s_res <- s_res + " "
      FIMPARA
   FIMSE
   RETORNE s_res
// /**
FIMFUNCAO
//  * Retorna o divisor central (espaçamento e artes ASCII dos navios)
//  * para uma dada linha durante a renderização paralela dos tabuleiros.
//  *
//  * @param layout O layout atual sendo exibido (ataque, posicionamento, etc).
//  * @param l A linha atual que está sendo renderizada (1 a 10).
//  * @return A string do divisor central correspondente.
//  */
FUNCAO obter_meio(layout: inteiro; l: inteiro): caractere
INICIO
   SE (layout = 1) OU (layout = 3) ENTAO
      ESCOLHA l
         CASO 1
            RETORNE "                                                                "
         CASO 2
            RETORNE "                       587                                      "
         CASO 3
            RETORNE "                     9888                                       "
         CASO 4
            RETORNE "                  7888888277777777777                           "
         CASO 5
            RETORNE "                0888888888888888888887               LINHA      "
         CASO 6
            RETORNE "                9888888888888888888887            (horizontal)  "
         CASO 7
            RETORNE "                  7888888277777777777                           "
         CASO 8
            RETORNE "                     08887                                      "
         CASO 9
            RETORNE "                       287                                      "
         CASO 10
            RETORNE "                                                                "
      FIMESCOLHA
   SENAO
      ESCOLHA l
         CASO 1
            RETORNE "                                                                "
         CASO 2
            RETORNE "                             785                                "
         CASO 3
            RETORNE "                             78889                              "
         CASO 4
            RETORNE "                  7777777777728888887                           "
         CASO 5
            RETORNE "                7888888888888888888880               LINHA      "
         CASO 6
            RETORNE "                7888888888888888888884            (horizontal)  "
         CASO 7
            RETORNE "                  7777777777728888887                           "
         CASO 8
            RETORNE "                             78884                              "
         CASO 9
            RETORNE "                             782                                "
         CASO 10
            RETORNE "                                                                "
      FIMESCOLHA
   FIMSE
// /**
FIMFUNCAO
//  * Retorna a representação visual (incluindo marcadores de cor se necessário)
//  * de uma casa com base no seu caractere e no contexto do tabuleiro.
//  *
//  * @param val O caractere bruto contido na casa (ex: "~", "#").
//  * @param layout O layout atual sendo renderizado.
//  * @param lado O jogador correspondente (1 ou 2).
//  * @return O caractere formatado visualmente para exibição no console.
//  */
FUNCAO colorir_casa(val: caractere; layout: inteiro; lado: inteiro): caractere
INICIO
   SE val = "~" ENTAO
      RETORNE "[94m~[0m"
   FIMSE
   SE (val = "O") OU (val = "X") ENTAO
      RETORNE "[93m" + val + "[0m"
   FIMSE
   SE val = "#" ENTAO
      // Hit on shot boards
      SE (layout = 3) OU (layout = 4) ENTAO
         RETORNE "[91m#[0m"
      // Placing player's ship
      FIMSE
      SE layout = 1 ENTAO
         SE lado = 1 ENTAO
            RETORNE "[92m#[0m"
         SENAO
            RETORNE "[94m~[0m"
         FIMSE
      FIMSE
      SE layout = 2 ENTAO
         SE lado = 2 ENTAO
            RETORNE "[92m#[0m"
         SENAO
            RETORNE "[94m~[0m"
         FIMSE
      FIMSE
   FIMSE
   RETORNE val
// /**
FIMFUNCAO
//  * Renderiza graficamente a tela do jogo contendo os dois tabuleiros
//  * (jogador à esquerda e defensor à direita), o divisor de águas central
//  * e os rótulos de coordenadas (linhas e colunas).
//  *
//  * @param layout O layout a ser exibido (1=P1 barcos, 2=P2 barcos, 3=P1 tiro, 4=P2 tiro).
//  */
PROCEDIMENTO desenhar_tela(layout: inteiro)
VAR
   l, c: inteiro
   val_esq, val_dir: caractere
INICIO
   topo_campos()
   ESCREVAL ("                            1  2  3  4  5  6  7  8  9  10                                                                    1  2  3  4  5  6  7  8  9  10")
   
   PARA l DE 1 ATE 10 FACA
      // Left margin labels for rows 5 and 6
      SE l = 5 ENTAO
         ESCREVA ("              LINHA      ")
      SENAO
         SE l = 6 ENTAO
            ESCREVA ("           (horizontal)  ")
         SENAO
            ESCREVA ("                         ")
         FIMSE
      // Row number
      FIMSE
      SE l = 10 ENTAO
         ESCREVA ("10 ")
      SENAO
         ESCREVA (l, "  ")
      // Left board values
      FIMSE
      PARA c DE 1 ATE 10 FACA
         val_esq <- obter_val(layout, 1, l, c)
         val_esq <- colorir_casa(val_esq, layout, 1)
         ESCREVA (val_esq, "  ")
      // Middle spacing and ASCII art/label
      FIMPARA
      ESCREVA (obter_meio(layout, l))

      // Right board row number
      SE l = 10 ENTAO
         ESCREVA ("10 ")
      SENAO
         ESCREVA (l, "  ")
      // Right board values
      FIMSE
      PARA c DE 1 ATE 10 FACA
         val_dir <- obter_val(layout, 2, l, c)
         val_dir <- colorir_casa(val_dir, layout, 2)
         ESCREVA (val_dir, "  ")
      FIMPARA
      ESCREVAL
   FIMPARA
// /**
FIMPROCEDIMENTO
//  * Insere um determinado valor em uma coordenada específica de um
//  * dos tabuleiros do jogo.
//  *
//  * @param p O número do jogador (1 ou 2).
//  * @param l A linha da coordenada.
//  * @param c A coluna da coordenada.
//  * @param tiro Define se a alteração se aplica à matriz de tiros (verdadeiro) ou de barcos (falso).
//  * @param val O caractere a ser gravado.
//  */
PROCEDIMENTO definir_posicao(p: inteiro; l, c: inteiro; tiro: logico; val: caractere)
INICIO
   SE p = 1 ENTAO
      SE tiro ENTAO
         tiro_p1[l, c] <- val
      SENAO
         cord_p1[l, c] <- val
      FIMSE
   SENAO
      SE tiro ENTAO
         tiro_p2[l, c] <- val
      SENAO
         cord_p2[l, c] <- val
      FIMSE
   FIMSE
// /**
FIMPROCEDIMENTO
//  * Aloca os blocos correspondentes a uma embarcação na matriz de barcos do jogador,
//  * gravando o caractere de representação e salvando o ID de controle da embarcação.
//  *
//  * @param p O número do jogador (1 ou 2).
//  * @param l A linha inicial da alocação.
//  * @param c A coluna inicial da alocação.
//  * @param d A direção da alocação (1 para horizontal, outro valor para vertical).
//  * @param tam O tamanho do barco (número de posições).
//  * @param id O ID identificador do barco (1 a 5).
//  */
PROCEDIMENTO alocar_barco(p: inteiro; l, c, d, tam: inteiro; id: inteiro)
VAR
   i_aloc: inteiro
INICIO
   SE tam = 1 ENTAO
      definir_posicao(p, l, c, falso, "#")
      SE p = 1 ENTAO
         ship_grid_p1[l, c] <- id
      SENAO
         ship_grid_p2[l, c] <- id
      FIMSE
   SENAO
      SE d = 1 ENTAO
         PARA i_aloc DE 0 ATE (tam - 1) FACA
            definir_posicao(p, l, c + i_aloc, falso, "#")
            SE p = 1 ENTAO
               ship_grid_p1[l, c + i_aloc] <- id
            SENAO
               ship_grid_p2[l, c + i_aloc] <- id
            FIMSE
         FIMPARA
      SENAO
         PARA i_aloc DE 0 ATE (tam - 1) FACA
            definir_posicao(p, l + i_aloc, c, falso, "#")
            SE p = 1 ENTAO
               ship_grid_p1[l + i_aloc, c] <- id
            SENAO
               ship_grid_p2[l + i_aloc, c] <- id
            FIMSE
         FIMPARA
      FIMSE
   FIMSE
// /**
FIMPROCEDIMENTO
//  * Reseta as matrizes de controle de identificação de barcos para zero
//  * e redefine a saúde máxima de cada embarcação para ambos os jogadores.
//  */
PROCEDIMENTO inicializar_barcos()
VAR
   i_init, j_init: inteiro
INICIO
   PARA i_init DE 1 ATE 10 FACA
      PARA j_init DE 1 ATE 10 FACA
         ship_grid_p1[i_init, j_init] <- 0
         ship_grid_p2[i_init, j_init] <- 0
      FIMPARA
   FIMPARA

   ship_hits_p1[1] <- 6
   ship_hits_p1[2] <- 5
   ship_hits_p1[3] <- 3
   ship_hits_p1[4] <- 1
   ship_hits_p1[5] <- 1

   ship_hits_p2[1] <- 6
   ship_hits_p2[2] <- 5
   ship_hits_p2[3] <- 3
   ship_hits_p2[4] <- 1
   ship_hits_p2[5] <- 1
// /**
FIMPROCEDIMENTO
//  * Solicita ao usuário e valida interativamente a entrada de coordenadas
//  * (linha, coluna e direção) para a inserção de um barco no tabuleiro.
//  * Trata sobreposição, limites e suporte a atalhos como a tecla ESC.
//  *
//  * @param layout O layout gráfico de exibição do tabuleiro.
//  * @param precisa_dir Define se é necessário solicitar a direção do barco.
//  * @param tamanho O tamanho da embarcação em validação.
//  */
PROCEDIMENTO obter_jogada(layout: inteiro; precisa_dir: logico; tamanho: inteiro)
VAR
   ok: logico
   l_loop, c_loop: inteiro
   tem_sobreposicao: logico
   p_defensor: inteiro
   lado_p: inteiro
INICIO
   ok <- falso
   ENQUANTO (NAO ok) E (NAO sair_global) FACA
      // Draw screen
      desenhar_tela(layout)
      ESCREVAL
      ESCREVAL
      ESCREVAL ("      ", player_atual, barcos_ref)
      ESCREVAL
      ESCREVAL
      ESCREVAL (line_full)
      ESCREVAL
      
      SE msg_erro <> "" ENTAO
         ESCREVAL (msg_erro)
         ESCREVAL
         msg_erro <- ""
      FIMSE

      ok <- verdadeiro

      // 1. Read direction if needed
      SE ok ENTAO
         SE precisa_dir ENTAO
            ESCREVA (line[0])
            leia_entrada(input_str)
            SE input_str = "esc" ENTAO
               msg_erro <- ""
               LIMPATELA
               ok <- falso
            SENAO
               dir <- caracpnum(input_str)
               SE (dir <> 1) E (dir <> 2) ENTAO
                  msg_erro <- line[3]
                  LIMPATELA
                  ok <- falso
               FIMSE
            FIMSE
         FIMSE
      // 2. Read Linha
      FIMSE
      SE ok ENTAO
         ESCREVA (line[1])
         leia_entrada(input_str)
         SE input_str = "esc" ENTAO
            msg_erro <- ""
            LIMPATELA
            ok <- falso
         SENAO
            linha <- caracpnum(input_str)
            SE (layout = 3) OU (layout = 4) ENTAO
               tiro_linha <- linha
            FIMSE
            SE (linha < 1) OU (linha > 10) ENTAO
               SE (layout = 3) OU (layout = 4) ENTAO
                  msg_erro <- line[16]
               SENAO
                  msg_erro <- line[4]
               FIMSE
               LIMPATELA
               ok <- falso
            FIMSE
         FIMSE
      // 3. Read Coluna
      FIMSE
      SE ok ENTAO
         ESCREVA (line[2])
         leia_entrada(input_str)
         SE input_str = "esc" ENTAO
            msg_erro <- ""
            LIMPATELA
            ok <- falso
         SENAO
            coluna <- caracpnum(input_str)
            SE (layout = 3) OU (layout = 4) ENTAO
               tiro_coluna <- coluna
            FIMSE
            SE (coluna < 1) OU (coluna > 10) ENTAO
               SE (layout = 3) OU (layout = 4) ENTAO
                  msg_erro <- line[16]
               SENAO
                  msg_erro <- line[5]
               FIMSE
               LIMPATELA
               ok <- falso
            FIMSE
         FIMSE
      // 4. Validate boundaries with size
      FIMSE
      SE ok ENTAO
         SE precisa_dir ENTAO
            SE ((dir = 1) E (coluna + tamanho - 1 > 10)) OU ((dir = 2) E (linha + tamanho - 1 > 10)) ENTAO
               msg_erro <- line[13] // Fora da arena
               LIMPATELA
               ok <- falso
            FIMSE
         FIMSE
      // 5. Validate overlap / repeat-shots
      FIMSE
      SE ok ENTAO
         SE (layout = 1) OU (layout = 2) ENTAO
            // Check overlap
            tem_sobreposicao <- falso
            SE layout = 1 ENTAO
               lado_p <- 1
            SENAO
               lado_p <- 2
            FIMSE
            SE precisa_dir ENTAO
               SE dir = 1 ENTAO
                  PARA c_loop DE coluna ATE (coluna + tamanho - 1) FACA
                     SE obter_val(layout, lado_p, linha, c_loop) = "#" ENTAO
                        tem_sobreposicao <- verdadeiro
                     FIMSE
                  FIMPARA
               SENAO
                  PARA l_loop DE linha ATE (linha + tamanho - 1) FACA
                     SE obter_val(layout, lado_p, l_loop, coluna) = "#" ENTAO
                        tem_sobreposicao <- verdadeiro
                     FIMSE
                  FIMPARA
               FIMSE
            SENAO
               // Size is 1 (Dimitrius)
               SE obter_val(layout, lado_p, linha, coluna) = "#" ENTAO
                  tem_sobreposicao <- verdadeiro
               FIMSE
            FIMSE

            SE tem_sobreposicao ENTAO
               SE tamanho = 1 ENTAO
                  msg_erro <- line[14] // já posicionou nessa posição
               SENAO
                  msg_erro <- line[15] // já posicionou em algumas das posições
               FIMSE
               LIMPATELA
               ok <- falso
            FIMSE
         SENAO
            // Layout 3 or 4: Shooting
            SE layout = 3 ENTAO
               p_defensor <- 2
            SENAO
               p_defensor <- 1
            FIMSE

            SE p_defensor = 2 ENTAO
               SE (tiro_p2[linha, coluna] = "#") OU (tiro_p2[linha, coluna] = "O") ENTAO
                  msg_erro <- line[17] // já atirou nessa posição
                  LIMPATELA
                  ok <- falso
               FIMSE
            SENAO
               SE (tiro_p1[linha, coluna] = "#") OU (tiro_p1[linha, coluna] = "X") OU (tiro_p1[linha, coluna] = "O") ENTAO
                  msg_erro <- line[17]
                  LIMPATELA
                  ok <- falso
               FIMSE
            FIMSE
         FIMSE
      FIMSE
   FIMENQUANTO
// /**
FIMPROCEDIMENTO
//  * Gerencia o processo manual sequencial de posicionamento dos 5 barcos
//  * de um determinado jogador, atualizando o console a cada inserção válida.
//  *
//  * @param p O número do jogador (1 ou 2).
//  */
PROCEDIMENTO posicionar_barcos(p: inteiro)
INICIO
   SE p = 1 ENTAO
      player_atual <- player1
   SENAO
      player_atual <- player2
   // 1. Barco Octavius (tamanho 6, qtd 1)
   FIMSE
   barcos_ref <- ", dê as coordenadas das posições do barco Octavius (Com 6 posições)..."
   obter_jogada(p, verdadeiro, 6)
   SE NAO sair_global ENTAO
      alocar_barco(p, linha, coluna, dir, 6, 1)
      LIMPATELA
      desenhar_tela(p)
      ESCREVAL
      ESCREVAL
      ESCREVAL ("      ",player_atual,", barco Octavius posicionado!")
      ESCREVAL
      ESCREVAL
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL (line[10])
      leia_entrada(enter)
      LIMPATELA
   // 2. Barco World Discoverer (tamanho 5, qtd 1)
   FIMSE
   SE NAO sair_global ENTAO
      barcos_ref <- ", dê as coordenadas das posições do barco World Discoverer (Com 5 posições)..."
      obter_jogada(p, verdadeiro, 5)
      SE NAO sair_global ENTAO
         alocar_barco(p, linha, coluna, dir, 5, 2)
         LIMPATELA
         desenhar_tela(p)
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player_atual,", barco Discoverer posicionado!")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL (line[10])
         leia_entrada(enter)
         LIMPATELA
      FIMSE
   // 3. Barco SS America (tamanho 3, qtd 1)
   FIMSE
   SE NAO sair_global ENTAO
      barcos_ref <- ", dê as coordenadas das posições do barco SS America (Com 3 posições)..."
      obter_jogada(p, verdadeiro, 3)
      SE NAO sair_global ENTAO
         alocar_barco(p, linha, coluna, dir, 3, 3)
         LIMPATELA
         desenhar_tela(p)
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player_atual,", barco SS America posicionado!")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL (line[10])
         leia_entrada(enter)
         LIMPATELA
      FIMSE
   // 4. Barcos Dimitrius (tamanho 1, qtd 2)
   FIMSE
   SE NAO sair_global ENTAO
      PARA idx_navio DE 1 ATE 2 FACA
         SE NAO sair_global ENTAO
            barcos_ref <- ", dê as coordenadas das posições dos barcos Dimitrius (x2) (Com 1 posição)..."
            obter_jogada(p, falso, 1)
            SE NAO sair_global ENTAO
               alocar_barco(p, linha, coluna, 0, 1, 3 + idx_navio)
               LIMPATELA
               desenhar_tela(p)
               ESCREVAL
               ESCREVAL
               ESCREVAL ("      ",player_atual,", barco Dimitrius posicionado!")
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[10])
               leia_entrada(enter)
               LIMPATELA
            FIMSE
         FIMSE
      FIMPARA
   FIMSE
// /**
FIMPROCEDIMENTO
//  * Gera de forma pseudo-aleatória coordenadas e direção válidas para o posicionamento
//  * de um navio no tabuleiro, garantindo que não ultrapasse limites e não se sobreponha.
//  *
//  * @param layout O layout gráfico de exibição do tabuleiro.
//  * @param precisa_dir Define se é necessário gerar direção (horizontal/vertical).
//  * @param tamanho O tamanho da embarcação a ser validada.
//  */
PROCEDIMENTO obter_jogada_aleatoria(layout: inteiro; precisa_dir: logico; tamanho: inteiro)
VAR
   ok: logico
   l_loop, c_loop: inteiro
   tem_sobreposicao: logico
   lado_p: inteiro
INICIO
   ok <- falso
   ENQUANTO NAO ok FACA
      ok <- verdadeiro

      // 1. Generate direction if needed
      SE precisa_dir ENTAO
         dir <- randi(2) + 1
      SENAO
         dir <- 0
      // 2. Generate Linha and Coluna (1 to 10)
      FIMSE
      linha <- randi(10) + 1
      coluna <- randi(10) + 1

      // 3. Validate boundaries with size
      SE ok ENTAO
         SE precisa_dir ENTAO
            SE ((dir = 1) E (coluna + tamanho - 1 > 10)) OU ((dir = 2) E (linha + tamanho - 1 > 10)) ENTAO
               ok <- falso
            FIMSE
         FIMSE
      // 4. Validate overlap
      FIMSE
      SE ok ENTAO
         tem_sobreposicao <- falso
         SE layout = 1 ENTAO
            lado_p <- 1
         SENAO
            lado_p <- 2
         FIMSE

         SE precisa_dir ENTAO
            SE dir = 1 ENTAO
               PARA c_loop DE coluna ATE (coluna + tamanho - 1) FACA
                  SE obter_val(layout, lado_p, linha, c_loop) = "#" ENTAO
                     tem_sobreposicao <- verdadeiro
                  FIMSE
               FIMPARA
            SENAO
               PARA l_loop DE linha ATE (linha + tamanho - 1) FACA
                  SE obter_val(layout, lado_p, l_loop, coluna) = "#" ENTAO
                     tem_sobreposicao <- verdadeiro
                  FIMSE
               FIMPARA
            FIMSE
         SENAO
            // Size is 1 (Dimitrius)
            SE obter_val(layout, lado_p, linha, coluna) = "#" ENTAO
               tem_sobreposicao <- verdadeiro
            FIMSE
         FIMSE

         SE tem_sobreposicao ENTAO
            ok <- falso
         FIMSE
      FIMSE
   FIMENQUANTO
// /**
FIMPROCEDIMENTO
//  * Realiza o posicionamento pseudo-aleatório automático de todos os 5 navios
//  * para um jogador, exibindo o resultado final consolidado.
//  *
//  * @param p O número do jogador (1 ou 2).
//  */
PROCEDIMENTO posicionar_barcos_aleatorio(p: inteiro)
INICIO
   SE p = 1 ENTAO
      player_atual <- player1
   SENAO
      player_atual <- player2
   // 1. Barco Octavius (tamanho 6, qtd 1)
   FIMSE
   obter_jogada_aleatoria(p, verdadeiro, 6)
   alocar_barco(p, linha, coluna, dir, 6, 1)

   // 2. Barco World Discoverer (tamanho 5, qtd 1)
   obter_jogada_aleatoria(p, verdadeiro, 5)
   alocar_barco(p, linha, coluna, dir, 5, 2)

   // 3. Barco SS America (tamanho 3, qtd 1)
   obter_jogada_aleatoria(p, verdadeiro, 3)
   alocar_barco(p, linha, coluna, dir, 3, 3)

   // 4. Barcos Dimitrius (tamanho 1, qtd 2)
   PARA idx_navio DE 1 ATE 2 FACA
      obter_jogada_aleatoria(p, falso, 1)
      alocar_barco(p, linha, coluna, 0, 1, 3 + idx_navio)
   // Show the finalized board
   FIMPARA
   LIMPATELA
   desenhar_tela(p)
   ESCREVAL
   ESCREVAL
   ESCREVAL ("      ", player_atual, ", barcos posicionados de forma aleatória!")
   ESCREVAL
   ESCREVAL
   ESCREVAL (line_full)
   ESCREVAL
   ESCREVAL (line[10])
   leia_entrada(enter)
   LIMPATELA
// /**
FIMPROCEDIMENTO
//  * Realiza um sorteio de "Cara ou Coroa" para decidir qual jogador
//  * iniciará a rodada de ataques da partida.
//  */
PROCEDIMENTO decidir_inicio()
VAR
   escolha_lado: inteiro
   sorteio: inteiro
   input_opcao: caractere
   opcao_valida: logico
INICIO
   opcao_valida <- falso
   ENQUANTO (NAO opcao_valida) E (NAO sair_global) FACA
      LIMPATELA
      ESCREVAL (line_full)
      ESCREVAL (line_none)
      ESCREVAL ("                                                               CARA OU COROA")
      ESCREVAL (line_none)
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL ("      ", player1, ", escolha o lado da moeda para decidir quem começa:")
      ESCREVAL ("      [92m1[0m - Cara")
      ESCREVAL ("      [91m2[0m - Coroa")
      ESCREVAL
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL ("      > ")
      leia_entrada(input_opcao)
      
      SE input_opcao = "esc" ENTAO
         sair_global <- verdadeiro
      SENAO
         escolha_lado <- caracpnum(input_opcao)
         SE (escolha_lado = 1) OU (escolha_lado = 2) ENTAO
            opcao_valida <- verdadeiro
         FIMSE
      FIMSE
   FIMENQUANTO

   SE NAO sair_global ENTAO
      sorteio <- randi(2) + 1
      
      LIMPATELA
      ESCREVAL (line_full)
      ESCREVAL (line_none)
      ESCREVAL ("                                                               CARA OU COROA")
      ESCREVAL (line_none)
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL ("                                                    A moeda girou no ar e caiu...")
      ESCREVAL
      SE sorteio = 1 ENTAO
         ESCREVAL ("                                                        [93m    .-----.    [0m")
         ESCREVAL ("                                                        [93m   /       \   [0m")
         ESCREVAL ("                                                        [93m  |  [92mCARA[93m   |  [0m")
         ESCREVAL ("                                                        [93m  |   [92m(C)[93m   |  [0m")
         ESCREVAL ("                                                        [93m   \       /   [0m")
         ESCREVAL ("                                                        [93m    '-----'    [0m")
         ESCREVAL
         ESCREVAL ("                                                             Resultado: [92mCARA![0m")
      SENAO
         ESCREVAL ("                                                        [93m    .-----.    [0m")
         ESCREVAL ("                                                        [93m   /       \   [0m")
         ESCREVAL ("                                                        [93m  |  [91mCOROA[93m  |  [0m")
         ESCREVAL ("                                                        [93m  |   [91m(K)[93m   |  [0m")
         ESCREVAL ("                                                        [93m   \       /   [0m")
         ESCREVAL ("                                                        [93m    '-----'    [0m")
         ESCREVAL
         ESCREVAL ("                                                            Resultado: [91mCOROA![0m")
      FIMSE
      ESCREVAL
      
      SE escolha_lado = sorteio ENTAO
         primeiro_jogador <- 1
         ESCREVAL ("                                              ", player1, " venceu o sorteio e começa atacando!")
      SENAO
         primeiro_jogador <- 2
         ESCREVAL ("                                              ", player2, " venceu o sorteio e começa atacando!")
      FIMSE
      ESCREVAL
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL (line[10]) // "      Pressione Enter!"
      leia_entrada(enter)
      LIMPATELA
   FIMSE
// /**
FIMPROCEDIMENTO
//  * Executa a rodada de ataques de um jogador sobre o tabuleiro adversário.
//  * Lê a coordenada de ataque, valida acerto/erro, gerencia pontos/tiros e
//  * exibe mensagens de acerto, erro e acerto crítico (afundado).
//  *
//  * @param player_atacante O número do jogador que está atacando (1 ou 2).
//  */
PROCEDIMENTO executar_ataques(player_atacante: inteiro)
VAR
   layout: inteiro
   p_defensor: inteiro
   continua_turno: logico
   ship_id: inteiro
   tam_barco: inteiro
   afundou_navio: logico
INICIO
   SE player_atacante = 1 ENTAO
      player_atual <- player1
      layout <- 3
      p_defensor <- 2
   SENAO
      player_atual <- player2
      layout <- 4
      p_defensor <- 1
   FIMSE

   LIMPATELA
   ESCREVAL (line_full)
   SE player_atacante = 1 ENTAO
      campo_tiro_p1()
   SENAO
      campo_tiro_p2()
   FIMSE
   ESCREVAL
   ESCREVAL
   ESCREVAL ("      ",player_atual,". é a hora de atacar!")
   ESCREVAL
   ESCREVAL
   ESCREVAL (line_full)
   ESCREVAL
   ESCREVAL(line[10])
   leia_entrada(enter)
   LIMPATELA

   continua_turno <- verdadeiro
   ENQUANTO continua_turno E (NAO sair_global) FACA
      afundou_navio <- falso
      barcos_ref <- ", informe a coordenada em que vai atirar..."
      obter_jogada(layout, falso, 1)
      LIMPATELA

      SE NAO sair_global ENTAO
         // Eval shot
         SE player_atacante = 1 ENTAO
            SE cord_p2[linha, coluna] = "#" ENTAO
               tiro_p2[linha, coluna] <- "#"
               afundou_p1 <- afundou_p1 + 1
               ship_id <- ship_grid_p2[linha, coluna]
               ship_hits_p2[ship_id] <- ship_hits_p2[ship_id] - 1
               SE ship_hits_p2[ship_id] = 0 ENTAO
                  afundou_navio <- verdadeiro
                  ESCOLHA ship_id
                     CASO 1
                        tam_barco <- 6
                     CASO 2
                        tam_barco <- 5
                     CASO 3
                        tam_barco <- 3
                     CASO 4
                        tam_barco <- 1
                     CASO 5
                        tam_barco <- 1
                  FIMESCOLHA
               FIMSE
            SENAO
               tiro_p2[linha, coluna] <- "O"
               continua_turno <- falso
            FIMSE
            tentativas_p1 <- tentativas_p1 + 1
            
            SE afundou_p1 = 16 ENTAO
               continua_turno <- falso
            FIMSE
         SENAO
            SE cord_p1[linha, coluna] = "#" ENTAO
               tiro_p1[linha, coluna] <- "#"
               afundou_p2 <- afundou_p2 + 1
               ship_id <- ship_grid_p1[linha, coluna]
               ship_hits_p1[ship_id] <- ship_hits_p1[ship_id] - 1
               SE ship_hits_p1[ship_id] = 0 ENTAO
                  afundou_navio <- verdadeiro
                  ESCOLHA ship_id
                     CASO 1
                        tam_barco <- 6
                     CASO 2
                        tam_barco <- 5
                     CASO 3
                        tam_barco <- 3
                     CASO 4
                        tam_barco <- 1
                     CASO 5
                        tam_barco <- 1
                  FIMESCOLHA
               FIMSE
            SENAO
               tiro_p1[linha, coluna] <- "X"
               continua_turno <- falso
            FIMSE
            tentativas_p2 <- tentativas_p2 + 1
            
            SE afundou_p2 = 16 ENTAO
               continua_turno <- falso
            FIMSE
         // Show success screen and allow playing again if turn continues
         FIMSE
         SE continua_turno ENTAO
            LIMPATELA
            desenhar_tela(layout)
            ESCREVAL
            ESCREVAL
            ESCREVAL ("      ", player_atual, ", você acertou um barco! Jogue novamente!")
            SE afundou_navio ENTAO
               ESCREVAL ("      Você afundou um barco de ", tam_barco, ", boa jogada marinheiro!")
            FIMSE
            ESCREVAL
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL (line[10])
            leia_entrada(enter)
            LIMPATELA
            SE sair_global ENTAO
               continua_turno <- falso
            FIMSE
         FIMSE
      FIMSE
   FIMENQUANTO

   SE NAO sair_global ENTAO
      LIMPATELA
      ESCREVAL (line_full)
      desenhar_tela(layout)
      ESCREVAL
      ESCREVAL
      ESCREVAL ("      ",player_atual,", fim dos ataques!")
      ESCREVAL
      ESCREVAL
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL(line[10])
      leia_entrada(enter)
      LIMPATELA
   FIMSE
// /**
FIMPROCEDIMENTO
//  * Exibe na tela o manual de instruções com as regras básicas, tamanhos e quantidades
//  * de embarcações que compõem a frota.
//  */
PROCEDIMENTO tutorial()
INICIO
   ESCREVAL
   ESCREVAL(topo)
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL("                                                                                                 _  _                        <|")
   ESCREVAL("                                          TUTORIAL                                                \/              __'__     __'__      __'__        _  _")
   ESCREVAL("                                                                                                                 /    /    /    /     /    /       ' \/ '")
   ESCREVAL("                                                                                                                /\____\    \____\     \____\")
   ESCREVAL("          Holandês Voador é um jogo DE Batalha Naval e lhe colocará em uma guerra em                           / ___!___   ___!___    ___!___")
   ESCREVAL("          que cada jogador terá seus barcos pirata. O objetivo é destruir os piratas                          / (      (  (      (   (      (")
   ESCREVAL("          inimigos e garantir seu tesouro! But antes disso, é preciso encontrá-los.                        / /   \______\  \______\   \______\")
   ESCREVAL("          Ganhará quem destruir todos os barcos piratas inimigos primeiro. No início                     /  /   ____!_____ ___!______ ____!_____        _  _")
   ESCREVAL("          do jogo é necessário alocar os 10 barcos, com diferentes tamanhos e bolar                    /   /   /          /          /         /         \/")
   ESCREVAL("          uma estratégia, lembre-se bem das posições pois após você terminar, será a                 /    /    |         ||         ||         |")
   ESCREVAL("          vez de seu adversário. Após os barcos alocados, será a hora da batalha, ca-              /_____/     \         \\         \\         \")
   ESCREVAL("          da um terá uma chance, se acertar pode continuar, se errar é a vez do ad-                      \      \_________\\_________\\_________\")
   ESCREVAL("          versário. Os barcos são representados com #, ao acertá-lo, o mesmo ficará                       \         |          |         |")
   ESCREVAL("          com um 'X' no local DE acerto. Crie sua estratégia e parta para a batalha!                       \________!__________!_________!_________/")
   ESCREVAL("                                                                                                            \|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|/ ")
   ESCREVAL("                                                                                                             \        o       o        o         /  ")
   ESCREVAL("                                    Divirta-se e bom jogo!                                      ~~~~~~~~~~~~~~\_________________________________/~~~~~~~~~~~~~")
   ESCREVAL("                                                                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
   ESCREVAL
   ESCREVAL
   ESCREVAL
// /**
FIMPROCEDIMENTO
//  * Renderiza o menu de pausa (ESC) contendo as opções de retomar o jogo,
//  * ler instruções completas, visualizar navios ocultos ou desistir/sair.
//  */
PROCEDIMENTO exibir_menu()
VAR
   opcao_menu: caractere
   no_menu: logico
INICIO
   no_menu <- verdadeiro
   ENQUANTO no_menu FACA
      LIMPATELA
      ESCREVAL ("=======================================================")
      ESCREVAL ("                         MENU                          ")
      ESCREVAL ("=======================================================")
      ESCREVAL ("  [0] Voltar ao jogo")
      ESCREVAL ("  [1] Ler Instruções")
      SE barcos_definidos ENTAO
         ESCREVAL ("  [2] Mostrar barcos de ", player1)
         ESCREVAL ("  [3] Mostrar barcos de ", player2)
         ESCREVAL ("  [4] Sair do Jogo")
      SENAO
         ESCREVAL ("  [2] Sair do Jogo")
      FIMSE
      ESCREVAL ("=======================================================")
      ESCREVA ("Escolha uma opção: ")
      LEIA (opcao_menu)
      
      SE opcao_menu = "0" ENTAO
         no_menu <- falso
      FIMSE
      SE opcao_menu = "1" ENTAO
         LIMPATELA
         tutorial()
         ESCREVAL
         ESCREVAL ("Pressione Enter para voltar ao menu...")
         LEIA (enter)
      FIMSE
      
      SE barcos_definidos ENTAO
         SE opcao_menu = "2" ENTAO
            LIMPATELA
            desenhar_tela(1)
            ESCREVAL
            ESCREVAL ("Pressione Enter para voltar ao menu...")
            LEIA (enter)
         FIMSE
         SE opcao_menu = "3" ENTAO
            LIMPATELA
            desenhar_tela(2)
            ESCREVAL
            ESCREVAL ("Pressione Enter para voltar ao menu...")
            LEIA (enter)
         FIMSE
         SE opcao_menu = "4" ENTAO
            LIMPATELA
            ESCREVA ("Deseja realmente sair do jogo? (S/N): ")
            LEIA (sair)
            SE (sair = "S") OU (sair = "s") ENTAO
               sair_global <- verdadeiro
               no_menu <- falso
            FIMSE
         FIMSE
      SENAO
         SE opcao_menu = "2" ENTAO
            LIMPATELA
            ESCREVA ("Deseja realmente sair do jogo? (S/N): ")
            LEIA (sair)
            SE (sair = "S") OU (sair = "s") ENTAO
               sair_global <- verdadeiro
               no_menu <- falso
            FIMSE
         FIMSE
      FIMSE
   FIMENQUANTO
   LIMPATELA
// /**
FIMPROCEDIMENTO
//  * Leitor do console que intercepta a entrada. Se o comando "esc" for
//  * digitado, suspende a execução atual e abre o menu suspenso de opções.
//  *
//  * @param val_str Referência de string para armazenar a resposta digitada.
//  */
PROCEDIMENTO leia_entrada(var val_str: caractere)
INICIO
   LEIA (val_str)
   SE val_str = "esc" ENTAO
      exibir_menu()
      val_str <- "esc"
   FIMSE
// /**
FIMPROCEDIMENTO
//  * Desenha a tela de preparação com o navio correspondente ao Jogador 1.
//  */
PROCEDIMENTO barcop1()
INICIO
   ESCREVAL
   ESCREVAL(topo)
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL("                   |")
   ESCREVAL("                 -----                    |")
   ESCREVAL("                 )___(                  -----")
   ESCREVAL("                   |                    )___(")
   ESCREVAL("               ---------                  |")
   ESCREVAL("              /         \              -------")
   ESCREVAL("             /___________\            /       \")
   ESCREVAL("                   |                 /_________\")
   ESCREVAL("            ---------------               |")
   ESCREVAL("           /               \        -------------")
   ESCREVAL("          /                 \      /             \")
   ESCREVAL("         /___________________\    /_______________\")
   ESCREVAL("       ____________|______________________|__________")
   ESCREVAL("        \_       o             o           o      _/")
   ESCREVAL("          \______________________________________/")
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL
// /**
FIMPROCEDIMENTO
//  * Desenha a tela de preparação com o navio correspondente ao Jogador 2.
//  */
PROCEDIMENTO barcop2()
INICIO
   ESCREVAL
   ESCREVAL(topo)
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL("                                                                                                                                                  |")
   ESCREVAL("                                                                                                                           |                    -----")
   ESCREVAL("                                                                                                                         -----                  )___(")
   ESCREVAL("                                                                                                                         )___(                    |")
   ESCREVAL("                                                                                                                           |                  ---------")
   ESCREVAL("                                                                                                                        -------              /---------\")
   ESCREVAL("                                                                                                                       /-------\            /___________\")
   ESCREVAL("                                                                                                                      /_________\                 |      ")
   ESCREVAL("                                                                                                                           |               ---------------")
   ESCREVAL("                                                                                                                     -------------        /---------------\")
   ESCREVAL("                                                                                                                    /-------------\      /-----------------\")
   ESCREVAL("                                                                                                                   /_______________\    /___________________\")
   ESCREVAL("                                                                                                               ____________|______________________|__________")
   ESCREVAL("                                                                                                                \_--------o-----------o------------o------_/")
   ESCREVAL("                                                                                                                  \______________________________________/")
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL
// /**
FIMPROCEDIMENTO
//  * Desenha a tela comparativa de preparação contendo os navios de ambos os jogadores frente a frente.
//  */
PROCEDIMENTO barcosVs()
VAR
   s_left, s_line: caractere
INICIO
   ESCREVAL
   ESCREVAL(topo)
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL("                   |                                                                                                                              |")
   ESCREVAL("                 -----                    |                                                                                |                    -----")
   ESCREVAL("                 )___(                  -----                                                284                         -----                  )___(")
   ESCREVAL("                   |                    )___(                           7888     7257     588888                         )___(                    |")
   ESCREVAL("               ---------                  |                             78887   78887   488882                             |                  ---------")
   ESCREVAL("              /         \              -------                          8880   5888   88887                             -------              /---------\")
   ESCREVAL("             /___________\            /       \                         2888   8887  8884                              /-------\            /___________\")
   ESCREVAL("                   |                 /_________\                        7888  7888   8884                             /_________\                 |      ")
   ESCREVAL("            ---------------               |                             888  8887    488887                                |               ---------------")
   ESCREVAL("           /               \        -------------                       1887 880        788887                       -------------        /---------------\")
   ESCREVAL("          /                 \      /             \                      7884888           0888                      /-------------\      /-----------------\")
   ESCREVAL("         /___________________\    /_______________\                     880082           8888                      /_______________\    /___________________\")
   ESCREVAL("       ____________|______________________|__________                   48888         708888                   ____________|______________________|__________")
   ESCREVAL("        \_       o             o           o      _/                    78887        888882                     \_--------o-----------o------------o------_/")
   ESCREVAL("          \______________________________________/                                   747                          \______________________________________/")
   ESCREVAL
   ESCREVAL
   ESCREVAL
   s_left <- pad_str("", 31 - (compr(player1) \ 2)) + player1
   s_line <- pad_str(s_left, 135 - (compr(player2) \ 2)) + player2
   ESCREVAL (s_line)
   ESCREVAL
   ESCREVAL
   ESCREVAL
// Backwards compatibility with the hardcoded visual displays in case we missed anything
FIMPROCEDIMENTO
// /**
//  * Desenha a arte em texto representando a transição para o turno de posicionamento do Jogador 1.
//  */
PROCEDIMENTO campo_p1()
INICIO
   desenhar_tela(1)
// /**
FIMPROCEDIMENTO
//  * Desenha a arte em texto representando a transição para o turno de posicionamento do Jogador 2.
//  */
PROCEDIMENTO campo_p2()
INICIO
   desenhar_tela(2)
// /**
FIMPROCEDIMENTO
//  * Desenha a arte em texto representando a transição para o turno de tiro do Jogador 1.
//  */
PROCEDIMENTO campo_tiro_p1()
INICIO
   desenhar_tela(3)
// /**
FIMPROCEDIMENTO
//  * Desenha a arte em texto representando a transição para o turno de tiro do Jogador 2.
//  */
PROCEDIMENTO campo_tiro_p2()
INICIO
   desenhar_tela(4)
//------------------------------------------------------------------
FIMPROCEDIMENTO
//                      FIM PROCEDIMENTOS E FUNÇÕES
//------------------------------------------------------------------

INICIO

   // ------------------------------------------------------------------
   //                          Início do Jogo
   // ------------------------------------------------------------------

   // 5.Linha completa PARA dar formato ao cabeçalho E rodapés das telas
   line_full <- "      _________________________________________________________________________________________________________________________________________________________"
   line_none <- ""
   sair_global <- falso

   line[0] <- "             Posicionamento (1 = Horizontal | 2 = Vertical): "
   line[1] <- "             Linha: "
   line[2] <- "             Coluna: "
   line[3] <- "                                                           -Erro: Digite 1 ou 2 para o posicionamento!-"
   line[4] <- "                                                           -Erro: Digite o número da Linha de 1 a 10!-"
   line[5] <- "                                                           -Erro: Digite o número da Coluna de 1 a 10!-"
   line[6] <- "       Entre com o nome do primeiro jogador e aperte Enter: "
   line[7] <- "       Entre com o nome do segundo jogador e aperte Enter: "
   line[8] <- "                                                        -Erro: Você não digitou o nome do primeiro jogador!-"
   line[9] <- "                                                         -Erro: Você não digitou o nome do segundo jogador!-"
   line[10] <- "                                                                          Pressione Enter!"
   line[11] <- "                                                         -Erro: Digite um nome diferente do primeiro jogador!-"
   line[12] <- "                                                                 *Digite as coordenadas e aperte Enter!*"
   line[13] <- "                                                      -Erro: você posicionou o barco fora da arena, tente novamente-"
   line[14] <- "                                                      -Erro: você já posicionou um barco nessa posição, tente outra-"
   line[15] <- "                                               -Erro: você já posicionou um barco em algumas das posições, tente novamente-"
   line[16] <- "                                                           -Erro: você atirou fora da arena, tente novamente-"
   line[17] <- "                                                           -Erro: você já atirou nessa posição, tente outra-"

   ESCREVAL (line_full)
   ESCREVAL
   ESCREVAL
   ESCREVAL("                                                                           787                                        7249000957                      ")
   ESCREVAL("                                                                         788 882                                    08888800088887                    ")
   ESCREVAL("                                                                                      10                           0858994444494887                   ")
   ESCREVAL("               88  788     798880   882       18     80     882 0888807  4888882   28888         77                8708800499888088                 57")
   ESCREVAL("              480  588   788897588  887      7880   7880    88  88777887 8877727  8887           787              582894880080088482               88 ")
   ESCREVAL("              887  888  4887    087 88       8488   28884  788  84   888 88      488              289             148    788    7182              887 ")
   ESCREVAL("              88888882 788      88  88      78  85  088882 488  81   88  888888   885              4887           778    2207   782             1807  ")
   ESCREVAL("              8877788  882     888  88      887088  887 887882  82  885  88        7887             2884           5887788  8822880            8857   ")
   ESCREVAL("             788   88  888    888   887 7  7885788  887  8888   882882   88          882             78887         7877887  7884752          0802     ")
   ESCREVAL("             284   88   88888887    888885 88   780 88   7888   8882     88888887 777887               88887         4 78888885 0          58827      ")
   ESCREVAL("                   7     7727              77    7  77     2                      5887                  788887       87 252277 78        48887        ")
   ESCREVAL("                                                                                                          7888027    88        87     7488887         ")
   ESCREVAL("                                                                                                            7880047   7888888887   75008807           ")
   ESCREVAL("                                                                                                              78880847  777777   2080884              ")
   ESCREVAL("                    487   757      7407       7     774827        7407      788802                               28888817     20888887                ")
   ESCREVAL("                    888   887   788888887    488   78888888    788888887  088024884                        777      754098040821527      777          ")
   ESCREVAL("                    788  588   8887    88    8887  787   884  0887   788  88    887                       28888      7275088422127     18888          ")
   ESCREVAL("                     88  88   888      88   80 88  287   88  888      88  88  288                          7  887210000885774888000027287 7           ")
   ESCREVAL("                     887780   88      889   87 887 287  884  88      884 2888887                     088784850788758027        724887582548484988     ")
   ESCREVAL("                     78888   788     888   8888088 787 884  788     888  08408802777                 888 78888778                    28 08880 2887    ")
   ESCREVAL("                      8887    888888882   788   88 78888     888888882   887  788888                  27        82 2              77 85       727     ")
   ESCREVAL("                      184      288887     707   48  17        288887     487      7                             78887             8888                ")
   ESCREVAL
   ESCREVAL
   ESCREVAL(line_full)
   ESCREVAL
   ESCREVAL("                                                                     Para iniciar o jogo pressione Enter!")
   ESCREVAL
   leia_entrada(enter)
   LIMPATELA
   // -----------

   // 7.Declaração do topo que será utilizado nas telas
   topo <- "                                                                           O Holandês Voador"

   // 8.Verifica se o jogador quer ver as instruções antes DE jogar
   ENQUANTO (resp <> "s") E (resp <> "S") E (resp <> "n") E (resp <> "N") E (NAO sair_global) FACA
      LIMPATELA
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL (topo)
      ESCREVAL
      ESCREVAL
      ESCREVAL("                                                                       088888888888888888889        ")
      ESCREVAL("                                                                     78804444444444444444987        ")
      ESCREVAL("                                                                    088                             ")
      ESCREVAL("                                                                    887                           08")
      ESCREVAL("                                                                    887           58882           88")
      ESCREVAL("                                                                    887         888420881         88")
      ESCREVAL("                                                                    882        885     087        88")
      ESCREVAL("                                                                    887        88      788        88")
      ESCREVAL("                                                                    882                887        88")
      ESCREVAL("                                                                    887             78887         88")
      ESCREVAL("                                                                    882            288            88")
      ESCREVAL("                                                                    887            70             88")
      ESCREVAL("                                                                    882                           88")
      ESCREVAL("                                                                    887            58             08")
      ESCREVAL("                                                                    888            77             88")
      ESCREVAL("                                                                     0884127           7155555550880")
      ESCREVAL("                                                                      7488888       78888888888885  ")
      ESCREVAL("                                                                           88     5888              ")
      ESCREVAL("                                                                           88   8882                ")
      ESCREVAL("                                                                           788888                   ")
      ESCREVAL
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL("                                                             Gostaria de ver as instruções antes de iniciar?")
      ESCREVAL("                                                                                  <S/N>")
      leia_entrada(resp)
      LIMPATELA
   // 8.Fim
   FIMENQUANTO

   // 9.Mostra o tutorial caso o jogador queira vê-lo E coleta o nome dos jogadores
   SE ((resp = "s") OU (resp = "S")) E (NAO sair_global) ENTAO
      ESCREVAL (line_full)
      tutorial()
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL
      ESCREVAL (line[6])
      leia_entrada(player1)
      SE player1 = "esc" ENTAO
         player1 <- ""
      // 9.1.Verifica se o nome não está vazio
      FIMSE
      SE (player1 = "") E (NAO sair_global) ENTAO
         REPITA
            LIMPATELA
            ESCREVAL (line_full)
            tutorial()
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL (line[8])
            ESCREVAL
            ESCREVAL (line[6])
            leia_entrada(player1)
            SE player1 = "esc" ENTAO
               player1 <- ""
            FIMSE
         ATE (player1 <> "") OU (sair_global)
      // 9.1.Fim
      FIMSE

      SE NAO sair_global ENTAO
         LIMPATELA
         ESCREVAL (line_full)
         tutorial()
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL
         ESCREVAL  (line[7])
         leia_entrada(player2)
         SE player2 = "esc" ENTAO
            player2 <- ""
         FIMSE

         REPITA
            SE (player2 = player1) E (NAO sair_global) ENTAO
               REPITA
                  LIMPATELA
                  ESCREVAL (line_full)
                  tutorial()
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL (line[11])
                  ESCREVAL
                  ESCREVAL  (line[7])
                  leia_entrada(player2)
                  SE player2 = "esc" ENTAO
                     player2 <- ""
                  FIMSE
               ATE (player2 <> player1) OU (sair_global)
            SENAO
               SE (player2 = "") E (NAO sair_global) ENTAO
                  REPITA
                     LIMPATELA
                     ESCREVAL (line_full)
                     tutorial()
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL (line[9])
                     ESCREVAL
                     ESCREVAL  (line[7])
                     leia_entrada(player2)
                     SE player2 = "esc" ENTAO
                        player2 <- ""
                     FIMSE
                  ATE (player2 <> "") OU (sair_global)
               FIMSE
            FIMSE
         ATE (player2 <> "") E (player2 <> player1) OU (sair_global)
      FIMSE

      SE NAO sair_global ENTAO
         LIMPATELA
         ESCREVAL (line_full)
         barcosVS()
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line[10])
         leia_entrada(enter)
         LIMPATELA
      FIMSE
   FIMSE

   novamente <- "s"
   barcos_definidos <- falso
   ENQUANTO ((novamente = "s") OU (novamente = "S")) E (NAO sair_global) FACA
      barcos_definidos <- falso
      SE ((resp = "n") OU (resp = "N")) E (novamente = "s") E (NAO sair_global) ENTAO
         ESCREVAL (line_full)
         barcop1()
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL
         ESCREVAL  (line[6])
         leia_entrada(player1)
         SE player1 = "esc" ENTAO
            player1 <- ""
         FIMSE

         SE (player1 = "") E (NAO sair_global) ENTAO
            REPITA
               LIMPATELA
               ESCREVAL (line_full)
               barcop1()
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[8])
               ESCREVAL
               ESCREVAL  (line[6])
               leia_entrada(player1)
               SE player1 = "esc" ENTAO
                  player1 <- ""
               FIMSE
            ATE (player1 <> "") OU (sair_global)
         FIMSE

         SE NAO sair_global ENTAO
            LIMPATELA
            ESCREVAL (line_full)
            barcop2()
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL
            ESCREVAL (line[7])
            leia_entrada(player2)
            SE player2 = "esc" ENTAO
               player2 <- ""
            FIMSE

            REPITA
               SE (player2 = player1) E (NAO sair_global) ENTAO
                  REPITA
                     LIMPATELA
                     ESCREVAL (line_full)
                     barcop2()
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL (line[11])
                     ESCREVAL
                     ESCREVAL (line[7])
                     leia_entrada(player2)
                     SE player2 = "esc" ENTAO
                        player2 <- ""
                     FIMSE
                  ATE (player2 <> player1) OU (sair_global)
               SENAO
                  SE (player2 = "") E (NAO sair_global) ENTAO
                     REPITA
                        LIMPATELA
                        ESCREVAL (line_full)
                        barcop2()
                        ESCREVAL (line_full)
                        ESCREVAL
                        ESCREVAL (line[9])
                        ESCREVAL
                        ESCREVAL (line[7])
                        leia_entrada(player2)
                        SE player2 = "esc" ENTAO
                           player2 <- ""
                        FIMSE
                     ATE (player2 <> "") OU (sair_global)
                  FIMSE
               FIMSE
            ATE (player2 <> "") E (player2 <> player1) OU (sair_global)
         FIMSE

         SE NAO sair_global ENTAO
            LIMPATELA
            ESCREVAL (line_full)
            barcosVs()
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL
            ESCREVAL (line[10])
            leia_entrada(enter)
            LIMPATELA
         FIMSE
      // Preenchimento da matriz
      FIMSE
      inicializar_barcos()
      PARA l_idx DE 1 ATE 10 FACA
         PARA c_idx DE 1 ATE 10 FACA
            cord_p1[l_idx,c_idx] <- "~"
            tiro_p1[l_idx,c_idx] <- "~"
            cord_p2[l_idx,c_idx] <- "~"
            tiro_p2[l_idx,c_idx] <- "~"
         FIMPARA
      // Player 1
      FIMPARA
      LIMPATELA
      ESCREVAL (line_full)
      campo_p1()
      ESCREVAL
      ESCREVAL
      ESCREVAL ("       ",player1,", é chegado o momento...")
      ESCREVAL ("       Como deseja posicionar seus barcos? (1 = Manual | 2 = Aleatório): ")
      ESCREVAL
      ESCREVAL (line_full)
      ESCREVAL
      opcao_posicionamento <- 0
      REPITA
         leia_entrada(input_str)
         SE input_str = "esc" ENTAO
            LIMPATELA
            ESCREVAL (line_full)
            campo_p1()
            ESCREVAL
            ESCREVAL
            ESCREVAL ("       ",player1,", é chegado o momento...")
            ESCREVAL ("       Como deseja posicionar seus barcos? (1 = Manual | 2 = Aleatório): ")
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
         SENAO
            opcao_posicionamento <- caracpnum(input_str)
         FIMSE
      ATE (opcao_posicionamento = 1) OU (opcao_posicionamento = 2) OU (sair_global)

      SE (NAO sair_global) ENTAO
         SE opcao_posicionamento = 1 ENTAO
            posicionar_barcos(1)
         SENAO
            posicionar_barcos_aleatorio(1)
         FIMSE
      // Player 2
      FIMSE
      SE (NAO sair_global) ENTAO
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("       ",player2,", é chegado o momento...")
         ESCREVAL ("       Como deseja posicionar seus barcos? (1 = Manual | 2 = Aleatório): ")
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         opcao_posicionamento <- 0
         REPITA
            leia_entrada(input_str)
            SE input_str = "esc" ENTAO
               LIMPATELA
               ESCREVAL (line_full)
               campo_p2()
               ESCREVAL
               ESCREVAL
               ESCREVAL ("       ",player2,", é chegado o momento...")
               ESCREVAL ("       Como deseja posicionar seus barcos? (1 = Manual | 2 = Aleatório): ")
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
            SENAO
               opcao_posicionamento <- caracpnum(input_str)
            FIMSE
         ATE (opcao_posicionamento = 1) OU (opcao_posicionamento = 2) OU (sair_global)

         SE (NAO sair_global) ENTAO
            SE opcao_posicionamento = 1 ENTAO
               posicionar_barcos(2)
            SENAO
               posicionar_barcos_aleatorio(2)
            FIMSE
         FIMSE
      FIMSE

      SE (NAO sair_global) ENTAO
         barcos_definidos <- verdadeiro
         decidir_inicio()
      // Reset statistics
      FIMSE
      afundou_p1 <- 0
      afundou_p2 <- 0
      tentativas_p1 <- 0
      tentativas_p2 <- 0
      pontos_p1 <- 0
      pontos_p2 <- 0

      // Execute attack rounds until someone wins (all 16 tiles hit)
      ENQUANTO (afundou_p1 < 16) E (afundou_p2 < 16) E (NAO sair_global) FACA
         executar_ataques(primeiro_jogador)
         SE (afundou_p1 < 16) E (afundou_p2 < 16) E (NAO sair_global) ENTAO
            SE primeiro_jogador = 1 ENTAO
               executar_ataques(2)
            SENAO
               executar_ataques(1)
            FIMSE
         FIMSE
      FIMENQUANTO

      SE (NAO sair_global) ENTAO

      // Calculate final statistics
      SE tentativas_p1 > 0 ENTAO
         pontos_p1 <- (afundou_p1 * 100) / tentativas_p1
      SENAO
         pontos_p1 <- 0.0
      FIMSE

      SE tentativas_p2 > 0 ENTAO
         pontos_p2 <- (afundou_p2 * 100) / tentativas_p2
      SENAO
         pontos_p2 <- 0.0
      FIMSE

      LIMPATELA
      ESCREVAL (line_full)
      ESCREVAL (line_none)
      ESCREVAL (topo)
      ESCREVAL (line_none)
      ESCREVAL (pad_str("      =======================================================", 70))
      ESCREVAL (pad_str("                        RELATÓRIO DA BATALHA                 ", 70), "  _|_|_|    _|_|    _|      _|  _|_|_|_|")
      ESCREVAL (pad_str("      =======================================================", 70), "_|        _|    _|  _|_|  _|_|  _|")
      ESCREVAL (pad_str("      Jogador: " + player1, 70),                                      "_|  _|_|  _|_|_|_|  _|  _|  _|  _|_|_|")
      ESCREVAL (pad_str("        - Tiros disparados: " + numpcarac(tentativas_p1), 70),        "_|    _|  _|    _|  _|      _|  _|")
      ESCREVAL (pad_str("        - Tiros certeiros:  " + numpcarac(afundou_p1), 70),           "  _|_|_|  _|    _|  _|      _|  _|_|_|_|")
      ESCREVAL (pad_str("        - Precisão de tiro: " + numpcarac(pontos_p1) + "%", 70),      " ")
      ESCREVAL (pad_str("      -------------------------------------------------------", 70), "  _|_|    _|      _|  _|_|_|_|  _|_|_|")
      ESCREVAL (pad_str("      Jogador: " + player2, 70),                                      "_|    _|  _|      _|  _|        _|    _|")
      ESCREVAL (pad_str("        - Tiros disparados: " + numpcarac(tentativas_p2), 70),        "_|    _|  _|      _|  _|_|_|    _|_|_|")
      ESCREVAL (pad_str("        - Tiros certeiros:  " + numpcarac(afundou_p2), 70),           "_|    _|    _|  _|    _|        _|    _|_|")
      ESCREVAL (pad_str("        - Precisão de tiro: " + numpcarac(pontos_p2) + "%", 70),      "  _|_|        _|      _|_|_|_|  _|      _|")
      ESCREVAL (pad_str("      =======================================================", 70))
      ESCREVAL (line_none)
      
      novamente <- "z"
      SE (pontos_p1 > pontos_p2) ENTAO
         ENQUANTO (novamente <> "s") E (novamente <> "S") E (novamente <> "n") E (novamente <> "N") E (NAO sair_global) FACA
            ESCREVAL ("                                               ",player1," venceu. Parabéns!")
            ESCREVAL (line_none)
            ESCREVAL (line_none)
            ESCREVAL ("                                               Desejam jogar novamente? <s/n>")
            leia_entrada(novamente)
            ESCREVAL (line_none)
            ESCREVAL (line_full)
         FIMENQUANTO
      SENAO
         SE (pontos_p1 = pontos_p2) ENTAO
            ENQUANTO (novamente <> "s") E (novamente <> "S") E (novamente <> "n") E (novamente <> "N") E (NAO sair_global) FACA
               ESCREVAL ("                                               Empate. Parabéns a ambos!")
               ESCREVAL (line_none)
               ESCREVAL (line_none)
               ESCREVAL ("                                               Desejam jogar novamente? <s/n>")
               leia_entrada(novamente)
               ESCREVAL (line_none)
               ESCREVAL (line_full)
               LIMPATELA
            FIMENQUANTO
         SENAO
            ENQUANTO (novamente <> "s") E (novamente <> "S") E (novamente <> "n") E (novamente <> "N") E (NAO sair_global) FACA
               ESCREVAL ("                                               ",player2," venceu. Parabéns!")
               ESCREVAL (line_none)
               ESCREVAL (line_none)
               ESCREVAL ("                                               Desejam jogar novamente? <s/n>")
               leia_entrada(novamente)
               ESCREVAL (line_none)
               ESCREVAL (line_full)
               LIMPATELA
            FIMENQUANTO
         FIMSE
      FIMSE

      SE ((novamente = "n") OU (novamente = "N") OU (sair_global)) E (NAO sair_global) ENTAO
         LIMPATELA
         ESCREVAL (line_full)
         ESCREVAL (line_none)
         ESCREVAL ("                       GGGGGG GGGGGG GGG  GGG GGGGGG")
         ESCREVAL ("                       GG     GG  GG GGGGGGGG GG")
         ESCREVAL ("                       GG GGG GGGGGG GG GG GG GGGG")
         ESCREVAL ("                       GG  GG GG  GG GG    GG GG")
         ESCREVAL ("                       GGGGGG GG  GG GG    GG GGGGGG")
         ESCREVAL
         ESCREVAL ("                     GGGGGG GG   GG GGGGGG GGGGGG   GG")
         ESCREVAL ("                     GG  GG GG   GG GG     GG  GG   GG")
         ESCREVAL ("                     GG  GG GG   GG GGGG   GGGGG    GG")
         ESCREVAL ("                     GG  GG  GGGGG  GG     GG  GG")
         ESCREVAL ("                     GGGGGG   GGG   GGGGGG GG  GG   GG")
         ESCREVAL (line_none)
         ESCREVAL (line_none)
         ESCREVAL ("                             Pressione Enter.")
         ESCREVAL (line_none)
         ESCREVAL (line_full)
         ESCREVAL
         leia_entrada(enter)
         LIMPATELA
      FIMSE
      // If we wish to play again, let resp = "n" so that it asks for names again or starts directly
      FIMSE
      // In the original game, resp remains the same, but it resets names only if resp was "n"
      // Let's keep it consistent.
   FIMENQUANTO

FIMALGORITMO
