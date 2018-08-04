algoritmo "Holândes Voador - BN"

// Disciplina     : [Lógica de Programação e Algorítmos]
// Professor      : Edson Pedro Ferlin
// Função         : Simula um jogo de Batalha Naval
// Autores        : Brenda Lee, Caroline Gonçalvez e Renan Rocha
// Data de inínio : 01/04/2017
// Data de término:

//------------------------------------------------------------------
//                         VARIÁVEIS
//------------------------------------------------------------------

var

   // Matrizes
   cord_p1, cord_p2, tiro_p1, tiro_p2: vetor [1..10,1..10] de caractere
   // Inteiros
   b1, b2, b3, b4, temErro, posicaoBarco, i, j, k, linha, coluna, tiro_linha, tiro_coluna, afundou_p1, afundou_p2, tentativas_p1, tentativas_p2, dir: inteiro
   // Reais
   pontos_p1, pontos_p2: real
   // Caracteres
   resp, enter, line_none, line_full, topo, player1, player2, novamente, auto: caractere

//------------------------------------------------------------------
//                      Fim (VARIÁVEIS)
//------------------------------------------------------------------


//------------------------------------------------------------------
//                       PROCEDIMENTOS
//------------------------------------------------------------------

//--------- Procedimento para o campo somente do 1º jogador --------
PROCEDIMENTO campo1()

INICIO
   ESCREVAL ("       Campo: ",player1)
   ESCREVAL
   ESCREVAL ("                                      COLUNA")
   ESCREVAL ("                                    (vertical)")
   ESCREVAL
   ESCREVAL ("                            1  2  3  4  5  6  7  8  9  10")
   ESCREVAL ("                         1  ",cord_p1[1,1],"  ",cord_p1[1,2],"  ",cord_p1[1,3],"  ",cord_p1[1,4],"  ",cord_p1[1,5],"  ",cord_p1[1,6],"  ",cord_p1[1,7],"  ",cord_p1[1,8],"  ",cord_p1[1,9],"  ",cord_p1[1,10],"")
   ESCREVAL ("                         2  ",cord_p1[2,1],"  ",cord_p1[2,2],"  ",cord_p1[2,3],"  ",cord_p1[2,4],"  ",cord_p1[2,5],"  ",cord_p1[2,6],"  ",cord_p1[2,7],"  ",cord_p1[2,8],"  ",cord_p1[2,9],"  ",cord_p1[2,10],"")
   ESCREVAL ("                         3  ",cord_p1[3,1],"  ",cord_p1[3,2],"  ",cord_p1[3,3],"  ",cord_p1[3,4],"  ",cord_p1[3,5],"  ",cord_p1[3,6],"  ",cord_p1[3,7],"  ",cord_p1[3,8],"  ",cord_p1[3,9],"  ",cord_p1[3,10],"")
   ESCREVAL ("                         4  ",cord_p1[4,1],"  ",cord_p1[4,2],"  ",cord_p1[4,3],"  ",cord_p1[4,4],"  ",cord_p1[4,5],"  ",cord_p1[4,6],"  ",cord_p1[4,7],"  ",cord_p1[4,8],"  ",cord_p1[4,9],"  ",cord_p1[4,10],"")
   ESCREVAL ("              LINHA      5  ",cord_p1[5,1],"  ",cord_p1[5,2],"  ",cord_p1[5,3],"  ",cord_p1[5,4],"  ",cord_p1[5,5],"  ",cord_p1[5,6],"  ",cord_p1[5,7],"  ",cord_p1[5,8],"  ",cord_p1[5,9],"  ",cord_p1[5,10],"")
   ESCREVAL ("           (horizontal)  6  ",cord_p1[6,1],"  ",cord_p1[6,2],"  ",cord_p1[6,3],"  ",cord_p1[6,4],"  ",cord_p1[6,5],"  ",cord_p1[6,6],"  ",cord_p1[6,7],"  ",cord_p1[6,8],"  ",cord_p1[6,9],"  ",cord_p1[6,10],"")
   ESCREVAL ("                         7  ",cord_p1[7,1],"  ",cord_p1[7,2],"  ",cord_p1[7,3],"  ",cord_p1[7,4],"  ",cord_p1[7,5],"  ",cord_p1[7,6],"  ",cord_p1[7,7],"  ",cord_p1[7,8],"  ",cord_p1[7,9],"  ",cord_p1[7,10],"")
   ESCREVAL ("                         8  ",cord_p1[8,1],"  ",cord_p1[8,2],"  ",cord_p1[8,3],"  ",cord_p1[8,4],"  ",cord_p1[8,5],"  ",cord_p1[8,6],"  ",cord_p1[8,7],"  ",cord_p1[8,8],"  ",cord_p1[8,9],"  ",cord_p1[8,10],"")
   ESCREVAL ("                         9  ",cord_p1[9,1],"  ",cord_p1[9,2],"  ",cord_p1[9,3],"  ",cord_p1[9,4],"  ",cord_p1[9,5],"  ",cord_p1[9,6],"  ",cord_p1[9,7],"  ",cord_p1[9,8],"  ",cord_p1[9,9],"  ",cord_p1[9,10],"")
   ESCREVAL ("                         10 ",cord_p1[10,1],"  ",cord_p1[10,2],"  ",cord_p1[10,3],"  ",cord_p1[10,4],"  ",cord_p1[10,5],"  ",cord_p1[10,6],"  ",cord_p1[10,7],"  ",cord_p1[10,8],"  ",cord_p1[10,9],"  ",cord_p1[10,10],"")
FIMPROCEDIMENTO

//------------------------ Fim -------------------------------------

//--------- Procedimento para o campo somente do 2º jogador --------
PROCEDIMENTO campo2()

INICIO
   ESCREVAL ("                                                                                                                                        Campo: ",player2)
   ESCREVAL
   ESCREVAL ("                                                                                                                                    COLUNA")
   ESCREVAL ("                                                                                                                                  (vertical)")
   ESCREVAL
   ESCREVAL ("                                                                                                                          1  2  3  4  5  6  7  8  9  10")
   ESCREVAL ("                                                                                                                       1  ",cord_p2[1,1],"  ",cord_p2[1,2],"  ",cord_p2[1,3],"  ",cord_p2[1,4],"  ",cord_p2[1,5],"  ",cord_p2[1,6],"  ",cord_p2[1,7],"  ",cord_p2[1,8],"  ",cord_p2[1,9],"  ",cord_p2[1,10],"")
   ESCREVAL ("                                                                                                                       2  ",cord_p2[2,1],"  ",cord_p2[2,2],"  ",cord_p2[2,3],"  ",cord_p2[2,4],"  ",cord_p2[2,5],"  ",cord_p2[2,6],"  ",cord_p2[2,7],"  ",cord_p2[2,8],"  ",cord_p2[2,9],"  ",cord_p2[2,10],"")
   ESCREVAL ("                                                                                                                       3  ",cord_p2[3,1],"  ",cord_p2[3,2],"  ",cord_p2[3,3],"  ",cord_p2[3,4],"  ",cord_p2[3,5],"  ",cord_p2[3,6],"  ",cord_p2[3,7],"  ",cord_p2[3,8],"  ",cord_p2[3,9],"  ",cord_p2[3,10],"")
   ESCREVAL ("                                                                                                                       4  ",cord_p2[4,1],"  ",cord_p2[4,2],"  ",cord_p2[4,3],"  ",cord_p2[4,4],"  ",cord_p2[4,5],"  ",cord_p2[4,6],"  ",cord_p2[4,7],"  ",cord_p2[4,8],"  ",cord_p2[4,9],"  ",cord_p2[4,10],"")
   ESCREVAL ("                                                                                                            LINHA      5  ",cord_p2[5,1],"  ",cord_p2[5,2],"  ",cord_p2[5,3],"  ",cord_p2[5,4],"  ",cord_p2[5,5],"  ",cord_p2[5,6],"  ",cord_p2[5,7],"  ",cord_p2[5,8],"  ",cord_p2[5,9],"  ",cord_p2[5,10],"")
   ESCREVAL ("                                                                                                         (horizontal)  6  ",cord_p2[6,1],"  ",cord_p2[6,2],"  ",cord_p2[6,3],"  ",cord_p2[6,4],"  ",cord_p2[6,5],"  ",cord_p2[6,6],"  ",cord_p2[6,7],"  ",cord_p2[6,8],"  ",cord_p2[6,9],"  ",cord_p2[6,10],"")
   ESCREVAL ("                                                                                                                       7  ",cord_p2[7,1],"  ",cord_p2[7,2],"  ",cord_p2[7,3],"  ",cord_p2[7,4],"  ",cord_p2[7,5],"  ",cord_p2[7,6],"  ",cord_p2[7,7],"  ",cord_p2[7,8],"  ",cord_p2[7,9],"  ",cord_p2[7,10],"")
   ESCREVAL ("                                                                                                                       8  ",cord_p2[8,1],"  ",cord_p2[8,2],"  ",cord_p2[8,3],"  ",cord_p2[8,4],"  ",cord_p2[8,5],"  ",cord_p2[8,6],"  ",cord_p2[8,7],"  ",cord_p2[8,8],"  ",cord_p2[8,9],"  ",cord_p2[8,10],"")
   ESCREVAL ("                                                                                                                       9  ",cord_p2[9,1],"  ",cord_p2[9,2],"  ",cord_p2[9,3],"  ",cord_p2[9,4],"  ",cord_p2[9,5],"  ",cord_p2[9,6],"  ",cord_p2[9,7],"  ",cord_p2[9,8],"  ",cord_p2[9,9],"  ",cord_p2[9,10],"")
   ESCREVAL ("                                                                                                                       10 ",cord_p2[10,1],"  ",cord_p2[10,2],"  ",cord_p2[10,3],"  ",cord_p2[10,4],"  ",cord_p2[10,5],"  ",cord_p2[10,6],"  ",cord_p2[10,7],"  ",cord_p2[10,8],"  ",cord_p2[10,9],"  ",cord_p2[10,10],"")
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

//--------- Procedimento contendo os dois campos sem setas ---------
PROCEDIMENTO campo3()

INICIO
   ESCREVAL ("       Campo: ",player1,"                                                                                        Campo: ",player2)
   ESCREVAL
   ESCREVAL ("                                      COLUNA                                                                                         COLUNA")
   ESCREVAL ("                                    (vertical)                                                                                     (vertical)")
   ESCREVAL
   ESCREVAL ("                            1  2  3  4  5  6  7  8  9  10                                                                  1  2  3  4  5  6  7  8  9  10")
   ESCREVAL ("                         1  ",cord_p1[1,1],"  ",cord_p1[1,2],"  ",cord_p1[1,3],"  ",cord_p1[1,4],"  ",cord_p1[1,5],"  ",cord_p1[1,6],"  ",cord_p1[1,7],"  ",cord_p1[1,8],"  ",cord_p1[1,9],"  ",cord_p1[1,10],"                                                                1  ",cord_p2[1,1],"  ",cord_p2[1,2],"  ",cord_p2[1,3],"  ",cord_p2[1,4],"  ",cord_p2[1,5],"  ",cord_p2[1,6],"  ",cord_p2[1,7],"  ",cord_p2[1,8],"  ",cord_p2[1,9],"  ",cord_p2[1,10],"")
   ESCREVAL ("                         2  ",cord_p1[2,1],"  ",cord_p1[2,2],"  ",cord_p1[2,3],"  ",cord_p1[2,4],"  ",cord_p1[2,5],"  ",cord_p1[2,6],"  ",cord_p1[2,7],"  ",cord_p1[2,8],"  ",cord_p1[2,9],"  ",cord_p1[2,10],"                                                                2  ",cord_p2[2,1],"  ",cord_p2[2,2],"  ",cord_p2[2,3],"  ",cord_p2[2,4],"  ",cord_p2[2,5],"  ",cord_p2[2,6],"  ",cord_p2[2,7],"  ",cord_p2[2,8],"  ",cord_p2[2,9],"  ",cord_p2[2,10],"")
   ESCREVAL ("                         3  ",cord_p1[3,1],"  ",cord_p1[3,2],"  ",cord_p1[3,3],"  ",cord_p1[3,4],"  ",cord_p1[3,5],"  ",cord_p1[3,6],"  ",cord_p1[3,7],"  ",cord_p1[3,8],"  ",cord_p1[3,9],"  ",cord_p1[3,10],"                                                                3  ",cord_p2[3,1],"  ",cord_p2[3,2],"  ",cord_p2[3,3],"  ",cord_p2[3,4],"  ",cord_p2[3,5],"  ",cord_p2[3,6],"  ",cord_p2[3,7],"  ",cord_p2[3,8],"  ",cord_p2[3,9],"  ",cord_p2[3,10],"")
   ESCREVAL ("                         4  ",cord_p1[4,1],"  ",cord_p1[4,2],"  ",cord_p1[4,3],"  ",cord_p1[4,4],"  ",cord_p1[4,5],"  ",cord_p1[4,6],"  ",cord_p1[4,7],"  ",cord_p1[4,8],"  ",cord_p1[4,9],"  ",cord_p1[4,10],"                                                                4  ",cord_p2[4,1],"  ",cord_p2[4,2],"  ",cord_p2[4,3],"  ",cord_p2[4,4],"  ",cord_p2[4,5],"  ",cord_p2[4,6],"  ",cord_p2[4,7],"  ",cord_p2[4,8],"  ",cord_p2[4,9],"  ",cord_p2[4,10],"")
   ESCREVAL ("              LINHA      5  ",cord_p1[5,1],"  ",cord_p1[5,2],"  ",cord_p1[5,3],"  ",cord_p1[5,4],"  ",cord_p1[5,5],"  ",cord_p1[5,6],"  ",cord_p1[5,7],"  ",cord_p1[5,8],"  ",cord_p1[5,9],"  ",cord_p1[5,10],"                                                     LINHA      5  ",cord_p2[5,1],"  ",cord_p2[5,2],"  ",cord_p2[5,3],"  ",cord_p2[5,4],"  ",cord_p2[5,5],"  ",cord_p2[5,6],"  ",cord_p2[5,7],"  ",cord_p2[5,8],"  ",cord_p2[5,9],"  ",cord_p2[5,10],"")
   ESCREVAL ("           (horizontal)  6  ",cord_p1[6,1],"  ",cord_p1[6,2],"  ",cord_p1[6,3],"  ",cord_p1[6,4],"  ",cord_p1[6,5],"  ",cord_p1[6,6],"  ",cord_p1[6,7],"  ",cord_p1[6,8],"  ",cord_p1[6,9],"  ",cord_p1[6,10],"                                                  (horizontal)  6  ",cord_p2[6,1],"  ",cord_p2[6,2],"  ",cord_p2[6,3],"  ",cord_p2[6,4],"  ",cord_p2[6,5],"  ",cord_p2[6,6],"  ",cord_p2[6,7],"  ",cord_p2[6,8],"  ",cord_p2[6,9],"  ",cord_p2[6,10],"")
   ESCREVAL ("                         7  ",cord_p1[7,1],"  ",cord_p1[7,2],"  ",cord_p1[7,3],"  ",cord_p1[7,4],"  ",cord_p1[7,5],"  ",cord_p1[7,6],"  ",cord_p1[7,7],"  ",cord_p1[7,8],"  ",cord_p1[7,9],"  ",cord_p1[7,10],"                                                                7  ",cord_p2[7,1],"  ",cord_p2[7,2],"  ",cord_p2[7,3],"  ",cord_p2[7,4],"  ",cord_p2[7,5],"  ",cord_p2[7,6],"  ",cord_p2[7,7],"  ",cord_p2[7,8],"  ",cord_p2[7,9],"  ",cord_p2[7,10],"")
   ESCREVAL ("                         8  ",cord_p1[8,1],"  ",cord_p1[8,2],"  ",cord_p1[8,3],"  ",cord_p1[8,4],"  ",cord_p1[8,5],"  ",cord_p1[8,6],"  ",cord_p1[8,7],"  ",cord_p1[8,8],"  ",cord_p1[8,9],"  ",cord_p1[8,10],"                                                                8  ",cord_p2[8,1],"  ",cord_p2[8,2],"  ",cord_p2[8,3],"  ",cord_p2[8,4],"  ",cord_p2[8,5],"  ",cord_p2[8,6],"  ",cord_p2[8,7],"  ",cord_p2[8,8],"  ",cord_p2[8,9],"  ",cord_p2[8,10],"")
   ESCREVAL ("                         9  ",cord_p1[9,1],"  ",cord_p1[9,2],"  ",cord_p1[9,3],"  ",cord_p1[9,4],"  ",cord_p1[9,5],"  ",cord_p1[9,6],"  ",cord_p1[9,7],"  ",cord_p1[9,8],"  ",cord_p1[9,9],"  ",cord_p1[9,10],"                                                                9  ",cord_p2[9,1],"  ",cord_p2[9,2],"  ",cord_p2[9,3],"  ",cord_p2[9,4],"  ",cord_p2[9,5],"  ",cord_p2[9,6],"  ",cord_p2[9,7],"  ",cord_p2[9,8],"  ",cord_p2[9,9],"  ",cord_p2[9,10],"")
   ESCREVAL ("                         10 ",cord_p1[10,1],"  ",cord_p1[10,2],"  ",cord_p1[10,3],"  ",cord_p1[10,4],"  ",cord_p1[10,5],"  ",cord_p1[10,6],"  ",cord_p1[10,7],"  ",cord_p1[10,8],"  ",cord_p1[10,9],"  ",cord_p1[10,10],"                                                                10 ",cord_p2[10,1],"  ",cord_p2[10,2],"  ",cord_p2[10,3],"  ",cord_p2[10,4],"  ",cord_p2[10,5],"  ",cord_p2[10,6],"  ",cord_p2[10,7],"  ",cord_p2[10,8],"  ",cord_p2[10,9],"  ",cord_p2[10,10],"")
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

//- Procedimento contendo os dois campos com a seta indicativa para
//------------- o 1º jogador (cordenadas) --------------------------
PROCEDIMENTO campo_p1()

INICIO
   ESCREVAL
   ESCREVAL(topo)
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL ("       Campo: ",player1,"                                                                                        Campo: ",player2)
   ESCREVAL
   ESCREVAL ("                                      COLUNA                                                                                         COLUNA")
   ESCREVAL ("                                    (vertical)                                                                                     (vertical)")
   ESCREVAL
   ESCREVAL ("                            1  2  3  4  5  6  7  8  9  10                                                                  1  2  3  4  5  6  7  8  9  10")
   ESCREVAL ("                         1  ",cord_p1[1,1],"  ",cord_p1[1,2],"  ",cord_p1[1,3],"  ",cord_p1[1,4],"  ",cord_p1[1,5],"  ",cord_p1[1,6],"  ",cord_p1[1,7],"  ",cord_p1[1,8],"  ",cord_p1[1,9],"  ",cord_p1[1,10],"                                                                1  ",cord_p2[1,1],"  ",cord_p2[1,2],"  ",cord_p2[1,3],"  ",cord_p2[1,4],"  ",cord_p2[1,5],"  ",cord_p2[1,6],"  ",cord_p2[1,7],"  ",cord_p2[1,8],"  ",cord_p2[1,9],"  ",cord_p2[1,10],"")
   ESCREVAL ("                         2  ",cord_p1[2,1],"  ",cord_p1[2,2],"  ",cord_p1[2,3],"  ",cord_p1[2,4],"  ",cord_p1[2,5],"  ",cord_p1[2,6],"  ",cord_p1[2,7],"  ",cord_p1[2,8],"  ",cord_p1[2,9],"  ",cord_p1[2,10],"                       587                                      2  ",cord_p2[2,1],"  ",cord_p2[2,2],"  ",cord_p2[2,3],"  ",cord_p2[2,4],"  ",cord_p2[2,5],"  ",cord_p2[2,6],"  ",cord_p2[2,7],"  ",cord_p2[2,8],"  ",cord_p2[2,9],"  ",cord_p2[2,10],"")
   ESCREVAL ("                         3  ",cord_p1[3,1],"  ",cord_p1[3,2],"  ",cord_p1[3,3],"  ",cord_p1[3,4],"  ",cord_p1[3,5],"  ",cord_p1[3,6],"  ",cord_p1[3,7],"  ",cord_p1[3,8],"  ",cord_p1[3,9],"  ",cord_p1[3,10],"                     9888                                       3  ",cord_p2[3,1],"  ",cord_p2[3,2],"  ",cord_p2[3,3],"  ",cord_p2[3,4],"  ",cord_p2[3,5],"  ",cord_p2[3,6],"  ",cord_p2[3,7],"  ",cord_p2[3,8],"  ",cord_p2[3,9],"  ",cord_p2[3,10],"")
   ESCREVAL ("                         4  ",cord_p1[4,1],"  ",cord_p1[4,2],"  ",cord_p1[4,3],"  ",cord_p1[4,4],"  ",cord_p1[4,5],"  ",cord_p1[4,6],"  ",cord_p1[4,7],"  ",cord_p1[4,8],"  ",cord_p1[4,9],"  ",cord_p1[4,10],"                  7888888277777777777                           4  ",cord_p2[4,1],"  ",cord_p2[4,2],"  ",cord_p2[4,3],"  ",cord_p2[4,4],"  ",cord_p2[4,5],"  ",cord_p2[4,6],"  ",cord_p2[4,7],"  ",cord_p2[4,8],"  ",cord_p2[4,9],"  ",cord_p2[4,10],"")
   ESCREVAL ("              LINHA      5  ",cord_p1[5,1],"  ",cord_p1[5,2],"  ",cord_p1[5,3],"  ",cord_p1[5,4],"  ",cord_p1[5,5],"  ",cord_p1[5,6],"  ",cord_p1[5,7],"  ",cord_p1[5,8],"  ",cord_p1[5,9],"  ",cord_p1[5,10],"                0888888888888888888887               LINHA      5  ",cord_p2[5,1],"  ",cord_p2[5,2],"  ",cord_p2[5,3],"  ",cord_p2[5,4],"  ",cord_p2[5,5],"  ",cord_p2[5,6],"  ",cord_p2[5,7],"  ",cord_p2[5,8],"  ",cord_p2[5,9],"  ",cord_p2[5,10],"")
   ESCREVAL ("           (horizontal)  6  ",cord_p1[6,1],"  ",cord_p1[6,2],"  ",cord_p1[6,3],"  ",cord_p1[6,4],"  ",cord_p1[6,5],"  ",cord_p1[6,6],"  ",cord_p1[6,7],"  ",cord_p1[6,8],"  ",cord_p1[6,9],"  ",cord_p1[6,10],"                9888888888888888888887            (horizontal)  6  ",cord_p2[6,1],"  ",cord_p2[6,2],"  ",cord_p2[6,3],"  ",cord_p2[6,4],"  ",cord_p2[6,5],"  ",cord_p2[6,6],"  ",cord_p2[6,7],"  ",cord_p2[6,8],"  ",cord_p2[6,9],"  ",cord_p2[6,10],"")
   ESCREVAL ("                         7  ",cord_p1[7,1],"  ",cord_p1[7,2],"  ",cord_p1[7,3],"  ",cord_p1[7,4],"  ",cord_p1[7,5],"  ",cord_p1[7,6],"  ",cord_p1[7,7],"  ",cord_p1[7,8],"  ",cord_p1[7,9],"  ",cord_p1[7,10],"                  7888888277777777777                           7  ",cord_p2[7,1],"  ",cord_p2[7,2],"  ",cord_p2[7,3],"  ",cord_p2[7,4],"  ",cord_p2[7,5],"  ",cord_p2[7,6],"  ",cord_p2[7,7],"  ",cord_p2[7,8],"  ",cord_p2[7,9],"  ",cord_p2[7,10],"")
   ESCREVAL ("                         8  ",cord_p1[8,1],"  ",cord_p1[8,2],"  ",cord_p1[8,3],"  ",cord_p1[8,4],"  ",cord_p1[8,5],"  ",cord_p1[8,6],"  ",cord_p1[8,7],"  ",cord_p1[8,8],"  ",cord_p1[8,9],"  ",cord_p1[8,10],"                     08887                                      8  ",cord_p2[8,1],"  ",cord_p2[8,2],"  ",cord_p2[8,3],"  ",cord_p2[8,4],"  ",cord_p2[8,5],"  ",cord_p2[8,6],"  ",cord_p2[8,7],"  ",cord_p2[8,8],"  ",cord_p2[8,9],"  ",cord_p2[8,10],"")
   ESCREVAL ("                         9  ",cord_p1[9,1],"  ",cord_p1[9,2],"  ",cord_p1[9,3],"  ",cord_p1[9,4],"  ",cord_p1[9,5],"  ",cord_p1[9,6],"  ",cord_p1[9,7],"  ",cord_p1[9,8],"  ",cord_p1[9,9],"  ",cord_p1[9,10],"                       287                                      9  ",cord_p2[9,1],"  ",cord_p2[9,2],"  ",cord_p2[9,3],"  ",cord_p2[9,4],"  ",cord_p2[9,5],"  ",cord_p2[9,6],"  ",cord_p2[9,7],"  ",cord_p2[9,8],"  ",cord_p2[9,9],"  ",cord_p2[9,10],"")
   ESCREVAL ("                         10 ",cord_p1[10,1],"  ",cord_p1[10,2],"  ",cord_p1[10,3],"  ",cord_p1[10,4],"  ",cord_p1[10,5],"  ",cord_p1[10,6],"  ",cord_p1[10,7],"  ",cord_p1[10,8],"  ",cord_p1[10,9],"  ",cord_p1[10,10],"                                                                10 ",cord_p2[10,1],"  ",cord_p2[10,2],"  ",cord_p2[10,3],"  ",cord_p2[10,4],"  ",cord_p2[10,5],"  ",cord_p2[10,6],"  ",cord_p2[10,7],"  ",cord_p2[10,8],"  ",cord_p2[10,9],"  ",cord_p2[10,10],"")
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

//- Procedimento contendo os dois campos com a seta indicativa para
//------------- o 2º jogador (cordenadas) --------------------------
PROCEDIMENTO campo_p2()

INICIO
   ESCREVAL
   ESCREVAL(topo)
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL ("       Campo: ",player1,"                                                                                        Campo: ",player2)
   ESCREVAL
   ESCREVAL ("                                      COLUNA                                                                                         COLUNA")
   ESCREVAL ("                                    (vertical)                                                                                     (vertical)")
   ESCREVAL
   ESCREVAL ("                            1  2  3  4  5  6  7  8  9  10                                                                  1  2  3  4  5  6  7  8  9  10")
   ESCREVAL ("                         1  ",cord_p1[1,1],"  ",cord_p1[1,2],"  ",cord_p1[1,3],"  ",cord_p1[1,4],"  ",cord_p1[1,5],"  ",cord_p1[1,6],"  ",cord_p1[1,7],"  ",cord_p1[1,8],"  ",cord_p1[1,9],"  ",cord_p1[1,10],"                                                                1  ",cord_p2[1,1],"  ",cord_p2[1,2],"  ",cord_p2[1,3],"  ",cord_p2[1,4],"  ",cord_p2[1,5],"  ",cord_p2[1,6],"  ",cord_p2[1,7],"  ",cord_p2[1,8],"  ",cord_p2[1,9],"  ",cord_p2[1,10],"")
   ESCREVAL ("                         2  ",cord_p1[2,1],"  ",cord_p1[2,2],"  ",cord_p1[2,3],"  ",cord_p1[2,4],"  ",cord_p1[2,5],"  ",cord_p1[2,6],"  ",cord_p1[2,7],"  ",cord_p1[2,8],"  ",cord_p1[2,9],"  ",cord_p1[2,10],"                             785                                2  ",cord_p2[2,1],"  ",cord_p2[2,2],"  ",cord_p2[2,3],"  ",cord_p2[2,4],"  ",cord_p2[2,5],"  ",cord_p2[2,6],"  ",cord_p2[2,7],"  ",cord_p2[2,8],"  ",cord_p2[2,9],"  ",cord_p2[2,10],"")
   ESCREVAL ("                         3  ",cord_p1[3,1],"  ",cord_p1[3,2],"  ",cord_p1[3,3],"  ",cord_p1[3,4],"  ",cord_p1[3,5],"  ",cord_p1[3,6],"  ",cord_p1[3,7],"  ",cord_p1[3,8],"  ",cord_p1[3,9],"  ",cord_p1[3,10],"                             78889                              3  ",cord_p2[3,1],"  ",cord_p2[3,2],"  ",cord_p2[3,3],"  ",cord_p2[3,4],"  ",cord_p2[3,5],"  ",cord_p2[3,6],"  ",cord_p2[3,7],"  ",cord_p2[3,8],"  ",cord_p2[3,9],"  ",cord_p2[3,10],"")
   ESCREVAL ("                         4  ",cord_p1[4,1],"  ",cord_p1[4,2],"  ",cord_p1[4,3],"  ",cord_p1[4,4],"  ",cord_p1[4,5],"  ",cord_p1[4,6],"  ",cord_p1[4,7],"  ",cord_p1[4,8],"  ",cord_p1[4,9],"  ",cord_p1[4,10],"                  7777777777728888887                           4  ",cord_p2[4,1],"  ",cord_p2[4,2],"  ",cord_p2[4,3],"  ",cord_p2[4,4],"  ",cord_p2[4,5],"  ",cord_p2[4,6],"  ",cord_p2[4,7],"  ",cord_p2[4,8],"  ",cord_p2[4,9],"  ",cord_p2[4,10],"")
   ESCREVAL ("              LINHA      5  ",cord_p1[5,1],"  ",cord_p1[5,2],"  ",cord_p1[5,3],"  ",cord_p1[5,4],"  ",cord_p1[5,5],"  ",cord_p1[5,6],"  ",cord_p1[5,7],"  ",cord_p1[5,8],"  ",cord_p1[5,9],"  ",cord_p1[5,10],"                7888888888888888888880               LINHA      5  ",cord_p2[5,1],"  ",cord_p2[5,2],"  ",cord_p2[5,3],"  ",cord_p2[5,4],"  ",cord_p2[5,5],"  ",cord_p2[5,6],"  ",cord_p2[5,7],"  ",cord_p2[5,8],"  ",cord_p2[5,9],"  ",cord_p2[5,10],"")
   ESCREVAL ("           (horizontal)  6  ",cord_p1[6,1],"  ",cord_p1[6,2],"  ",cord_p1[6,3],"  ",cord_p1[6,4],"  ",cord_p1[6,5],"  ",cord_p1[6,6],"  ",cord_p1[6,7],"  ",cord_p1[6,8],"  ",cord_p1[6,9],"  ",cord_p1[6,10],"                7888888888888888888884            (horizontal)  6  ",cord_p2[6,1],"  ",cord_p2[6,2],"  ",cord_p2[6,3],"  ",cord_p2[6,4],"  ",cord_p2[6,5],"  ",cord_p2[6,6],"  ",cord_p2[6,7],"  ",cord_p2[6,8],"  ",cord_p2[6,9],"  ",cord_p2[6,10],"")
   ESCREVAL ("                         7  ",cord_p1[7,1],"  ",cord_p1[7,2],"  ",cord_p1[7,3],"  ",cord_p1[7,4],"  ",cord_p1[7,5],"  ",cord_p1[7,6],"  ",cord_p1[7,7],"  ",cord_p1[7,8],"  ",cord_p1[7,9],"  ",cord_p1[7,10],"                  7777777777728888887                           7  ",cord_p2[7,1],"  ",cord_p2[7,2],"  ",cord_p2[7,3],"  ",cord_p2[7,4],"  ",cord_p2[7,5],"  ",cord_p2[7,6],"  ",cord_p2[7,7],"  ",cord_p2[7,8],"  ",cord_p2[7,9],"  ",cord_p2[7,10],"")
   ESCREVAL ("                         8  ",cord_p1[8,1],"  ",cord_p1[8,2],"  ",cord_p1[8,3],"  ",cord_p1[8,4],"  ",cord_p1[8,5],"  ",cord_p1[8,6],"  ",cord_p1[8,7],"  ",cord_p1[8,8],"  ",cord_p1[8,9],"  ",cord_p1[8,10],"                             78884                              8  ",cord_p2[8,1],"  ",cord_p2[8,2],"  ",cord_p2[8,3],"  ",cord_p2[8,4],"  ",cord_p2[8,5],"  ",cord_p2[8,6],"  ",cord_p2[8,7],"  ",cord_p2[8,8],"  ",cord_p2[8,9],"  ",cord_p2[8,10],"")
   ESCREVAL ("                         9  ",cord_p1[9,1],"  ",cord_p1[9,2],"  ",cord_p1[9,3],"  ",cord_p1[9,4],"  ",cord_p1[9,5],"  ",cord_p1[9,6],"  ",cord_p1[9,7],"  ",cord_p1[9,8],"  ",cord_p1[9,9],"  ",cord_p1[9,10],"                             782                                9  ",cord_p2[9,1],"  ",cord_p2[9,2],"  ",cord_p2[9,3],"  ",cord_p2[9,4],"  ",cord_p2[9,5],"  ",cord_p2[9,6],"  ",cord_p2[9,7],"  ",cord_p2[9,8],"  ",cord_p2[9,9],"  ",cord_p2[9,10],"")
   ESCREVAL ("                         10 ",cord_p1[10,1],"  ",cord_p1[10,2],"  ",cord_p1[10,3],"  ",cord_p1[10,4],"  ",cord_p1[10,5],"  ",cord_p1[10,6],"  ",cord_p1[10,7],"  ",cord_p1[10,8],"  ",cord_p1[10,9],"  ",cord_p1[10,10],"                                                                10 ",cord_p2[10,1],"  ",cord_p2[10,2],"  ",cord_p2[10,3],"  ",cord_p2[10,4],"  ",cord_p2[10,5],"  ",cord_p2[10,6],"  ",cord_p2[10,7],"  ",cord_p2[10,8],"  ",cord_p2[10,9],"  ",cord_p2[10,10],"")
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

//- Procedimento contendo os dois campos com a seta indicativa para
//---------------- o 1º jogador (tiro) -----------------------------
PROCEDIMENTO campo_tiro_p1()

INICIO
   ESCREVAL
   ESCREVAL(topo)
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL ("       Campo: ",player1,"                                                                                        Campo: ",player2)
   ESCREVAL
   ESCREVAL ("                                      COLUNA                                                                                         COLUNA")
   ESCREVAL ("                                    (vertical)                                                                                     (vertical)")
   ESCREVAL
   ESCREVAL ("                            1  2  3  4  5  6  7  8  9  10                                                                  1  2  3  4  5  6  7  8  9  10")
   ESCREVAL ("                         1  ",tiro_p1[1,1],"  ",tiro_p1[1,2],"  ",tiro_p1[1,3],"  ",tiro_p1[1,4],"  ",tiro_p1[1,5],"  ",tiro_p1[1,6],"  ",tiro_p1[1,7],"  ",tiro_p1[1,8],"  ",tiro_p1[1,9],"  ",tiro_p1[1,10],"                                                                1  ",tiro_p2[1,1],"  ",tiro_p2[1,2],"  ",tiro_p2[1,3],"  ",tiro_p2[1,4],"  ",tiro_p2[1,5],"  ",tiro_p2[1,6],"  ",tiro_p2[1,7],"  ",tiro_p2[1,8],"  ",tiro_p2[1,9],"  ",tiro_p2[1,10],"")
   ESCREVAL ("                         2  ",tiro_p1[2,1],"  ",tiro_p1[2,2],"  ",tiro_p1[2,3],"  ",tiro_p1[2,4],"  ",tiro_p1[2,5],"  ",tiro_p1[2,6],"  ",tiro_p1[2,7],"  ",tiro_p1[2,8],"  ",tiro_p1[2,9],"  ",tiro_p1[2,10],"                       587                                      2  ",tiro_p2[2,1],"  ",tiro_p2[2,2],"  ",tiro_p2[2,3],"  ",tiro_p2[2,4],"  ",tiro_p2[2,5],"  ",tiro_p2[2,6],"  ",tiro_p2[2,7],"  ",tiro_p2[2,8],"  ",tiro_p2[2,9],"  ",tiro_p2[2,10],"")
   ESCREVAL ("                         3  ",tiro_p1[3,1],"  ",tiro_p1[3,2],"  ",tiro_p1[3,3],"  ",tiro_p1[3,4],"  ",tiro_p1[3,5],"  ",tiro_p1[3,6],"  ",tiro_p1[3,7],"  ",tiro_p1[3,8],"  ",tiro_p1[3,9],"  ",tiro_p1[3,10],"                     9888                                       3  ",tiro_p2[3,1],"  ",tiro_p2[3,2],"  ",tiro_p2[3,3],"  ",tiro_p2[3,4],"  ",tiro_p2[3,5],"  ",tiro_p2[3,6],"  ",tiro_p2[3,7],"  ",tiro_p2[3,8],"  ",tiro_p2[3,9],"  ",tiro_p2[3,10],"")
   ESCREVAL ("                         4  ",tiro_p1[4,1],"  ",tiro_p1[4,2],"  ",tiro_p1[4,3],"  ",tiro_p1[4,4],"  ",tiro_p1[4,5],"  ",tiro_p1[4,6],"  ",tiro_p1[4,7],"  ",tiro_p1[4,8],"  ",tiro_p1[4,9],"  ",tiro_p1[4,10],"                  7888888277777777777                           4  ",tiro_p2[4,1],"  ",tiro_p2[4,2],"  ",tiro_p2[4,3],"  ",tiro_p2[4,4],"  ",tiro_p2[4,5],"  ",tiro_p2[4,6],"  ",tiro_p2[4,7],"  ",tiro_p2[4,8],"  ",tiro_p2[4,9],"  ",tiro_p2[4,10],"")
   ESCREVAL ("              LINHA      5  ",tiro_p1[5,1],"  ",tiro_p1[5,2],"  ",tiro_p1[5,3],"  ",tiro_p1[5,4],"  ",tiro_p1[5,5],"  ",tiro_p1[5,6],"  ",tiro_p1[5,7],"  ",tiro_p1[5,8],"  ",tiro_p1[5,9],"  ",tiro_p1[5,10],"                0888888888888888888887               LINHA      5  ",tiro_p2[5,1],"  ",tiro_p2[5,2],"  ",tiro_p2[5,3],"  ",tiro_p2[5,4],"  ",tiro_p2[5,5],"  ",tiro_p2[5,6],"  ",tiro_p2[5,7],"  ",tiro_p2[5,8],"  ",tiro_p2[5,9],"  ",tiro_p2[5,10],"")
   ESCREVAL ("           (horizontal)  6  ",tiro_p1[6,1],"  ",tiro_p1[6,2],"  ",tiro_p1[6,3],"  ",tiro_p1[6,4],"  ",tiro_p1[6,5],"  ",tiro_p1[6,6],"  ",tiro_p1[6,7],"  ",tiro_p1[6,8],"  ",tiro_p1[6,9],"  ",tiro_p1[6,10],"                9888888888888888888887            (horizontal)  6  ",tiro_p2[6,1],"  ",tiro_p2[6,2],"  ",tiro_p2[6,3],"  ",tiro_p2[6,4],"  ",tiro_p2[6,5],"  ",tiro_p2[6,6],"  ",tiro_p2[6,7],"  ",tiro_p2[6,8],"  ",tiro_p2[6,9],"  ",tiro_p2[6,10],"")
   ESCREVAL ("                         7  ",tiro_p1[7,1],"  ",tiro_p1[7,2],"  ",tiro_p1[7,3],"  ",tiro_p1[7,4],"  ",tiro_p1[7,5],"  ",tiro_p1[7,6],"  ",tiro_p1[7,7],"  ",tiro_p1[7,8],"  ",tiro_p1[7,9],"  ",tiro_p1[7,10],"                  7888888277777777777                           7  ",tiro_p2[7,1],"  ",tiro_p2[7,2],"  ",tiro_p2[7,3],"  ",tiro_p2[7,4],"  ",tiro_p2[7,5],"  ",tiro_p2[7,6],"  ",tiro_p2[7,7],"  ",tiro_p2[7,8],"  ",tiro_p2[7,9],"  ",tiro_p2[7,10],"")
   ESCREVAL ("                         8  ",tiro_p1[8,1],"  ",tiro_p1[8,2],"  ",tiro_p1[8,3],"  ",tiro_p1[8,4],"  ",tiro_p1[8,5],"  ",tiro_p1[8,6],"  ",tiro_p1[8,7],"  ",tiro_p1[8,8],"  ",tiro_p1[8,9],"  ",tiro_p1[8,10],"                     08887                                      8  ",tiro_p2[8,1],"  ",tiro_p2[8,2],"  ",tiro_p2[8,3],"  ",tiro_p2[8,4],"  ",tiro_p2[8,5],"  ",tiro_p2[8,6],"  ",tiro_p2[8,7],"  ",tiro_p2[8,8],"  ",tiro_p2[8,9],"  ",tiro_p2[8,10],"")
   ESCREVAL ("                         9  ",tiro_p1[9,1],"  ",tiro_p1[9,2],"  ",tiro_p1[9,3],"  ",tiro_p1[9,4],"  ",tiro_p1[9,5],"  ",tiro_p1[9,6],"  ",tiro_p1[9,7],"  ",tiro_p1[9,8],"  ",tiro_p1[9,9],"  ",tiro_p1[9,10],"                       287                                      9  ",tiro_p2[9,1],"  ",tiro_p2[9,2],"  ",tiro_p2[9,3],"  ",tiro_p2[9,4],"  ",tiro_p2[9,5],"  ",tiro_p2[9,6],"  ",tiro_p2[9,7],"  ",tiro_p2[9,8],"  ",tiro_p2[9,9],"  ",tiro_p2[9,10],"")
   ESCREVAL ("                         10 ",tiro_p1[10,1],"  ",tiro_p1[10,2],"  ",tiro_p1[10,3],"  ",tiro_p1[10,4],"  ",tiro_p1[10,5],"  ",tiro_p1[10,6],"  ",tiro_p1[10,7],"  ",tiro_p1[10,8],"  ",tiro_p1[10,9],"  ",tiro_p1[10,10],"                                                                10 ",tiro_p2[10,1],"  ",tiro_p2[10,2],"  ",tiro_p2[10,3],"  ",tiro_p2[10,4],"  ",tiro_p2[10,5],"  ",cord_p2[10,6],"  ",tiro_p2[10,7],"  ",tiro_p2[10,8],"  ",tiro_p2[10,9],"  ",tiro_p2[10,10],"")
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

//- Procedimento contendo os dois campos com a seta indicativa para
//---------------- o 2º jogador (tiro) -----------------------------
PROCEDIMENTO campo_tiro_p2()

INICIO
   ESCREVAL
   ESCREVAL(topo)
   ESCREVAL
   ESCREVAL
   ESCREVAL
   ESCREVAL ("       Campo: ",player1,"                                                                                        Campo: ",player2)
   ESCREVAL
   ESCREVAL ("                                      COLUNA                                                                                         COLUNA")
   ESCREVAL ("                                    (vertical)                                                                                     (vertical)")
   ESCREVAL
   ESCREVAL ("                            1  2  3  4  5  6  7  8  9  10                                                                  1  2  3  4  5  6  7  8  9  10")
   ESCREVAL ("                         1  ",tiro_p1[1,1],"  ",tiro_p1[1,2],"  ",tiro_p1[1,3],"  ",tiro_p1[1,4],"  ",tiro_p1[1,5],"  ",tiro_p1[1,6],"  ",tiro_p1[1,7],"  ",tiro_p1[1,8],"  ",tiro_p1[1,9],"  ",tiro_p1[1,10],"                                                                1  ",tiro_p2[1,1],"  ",tiro_p2[1,2],"  ",tiro_p2[1,3],"  ",tiro_p2[1,4],"  ",tiro_p2[1,5],"  ",tiro_p2[1,6],"  ",tiro_p2[1,7],"  ",tiro_p2[1,8],"  ",tiro_p2[1,9],"  ",tiro_p2[1,10],"")
   ESCREVAL ("                         2  ",tiro_p1[2,1],"  ",tiro_p1[2,2],"  ",tiro_p1[2,3],"  ",tiro_p1[2,4],"  ",tiro_p1[2,5],"  ",tiro_p1[2,6],"  ",tiro_p1[2,7],"  ",tiro_p1[2,8],"  ",tiro_p1[2,9],"  ",tiro_p1[2,10],"                             785                                2  ",tiro_p2[2,1],"  ",tiro_p2[2,2],"  ",tiro_p2[2,3],"  ",tiro_p2[2,4],"  ",tiro_p2[2,5],"  ",tiro_p2[2,6],"  ",tiro_p2[2,7],"  ",tiro_p2[2,8],"  ",tiro_p2[2,9],"  ",tiro_p2[2,10],"")
   ESCREVAL ("                         3  ",tiro_p1[3,1],"  ",tiro_p1[3,2],"  ",tiro_p1[3,3],"  ",tiro_p1[3,4],"  ",tiro_p1[3,5],"  ",tiro_p1[3,6],"  ",tiro_p1[3,7],"  ",tiro_p1[3,8],"  ",tiro_p1[3,9],"  ",tiro_p1[3,10],"                             78889                              3  ",tiro_p2[3,1],"  ",tiro_p2[3,2],"  ",tiro_p2[3,3],"  ",tiro_p2[3,4],"  ",tiro_p2[3,5],"  ",tiro_p2[3,6],"  ",tiro_p2[3,7],"  ",tiro_p2[3,8],"  ",tiro_p2[3,9],"  ",tiro_p2[3,10],"")
   ESCREVAL ("                         4  ",tiro_p1[4,1],"  ",tiro_p1[4,2],"  ",tiro_p1[4,3],"  ",tiro_p1[4,4],"  ",tiro_p1[4,5],"  ",tiro_p1[4,6],"  ",tiro_p1[4,7],"  ",tiro_p1[4,8],"  ",tiro_p1[4,9],"  ",tiro_p1[4,10],"                  7777777777728888887                           4  ",tiro_p2[4,1],"  ",tiro_p2[4,2],"  ",tiro_p2[4,3],"  ",tiro_p2[4,4],"  ",tiro_p2[4,5],"  ",tiro_p2[4,6],"  ",tiro_p2[4,7],"  ",tiro_p2[4,8],"  ",tiro_p2[4,9],"  ",tiro_p2[4,10],"")
   ESCREVAL ("              LINHA      5  ",tiro_p1[5,1],"  ",tiro_p1[5,2],"  ",tiro_p1[5,3],"  ",tiro_p1[5,4],"  ",tiro_p1[5,5],"  ",tiro_p1[5,6],"  ",tiro_p1[5,7],"  ",tiro_p1[5,8],"  ",tiro_p1[5,9],"  ",tiro_p1[5,10],"                7888888888888888888880               LINHA      5  ",tiro_p2[5,1],"  ",tiro_p2[5,2],"  ",tiro_p2[5,3],"  ",tiro_p2[5,4],"  ",tiro_p2[5,5],"  ",tiro_p2[5,6],"  ",tiro_p2[5,7],"  ",tiro_p2[5,8],"  ",tiro_p2[5,9],"  ",tiro_p2[5,10],"")
   ESCREVAL ("           (horizontal)  6  ",tiro_p1[6,1],"  ",tiro_p1[6,2],"  ",tiro_p1[6,3],"  ",tiro_p1[6,4],"  ",tiro_p1[6,5],"  ",tiro_p1[6,6],"  ",tiro_p1[6,7],"  ",tiro_p1[6,8],"  ",tiro_p1[6,9],"  ",tiro_p1[6,10],"                7888888888888888888884            (horizontal)  6  ",tiro_p2[6,1],"  ",tiro_p2[6,2],"  ",tiro_p2[6,3],"  ",tiro_p2[6,4],"  ",tiro_p2[6,5],"  ",tiro_p2[6,6],"  ",tiro_p2[6,7],"  ",tiro_p2[6,8],"  ",tiro_p2[6,9],"  ",tiro_p2[6,10],"")
   ESCREVAL ("                         7  ",tiro_p1[7,1],"  ",tiro_p1[7,2],"  ",tiro_p1[7,3],"  ",tiro_p1[7,4],"  ",tiro_p1[7,5],"  ",tiro_p1[7,6],"  ",tiro_p1[7,7],"  ",tiro_p1[7,8],"  ",tiro_p1[7,9],"  ",tiro_p1[7,10],"                  7777777777728888887                           7  ",tiro_p2[7,1],"  ",tiro_p2[7,2],"  ",tiro_p2[7,3],"  ",tiro_p2[7,4],"  ",tiro_p2[7,5],"  ",tiro_p2[7,6],"  ",tiro_p2[7,7],"  ",tiro_p2[7,8],"  ",tiro_p2[7,9],"  ",tiro_p2[7,10],"")
   ESCREVAL ("                         8  ",tiro_p1[8,1],"  ",tiro_p1[8,2],"  ",tiro_p1[8,3],"  ",tiro_p1[8,4],"  ",tiro_p1[8,5],"  ",tiro_p1[8,6],"  ",tiro_p1[8,7],"  ",tiro_p1[8,8],"  ",tiro_p1[8,9],"  ",tiro_p1[8,10],"                             78884                              8  ",tiro_p2[8,1],"  ",tiro_p2[8,2],"  ",tiro_p2[8,3],"  ",tiro_p2[8,4],"  ",tiro_p2[8,5],"  ",tiro_p2[8,6],"  ",tiro_p2[8,7],"  ",tiro_p2[8,8],"  ",tiro_p2[8,9],"  ",tiro_p2[8,10],"")
   ESCREVAL ("                         9  ",tiro_p1[9,1],"  ",tiro_p1[9,2],"  ",tiro_p1[9,3],"  ",tiro_p1[9,4],"  ",tiro_p1[9,5],"  ",tiro_p1[9,6],"  ",tiro_p1[9,7],"  ",tiro_p1[9,8],"  ",tiro_p1[9,9],"  ",tiro_p1[9,10],"                             782                                9  ",tiro_p2[9,1],"  ",tiro_p2[9,2],"  ",tiro_p2[9,3],"  ",tiro_p2[9,4],"  ",tiro_p2[9,5],"  ",tiro_p2[9,6],"  ",tiro_p2[9,7],"  ",tiro_p2[9,8],"  ",tiro_p2[9,9],"  ",tiro_p2[9,10],"")
   ESCREVAL ("                         10 ",tiro_p1[10,1],"  ",tiro_p1[10,2],"  ",tiro_p1[10,3],"  ",tiro_p1[10,4],"  ",tiro_p1[10,5],"  ",tiro_p1[10,6],"  ",tiro_p1[10,7],"  ",tiro_p1[10,8],"  ",tiro_p1[10,9],"  ",tiro_p1[10,10],"                                                                10 ",tiro_p2[10,1],"  ",tiro_p2[10,2],"  ",tiro_p2[10,3],"  ",tiro_p2[10,4],"  ",tiro_p2[10,5],"  ",tiro_p2[10,6],"  ",tiro_p2[10,7],"  ",tiro_p2[10,8],"  ",tiro_p2[10,9],"  ",tiro_p2[10,10],"")
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

//-- Procedimento contendo a entrada de cordenadas do 1º jogador ---
PROCEDIMENTO ent_cord_p1()
INICIO
   // Entrada de posicionamento
   ESCREVA ("             Posicionamento (1 = Horizontal | 2 = Vertical): ")
   LEIA (dir)
   // Verifica se 1 ou 2 foram digitados
   SE (dir > 2) OU (dir < 1) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  ("                                                         -Erro: Digite 1 ou 2 para o posicionamento!-")
         ESCREVAL
         ESCREVAL
         ESCREVA  ("             Posicionamento (1 = Horizontal | 2 = Vertical): ")
         LEIA (dir)
      ATE (dir = 1) OU (dir = 2)
   FIMSE // Fim da verificação

   // Entrada de linha
   ESCREVA ("             Linha: ")
   LEIA (linha)

   // Verifica se a linha foi informada entre 1 E 10
   SE (linha < 1) OU (linha >= 11) OU (linha = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  ("                                                         -Erro: Digite o número da Linha de 1 a 10!-")
         ESCREVAL
         ESCREVAL
         ESCREVA  ("             Posicionamento (1 = Horizontal | 2 = Vertical): ",dir)
         ESCREVAL
         ESCREVA  ("             Linha: ")
         LEIA (linha)
      ATE ((linha >= 1) E (linha < 11)) OU (linha <> 0)
   FIMSE // Fim

   // Entrada de coluna
   ESCREVA ("             Coluna: ")
   LEIA (coluna)

   // Verifica se a coluna foi informada entre 1 e 10
   SE (coluna < 1) OU (coluna >= 11) OU (coluna = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  ("                                                         -Erro: Digite o número da Coluna de 1 a 10!-")
         ESCREVAL
         ESCREVAL
         ESCREVA  ("             Posicionamento (1 = Horizontal | 2 = Vertical): ",dir)
         ESCREVAL
         ESCREVA  ("             Linha: ", linha)
         ESCREVAL
         ESCREVA  ("             Coluna: ")
         LEIA(coluna)
      ATE ((coluna >= 1) E (coluna < 11)) OU (coluna <> 0)
   FIMSE // Fim
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

//-- Procedimento de barcos com somente uma posição, 1º jogador ----
PROCEDIMENTO ent_cord2_p1()
INICIO

   // Entrada de linha
   ESCREVA ("             Linha: ")
   LEIA (linha)

   // Verifica se a linha foi informada entre 1 e 10
   SE (linha < 1) OU (linha >= 11) OU (linha = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  ("                                                         -Erro: Digite o número da Linha DE 1 a 10!-")
         ESCREVAL
         ESCREVAL
         ESCREVA  ("             Posicionamento (1 = Horizontal | 2 = Vertical): ",dir)
         ESCREVAL
         ESCREVA  ("             Linha: ")
         LEIA (linha)
      ATE ((linha >= 1) E (linha < 11)) OU (linha <> 0)
   FIMSE // Fim

   // Entrada de coluna
   ESCREVA ("             Coluna: ")
   LEIA (coluna)

   // Verifica se a coluna foi informada entre 1 e 10
   SE (coluna < 1) OU (coluna >= 11) OU (coluna = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL(line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL("      ",player1,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
         ESCREVAL
         ESCREVAL
         ESCREVAL(line_full)
         ESCREVAL
         ESCREVA ("                                                         -Erro: Digite o número da Coluna de 1 a 10!-")
         ESCREVAL
         ESCREVAL
         ESCREVA ("             Posicionamento (1 = Horizontal | 2 = Vertical): ",dir)
         ESCREVAL
         ESCREVA ("             Linha: ", linha)
         ESCREVAL
         ESCREVA ("             Coluna: ")
         LEIA(coluna)
      ATE ((coluna >= 1) E (coluna < 11)) OU (coluna <> 0)
   FIMSE // Fim
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

PROCEDIMENTO ent_cord_p2()
INICIO
   // 2.1.Entrada das coordenadas de posicionamento do 1º jogador
   ESCREVA ("             Posicionamento (1 = Horizontal | 2 = Vertical): ")
   LEIA (dir)
   // 2.2.Verifica SE 1 OU 2 foram digitados
   SE (dir > 2) OU (dir < 1) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  ("                                                         -Erro: Digite 1 ou 2 para o posicionamento!-")
         ESCREVAL
         ESCREVAL
         ESCREVA  ("             Posicionamento (1 = Horizontal | 2 = Vertical): ")
         LEIA (dir)
      ATE (dir = 1) OU (dir = 2)
   FIMSE // 2.2.Fim

   // 2.3.Entrada das coordenadas DE linha do 1º jogador
   ESCREVA ("             Linha: ")
   LEIA (linha)

   // 2.4.Verifica SE a linha foi informada entre 1 E 10
   SE (linha < 1) OU (linha >= 11) OU (linha = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  ("                                                         -Erro: Digite o número da Linha de 1 a 10!-")
         ESCREVAL
         ESCREVAL
         ESCREVA  ("             Posicionamento (1 = Horizontal | 2 = Vertical): ",dir)
         ESCREVAL
         ESCREVA  ("             Linha: ")
         LEIA (linha)
      ATE ((linha >= 1) E (linha < 11)) OU (linha <> 0)
   FIMSE // 2.4.Fim

   // 2.5.Entrada das coordenadas DE coluna do 1º jogador
   ESCREVA ("             Coluna: ")
   LEIA (coluna)

   // 2.6.Verifica SE a coluna foi informada entre 1 E 10
   SE (coluna < 1) OU (coluna >= 11) OU (coluna = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  ("                                                         -Erro: Digite o número da Coluna de 1 a 10!-")
         ESCREVAL
         ESCREVAL
         ESCREVA  ("             Posicionamento (1 = Horizontal | 2 = Vertical): ",dir)
         ESCREVAL
         ESCREVA  ("             Linha: ", linha)
         ESCREVAL
         ESCREVA  ("             Coluna: ")
         LEIA(coluna)
      ATE ((coluna >= 1) E (coluna < 11)) OU (coluna <> 0)
   FIMSE // 2.6.Fim
FIMPROCEDIMENTO

// 3.PROCEDIMENTO Barcos com somente uma posição, 1º jogador
PROCEDIMENTO ent_cord2_p2()
INICIO

   // 3.1.Entrada das coordenadas de linha do 1º jogador
   ESCREVA ("             Linha: ")
   LEIA (linha)

   // 3.2.Verifica SE a linha foi informada entre 1 E 10
   SE (linha < 1) OU (linha >= 11) OU (linha = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  ("                                                         -Erro: Digite o número da Linha de 1 a 10!-")
         ESCREVAL
         ESCREVAL
         ESCREVA  ("             Posicionamento (1 = Horizontal | 2 = Vertical): ",dir)
         ESCREVAL
         ESCREVA  ("             Linha: ")
         LEIA (linha)
      ATE ((linha >= 1) E (linha < 11)) OU (linha <> 0)
   FIMSE // 3.2.Fim

   // 3.3.Entrada das coordenadas DE coluna do 1º jogador
   ESCREVA ("             Coluna: ")
   LEIA (coluna)

   // 3.4.Verifica SE a coluna foi informada entre 1 E 10
   SE (coluna < 1) OU (coluna >= 11) OU (coluna = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL(line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL("      ",player2,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
         ESCREVAL
         ESCREVAL
         ESCREVAL(line_full)
         ESCREVAL
         ESCREVA ("                                                         -Erro: Digite o número da Coluna de 1 a 10!-")
         ESCREVAL
         ESCREVAL
         ESCREVA ("             Posicionamento (1 = Horizontal | 2 = Vertical): ",dir)
         ESCREVAL
         ESCREVA ("             Linha: ", linha)
         ESCREVAL
         ESCREVA ("             Coluna: ")
         LEIA(coluna)
      ATE ((coluna >= 1) E (coluna < 11)) OU (coluna <> 0)
   FIMSE // 3.4.Fim
FIMPROCEDIMENTO

PROCEDIMENTO ent_auto()
INICIO

   ALEATORIO ON
   ALEATORIO 1,2
   LEIA(dir)
   LIMPATELA
   ALEATORIO OFF

FIMPROCEDIMENTO

// 3.PROCEDIMENTO Barcos com somente uma posição, 1º jogador
PROCEDIMENTO ent_cord2_p1Auto()
INICIO
   ALEATORIO ON
   ALEATORIO 1,10
   LEIA(linha)
   LIMPATELA
   ALEATORIO OFF

   ALEATORIO ON
   ALEATORIO 1,10
   LEIA(coluna)
   LIMPATELA
   ALEATORIO OFF
FIMPROCEDIMENTO

PROCEDIMENTO linhaAuto()
INICIO
   ALEATORIO 1,10
   LEIA(linha)
   LIMPATELA
   SE (linha >= 11) ENTAO
      REPITA
         ALEATORIO 1,10
         LEIA(linha)
      ATE (linha <= 10)
   FIMSE
   ALEATORIO OFF
FIMPROCEDIMENTO

PROCEDIMENTO colunaAuto()
INICIO
   ALEATORIO 1,10
   LEIA(coluna)
   LIMPATELA
   SE (coluna >= 11) ENTAO
      REPITA
         ALEATORIO 1,10
         LEIA(coluna)
      ATE (coluna <= 10)
   FIMSE
   ALEATORIO OFF
FIMPROCEDIMENTO


// 4.Tela com informações DE Tutorial
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
   ESCREVAL("          inimigos e garantir seu tesouro! Mas antes disso, é preciso encontrá-los.                        / /   \______\  \______\   \______\")
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
FIMPROCEDIMENTO

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
FIMPROCEDIMENTO

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
FIMPROCEDIMENTO

PROCEDIMENTO barcosVs()

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
   ESCREVA ("                            ", player1)
   ESCREVA ("                                                                                                      ", player2)
   ESCREVAL
   ESCREVAL
   ESCREVAL
FIMPROCEDIMENTO

//------------------------------------------------------------------
//                      Fim (PROCEDIMENTOS)
//------------------------------------------------------------------

INICIO
   // 5.Linha completa PARA dar formato ao cabeçalho E rodapés das telas
   line_full <- "      _________________________________________________________________________________________________________________________________________________________")

   // 6.Tela inicial
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
   LEIA (enter)
   LIMPATELA // 6.Fim

   // 7.Declaração do topo que SErá utilizado nas telas
   topo <- "                                                                           O Holandês Voador"

   // 8.Verifica se o jogador quer ver as instruções antes DE jogar
   ENQUANTO ((resp <> "s") OU (resp <> "S")) E ((resp <> "n") OU (resp <> "N")) FACA
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
      LEIA (resp)
      LIMPATELA
   FIMENQUANTO // 8.Fim

   // 9.Mostra o tutorial caso o jogador queira vê-lo E coleta o nome dos jogadores
   SE (resp = "s") OU (resp = "S") ENTAO
      ESCREVAL (line_full)
      tutorial()
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL
      ESCREVA ("       Entre com o nome do primeiro jogador e aperte Enter: ")
      LEIA (player1)

      // 9.1.Verifica se o nome não está vazio
      SE (player1 = "") ENTAO
         REPITA
            LIMPATELA
            ESCREVAL (line_full)
            tutorial()
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL ("                                                         -Erro: Você não digitou o nome do primeiro jogador!-")
            ESCREVAL
            ESCREVA ("       Entre com o nome do primeiro jogador e aperte Enter: ")
            LEIA (player1)
         ATE (player1 <> "")
      FIMSE // 9.1.Fim

      LIMPATELA
      ESCREVAL (line_full)
      tutorial()
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL
      ESCREVA  ("       Entre com o nome do segundo jogador e aperte Enter: ")
      LEIA (player2)

      REPITA
         SE (player2 = player1) ENTAO
            REPITA
               LIMPATELA
               ESCREVAL (line_full)
               tutorial()
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL ("                                                         -Erro: Digite um nome diferente do primeiro jogador!-")
               ESCREVAL
               ESCREVA  ("       Entre com o nome do segundo jogador e aperte Enter: ")
               LEIA (player2)
            ATE (player2 <> player1)
         SENAO
            SE (player2 = "") ENTAO
               REPITA
                  LIMPATELA
                  ESCREVAL (line_full)
                  tutorial()
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL ("                                                         -Erro: Você não digitou o nome do segundo jogador!-")
                  ESCREVAL
                  ESCREVA  ("       Entre com o nome do segundo jogador e aperte Enter: ")
                  LEIA (player2)
               ATE (player2 <> "")
            FIMSE
         FIMSE
      ATE (player2 <> "") E (player2 <> player1)

      LIMPATELA
      ESCREVAL (line_full)
      barcosVS()
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL
      ESCREVAL ("                                                                         Pressione Enter!")
      LEIA (enter)
      LIMPATELA
   FIMSE

   novamente <- "s"
   ENQUANTO (novamente = "s") FACA
      SE ((resp = "n") OU (resp = "N")) E (novamente = "s") ENTAO
         ESCREVAL (line_full)
         barcop1()
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL
         ESCREVA  ("       Entre com o nome do primeiro jogador e aperte Enter: ")
         LEIA (player1)

         SE (player1 = "") ENTAO
            REPITA
               LIMPATELA
               ESCREVAL (line_full)
               barcop1()
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL ("                                                         -Erro: Você não digitou o nome do primeiro jogador!-")
               ESCREVAL
               ESCREVA  ("       Entre com o nome do primeiro jogador e aperte Enter: ")
               LEIA (player1)
            ATE (player1 <> "")
         FIMSE

         LIMPATELA
         ESCREVAL (line_full)
         barcop2()
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL
         ESCREVA ("       Entre com o nome do segundo jogador e aperte Enter: ")
         LEIA (player2)

         REPITA
            SE (player2 = player1) ENTAO
               REPITA
                  LIMPATELA
                  ESCREVAL (line_full)
                  barcop2()
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL ("                                                         -Erro: Digite um nome diferente do primeiro jogador!-")
                  ESCREVAL
                  ESCREVA ("       Entre com o nome do segundo jogador e aperte Enter: ")
                  LEIA (player2)
               ATE (player2 <> player1)
            SENAO
               SE (player2 = "") ENTAO
                  REPITA
                     LIMPATELA
                     ESCREVAL (line_full)
                     barcop2()
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                                         -Erro: Você não digitou o nome do segundo jogador!-")
                     ESCREVAL
                     ESCREVA ("       Entre com o nome do segundo jogador e aperte Enter: ")
                     LEIA (player2)
                  ATE (player2 <> "")
               FIMSE
            FIMSE
         ATE (player2 <> "") E (player2 <> player1)

         LIMPATELA
         ESCREVAL (line_full)
         barcosVs()
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL
         ESCREVAL ("                                                                         Pressione Enter!")
         LEIA (enter)
         LIMPATELA
      FIMSE

      // Preenchimento da matriz
      PARA i DE 1 ATE 10 FACA
         PARA j DE 1 ATE 10 FACA
            cord_p1[i,j] <- "~"
            tiro_p1[i,j] <- "~"
            cord_p2[i,j] <- "~"
            tiro_p2[i,j] <- "~"
         FIMPARA
      FIMPARA

      // Inínio do jogo
      // Player 1
      LIMPATELA
      ESCREVAL (line_full)
      campo_p1()
      ESCREVAL
      ESCREVAL
      ESCREVAL ("       ",player1,", é chegado o momento...")
      ESCREVAL
      ESCREVAL
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL("                                                              Para começar a batalha, pressione Enter!")
      ESCREVAL
      LEIA (enter)

      ENQUANTO ((auto <> "s") OU (auto <> "S")) E ((auto <> "n") OU (auto <> "N")) FACA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("       ",player1,", Gostaria de setar os barcos automaticamente?")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL("                                                                                 <S/N>")
         ESCREVAL
         LEIA (auto)
      FIMENQUANTO

      SE (auto = "S") OU (auto = "s")  ENTAO
         // Barco Octavius
         // PARA que define a quantidade DE barcos
         PARA i DE 1 ATE 1 FACA
            ent_auto()
            SE (dir = 1) ENTAO
               ALEATORIO ON
               ALEATORIO 1,5
               LEIA(coluna)
               LIMPATELA

               linhaAuto()
            SENAO
               ALEATORIO ON
               ALEATORIO 1,5
               LEIA(linha)
               LIMPATELA

               colunaAuto()
            FIMSE

            cord_p1[linha,coluna] <- "#"

            SE (dir = 1)ENTAO
               PARA i DE 1 ATE 5 FACA
                  coluna <- coluna + 1
                  cord_p1[linha,coluna] <- "#"
               FIMPARA
            SENAO
               SE (dir = 2)ENTAO
                  PARA i DE 1 ATE 5 FACA
                     linha <- linha + 1
                     cord_p1[linha,coluna] <- "#"
                  FIMPARA
               FIMSE
            FIMSE
         FIMPARA // Fim barco Octavius

         // Barcos World Discoverer (x2)
         PARA i DE 1 ATE 2 FACA
            ent_auto()
            SE (dir = 1) ENTAO
               ALEATORIO ON
               ALEATORIO 1,6
               LEIA(coluna)
               LIMPATELA

               linhaAuto()
            SENAO
               ALEATORIO ON
               ALEATORIO 1,6
               LEIA(linha)
               LIMPATELA

               colunaAuto()
            FIMSE

            SE (cord_p1[linha,coluna] = "#") ENTAO
               REPITA
                  ent_auto()
                  SE (dir = 1) ENTAO
                     ALEATORIO ON
                     ALEATORIO 1,6
                     LEIA(coluna)
                     LIMPATELA

                     linhaAuto()
                  SENAO
                     ALEATORIO ON
                     ALEATORIO 1,6
                     LEIA(linha)
                     LIMPATELA

                     colunaAuto()
                  FIMSE
               ATE (cord_p1[linha,coluna] <> "")
            FIMSE

            SE (dir = 1) ENTAO
               posicaoBarco <- 0
               ENQUANTO (posicaoBarco = 0) FACA
                  //i <- 0
                  temErro <- 0

                  PARA i DE 1 ATE 4 FACA
                     SE (cord_p1[linha,coluna + i] = "#") ENTAO
                        temErro <- 1
                     FIMSE
                  FIMPARA

                  SE(temErro > 0) ENTAO
                     ent_auto()
                     SE (dir = 1) ENTAO
                        ALEATORIO ON
                        ALEATORIO 1,6
                        LEIA(coluna)
                        LIMPATELA

                        linhaAuto()
                     SENAO
                        ALEATORIO ON
                        ALEATORIO 1,6
                        LEIA(linha)
                        LIMPATELA

                        colunaAuto()
                     FIMSE
                  SENAO
                     PARA i DE 1 ATE 4 FACA
                        cord_p1[linha,coluna] <- "#"
                        cord_p1[linha,coluna + i] <- "#"
                        posicaoBarco <- 1
                     FIMPARA
                  FIMSE
               FIMENQUANTO
            SENAO
               SE (dir = 2) ENTAO
                  posicaoBarco <- 0
                  ENQUANTO posicaoBarco = 0 FACA
                     //i <- 0
                     temErro <- 0

                     PARA i DE 1 ATE 4 FACA
                        SE(cord_p1[linha + i,coluna] = "#") ENTAO
                           temErro <- 1
                        FIMSE
                     FIMPARA

                     SE(temErro > 0) ENTAO
                        ent_auto()
                        SE (dir = 1) ENTAO
                           ALEATORIO ON
                           ALEATORIO 1,6
                           LEIA(coluna)
                           LIMPATELA

                           linhaAuto()
                        SENAO
                           ALEATORIO ON
                           ALEATORIO 1,6
                           LEIA(linha)
                           LIMPATELA

                           colunaAuto()
                        FIMSE
                     SENAO
                        PARA i DE 1 ATE 4 FACA
                           cord_p1[linha,coluna] <- "#"
                           cord_p1[linha + i,coluna] <- "#"
                           posicaoBarco <- 1
                        FIMPARA
                     FIMSE
                  FIMENQUANTO
               FIMSE
            FIMSE
         FIMPARA // Fim barcos World Discoverer

         // Barcos SS America (x3)
         PARA i DE 1 ATE 3 FACA
            ent_auto()
            SE (dir = 1) ENTAO
               ALEATORIO ON
               ALEATORIO 1,8
               LEIA(coluna)
               LIMPATELA

               linhaAuto()
            SENAO
               ALEATORIO ON
               ALEATORIO 1,8
               LEIA(linha)
               LIMPATELA

               colunaAuto()
            FIMSE

            SE (cord_p1[linha,coluna] = "#") ENTAO
               REPITA
                  ent_auto()
                  SE (dir = 1) ENTAO
                     ALEATORIO ON
                     ALEATORIO 1,8
                     LEIA(coluna)
                     LIMPATELA

                     linhaAuto()
                  SENAO
                     ALEATORIO ON
                     ALEATORIO 1,8
                     LEIA(linha)
                     LIMPATELA

                     colunaAuto()
                  FIMSE
               ATE (cord_p1[linha,coluna] <> "")
            FIMSE

            SE (dir = 1) ENTAO
               posicaoBarco <- 0
               ENQUANTO posicaoBarco = 0 FACA
                  //i <- 0
                  temErro <- 0

                  PARA i DE 1 ATE 2 FACA
                     SE(cord_p1[linha,coluna + i] = "#") ENTAO
                        temErro <- 1
                     FIMSE
                  FIMPARA

                  SE(temErro > 0) ENTAO
                     ent_auto()
                     SE (dir = 1) ENTAO
                        ALEATORIO ON
                        ALEATORIO 1,8
                        LEIA(coluna)
                        LIMPATELA

                        linhaAuto()
                     SENAO
                        ALEATORIO ON
                        ALEATORIO 1,8
                        LEIA(linha)
                        LIMPATELA

                        colunaAuto()
                     FIMSE
                  SENAO
                     PARA i DE 1 ATE 2 FACA
                        cord_p1[linha,coluna] <- "#"
                        cord_p1[linha,coluna + i] <- "#"
                        posicaoBarco <- 1
                     FIMPARA
                  FIMSE
               FIMENQUANTO
            SENAO
               SE (dir = 2) ENTAO
                  posicaoBarco <- 0
                  ENQUANTO posicaoBarco = 0 FACA
                     //i <- 0
                     temErro <- 0

                     PARA i DE 1 ATE 2 FACA
                        SE(cord_p1[linha + i,coluna] = "#") ENTAO
                           temErro <- 1
                        FIMSE
                     FIMPARA

                     SE(temErro > 0) ENTAO
                        ent_auto()
                        SE (dir = 1) ENTAO
                           ALEATORIO ON
                           ALEATORIO 1,8
                           LEIA(coluna)
                           LIMPATELA

                           linhaAuto()
                        SENAO
                           ALEATORIO ON
                           ALEATORIO 1,8
                           LEIA(linha)
                           LIMPATELA

                           colunaAuto()
                        FIMSE
                     SENAO
                        PARA i DE 1 ATE 2 FACA
                           cord_p1[linha,coluna] <- "#"
                           cord_p1[linha + i,coluna] <- "#"
                           posicaoBarco <- 1
                        FIMPARA
                     FIMSE
                  FIMENQUANTO
               FIMSE
            FIMSE
         FIMPARA // Fim barcos SS America

         //##########################################################
         //         Fim do setamento AUTOMATICO do 1º jogador
         //##########################################################

         // Barcos Dimitrius (x4)
         PARA i DE 1 ATE 4 FACA
            ALEATORIO ON
            ALEATORIO 1,10
            LEIA(linha)
            LIMPATELA
            SE (linha >= 11) ENTAO
               REPITA
                  ALEATORIO 1,10
                  LEIA(linha)
               ATE (linha <= 10)
            FIMSE

            colunaAuto()

            cord_p1[linha,coluna] <- "#"

            SE (cord_p1[linha,coluna] = "#") ENTAO
               REPITA
                  ALEATORIO ON
                  ALEATORIO 1,10
                  LEIA(linha)
                  LIMPATELA
                  SE (linha >= 11) ENTAO
                     REPITA
                        ALEATORIO 1,10
                        LEIA(linha)
                     ATE (linha <= 10)
                  FIMSE

                  colunaAuto()

                  cord_p1[linha,coluna] <- "#"

               ATE (cord_p1[linha,coluna] <> "")
            FIMSE
         FIMPARA

         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL("      ",player1,", barcos setados automaticamente")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL("                                                                           Pressione Enter!")
         LEIA (enter)
         LIMPATELA
         INTERROMPA
      SENAO
         // Manual
         // Barco Octavius
         // PARA que define a quantidade DE barcos
         PARA i DE 1 ATE 1 FACA
            LIMPATELA
            ESCREVAL (line_full)
            campo_p1()
            ESCREVAL
            ESCREVAL
            ESCREVAL("      ",player1,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
            ESCREVAL
            ESCREVAL
            ESCREVAL(line_full)
            ESCREVAL
            ESCREVAL("                                                                  *Digite as coordenadas E aperte Enter!*")
            ESCREVAL
            ESCREVAL
            ent_cord_p1()
            LIMPATELA
            SE (((dir = 1) E (coluna >= 6)) OU ((dir = 2) E (linha >= 6))) ENTAO
               REPITA
                  ESCREVAL (line_full)
                  campo_p1()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player1,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL ("                                                         -Erro: você posicionOU o barco fora da arena, tente novamente-")
                  ESCREVAL
                  ent_cord_p1()
                  LIMPATELA
               ATE (((dir = 1) E (coluna <= 5)) OU ((dir = 2) E (linha <= 5)))
            FIMSE
            SE (cord_p1[linha,coluna] = "#") ENTAO
               REPITA
                  ESCREVAL (line_full)
                  campo_p1()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player1,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL ("                                                         -Erro: você já posicionOU um barco nessa posição, tente OUtra-")
                  ESCREVAL
                  ESCREVAL
                  ent_cord_p1()
                  LIMPATELA
               ATE (cord_p1[linha,coluna] <> "")
            FIMSE

            //cord_p1[linha,coluna] <- "#"

            SE (dir = 1)ENTAO
               PARA i DE 1 ATE 5 FACA
                  cord_p1[linha,coluna] <- "#"
                  coluna <- coluna + 1
                  cord_p1[linha,coluna] <- "#"
               FIMPARA
            SENAO
               SE (dir = 2)ENTAO
                  PARA i DE 1 ATE 5 FACA
                     cord_p1[linha,coluna] <- "#"
                     linha <- linha + 1
                     cord_p1[linha,coluna] <- "#"
                  FIMPARA
               FIMSE
            FIMSE


            ESCREVAL (line_full)
            campo_p1()
            SE (i > 1) ENTAO
               ESCREVAL
               ESCREVAL
               ESCREVAL ("      ",player1,", barco Octavius posicionado!")
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL("                                                                           Pressione Enter!")
               ESCREVAL
               LEIA (enter)
               LIMPATELA
               INTERROMPA
            FIMSE
         FIMPARA // Fim barco Octavius

         // Barcos World Discoverer (x2)
         PARA i DE 1 ATE 2 FACA
            LIMPATELA
            ESCREVAL (line_full)
            campo_p1()
            ESCREVAL
            ESCREVAL
            ESCREVAL ("       ",player1,", dê as coordenadas das posições dos barcos World Discoverer (x2) (Com 5 posições)...")
            ESCREVAL
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL("                                                                  *Digite as coordenadas E aperte Enter!*")
            ESCREVAL
            ESCREVAL
            ent_cord_p1()
            LIMPATELA
            SE (((dir = 1) E (coluna >= 7)) OU ((dir = 2) E (linha >= 7))) ENTAO
               REPITA
                  ESCREVAL (line_full)
                  campo_p1()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("       ",player1,", dê as coordenadas das posições dos barcos World Discoverer (x2) (Com 5 posições)...")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL ("                                                         -Erro: você posicionOU um barco fora da arena, tente novamente-")
                  ESCREVAL
                  ESCREVAL
                  ent_cord_p1()
                  LIMPATELA
               ATE (((dir = 1) E (coluna <= 6)) OU ((dir = 2) E (linha <= 6)))
            FIMSE

            SE (cord_p1[linha,coluna] = "#") ENTAO
               REPITA
                  ESCREVAL (line_full)
                  campo_p1()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("       ",player1,", dê as coordenadas das posições dos barcos World Discoverer (x2) (Com 5 posições)...")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL ("                                                         -Erro: você já posicionOU um barco nessa posição, tente OUtra-")
                  ESCREVAL
                  ESCREVAL
                  ent_cord_p1()
                  LIMPATELA
               ATE (cord_p1[linha,coluna] <> "")
            FIMSE

            SE (dir = 1) ENTAO
               posicaoBarco <- 0
               ENQUANTO posicaoBarco = 0 FACA
                  i <- 0
                  temErro <- 0

                  PARA i DE 1 ATE 4 FACA
                     SE(cord_p1[linha,coluna + i] = "#") ENTAO
                        temErro <- 1
                     FIMSE
                  FIMPARA

                  SE(temErro > 0) ENTAO
                     LIMPATELA
                     ESCREVAL (line_full)
                     campo_p1()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("       ",player1,", dê as coordenadas das posições dos barcos World Discoverer (x2) (Com 5 posições)...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                           -Erro: você já posicionOU um barco em algumas das posições, tente novamente-")
                     ESCREVAL
                     ESCREVAL
                     ent_cord_p1()
                     LIMPATELA
                  SENAO
                     PARA i DE 1 ATE 4 FACA
                        cord_p1[linha,coluna] <- "#"
                        cord_p1[linha,coluna + i] <- "#"
                        posicaoBarco <- 1
                     FIMPARA
                  FIMSE
               FIMENQUANTO
            SENAO
               SE (dir = 2) ENTAO
                  posicaoBarco <- 0
                  ENQUANTO posicaoBarco = 0 FACA
                     i <- 0
                     temErro <- 0

                     PARA i DE 1 ATE 4 FACA
                        SE(cord_p1[linha + i,coluna] = "#") ENTAO
                           temErro <- 1
                        FIMSE
                     FIMPARA

                     SE(temErro > 0) ENTAO
                        LIMPATELA
                        ESCREVAL (line_full)
                        campo_p1()
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL ("       ",player1,", dê as coordenadas das posições dos barcos World Discoverer (x2) (Com 5 posições)...")
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL (line_full)
                        ESCREVAL
                        ESCREVAL ("                                           -Erro: você já posicionOU um barco em algumas das posições, tente novamente-")
                        ESCREVAL
                        ESCREVAL
                        ent_cord_p1()
                        LIMPATELA
                     SENAO
                        PARA i DE 1 ATE 4 FACA
                           cord_p1[linha,coluna] <- "#"
                           cord_p1[linha + i,coluna] <- "#"
                           posicaoBarco <- 1
                        FIMPARA
                     FIMSE
                  FIMENQUANTO
               FIMSE
            FIMSE
            SE (i = 2) ENTAO
               LIMPATELA
               ESCREVAL (line_full)
               campo_p1()
               ESCREVAL
               ESCREVAL
               ESCREVAL ("      ",player1,", barcos Discoverer posicionados!")
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL("                                                                           Pressione Enter!")
               LEIA (enter)
               LIMPATELA
               INTERROMPA
            FIMSE
         FIMPARA  // Fim barcos World Discoverer

         // Barcos SS America (x3)
         PARA i DE 1 ATE 3 FACA
            LIMPATELA
            ESCREVAL (line_full)
            campo_p1()
            ESCREVAL
            ESCREVAL
            ESCREVAL ("      ",player1,", dê as coordenadas das posições dos barcos SS America (x3) (Com 3 posições)...")
            ESCREVAL
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL("                                                                  *Digite as coordenadas E aperte Enter!*")
            ESCREVAL
            ESCREVAL
            ent_cord_p1()
            LIMPATELA
            SE (((dir = 1) E (coluna >= 9)) OU ((dir = 2) E (linha >= 9))) ENTAO
               REPITA
                  ESCREVAL (line_full)
                  campo_p1()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player1,", dê as coordenadas das posições dos barcos SS America (x3) (Com 3 posições)...")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL ("                                                         -Erro: você posicionOU um barco fora da arena, tente novamente-")
                  ESCREVAL
                  ESCREVAL
                  ent_cord_p1()
                  LIMPATELA
               ATE (((dir = 1) E (coluna <= 8)) OU ((dir = 2) E (linha <= 8)))
            FIMSE

            SE (cord_p1[linha,coluna] = "#") ENTAO
               REPITA
                  ESCREVAL (line_full)
                  campo_p1()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player1,", dê as coordenadas das posições dos barcos SS America (x3) (Com 3 posições)...")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL ("                                                         -Erro: você já posicionOU um barco nessa posição, tente OUtra-")
                  ESCREVAL
                  ESCREVAL
                  ent_cord_p1()
                  LIMPATELA
               ATE (cord_p1[linha,coluna] <> "")
            FIMSE

            SE (dir = 1) ENTAO
               posicaoBarco <- 0
               ENQUANTO posicaoBarco = 0 FACA
                  i <- 0
                  temErro <- 0

                  PARA i DE 1 ATE 2 FACA
                     SE(cord_p1[linha,coluna + i] = "#") ENTAO
                        temErro <- 1
                     FIMSE
                  FIMPARA

                  SE(temErro > 0) ENTAO
                     LIMPATELA
                     ESCREVAL (line_full)
                     campo_p1()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player1,", dê as coordenadas das posições dos barcos SS America (x3) (Com 3 posições)...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                           -Erro: você já posicionOU um barco em algumas das posições, tente novamente-")
                     ESCREVAL
                     ESCREVAL
                     ent_cord_p1()
                     LIMPATELA
                  SENAO
                     PARA i DE 1 ATE 2 FACA
                        cord_p1[linha,coluna] <- "#"
                        cord_p1[linha,coluna + i] <- "#"
                        posicaoBarco <- 1
                     FIMPARA
                  FIMSE
               FIMENQUANTO
            SENAO
               SE (dir = 2) ENTAO
                  posicaoBarco <- 0
                  ENQUANTO posicaoBarco = 0 FACA
                     i <- 0
                     temErro <- 0

                     PARA i DE 1 ATE 2 FACA
                        SE(cord_p1[linha + i,coluna] = "#") ENTAO
                           temErro <- 1
                        FIMSE
                     FIMPARA

                     SE(temErro > 0) ENTAO
                        LIMPATELA
                        ESCREVAL (line_full)
                        campo_p1()
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL ("      ",player1,", dê as coordenadas das posições dos barcos SS America (x3) (Com 3 posições)...")
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL (line_full)
                        ESCREVAL
                        ESCREVAL ("                                           -Erro: você já posicionou um barco em algumas das posições, tente novamente-")
                        ESCREVAL
                        ESCREVAL
                        ent_cord_p1()
                        LIMPATELA
                     SENAO
                        PARA i DE 1 ATE 2 FACA
                           cord_p1[linha,coluna] <- "#"
                           cord_p1[linha + i,coluna] <- "#"
                           posicaoBarco <- 1
                        FIMPARA
                     FIMSE
                  FIMENQUANTO
               FIMSE
            FIMSE

            ESCREVAL (line_full)
            campo_p1()
            ESCREVAL
            ESCREVAL
            SE (i = 3) ENTAO
               ESCREVAL ("      ",player1,", barcos SS America posicionados!")
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL("                                                                           Pressione Enter!")
               LEIA (enter)
               LIMPATELA
               INTERROMPA
            FIMSE
         FIMPARA // Fim barcos SS America

         // Barcos Dimitrius (x4)
         PARA i DE 1 ATE 4 FACA
            LIMPATELA
            ESCREVAL (line_full)
            campo_p1()
            ESCREVAL
            ESCREVAL
            ESCREVAL ("      ",player1,", dê as coordenadas das posições dos barcos Dimitrius (x4) (Com 1 posição)...")
            ESCREVAL
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL("                                                                  *Digite as coordenadas E aperte Enter!*")
            ESCREVAL
            ESCREVAL
            ent_cord2_p1()
            LIMPATELA
            SE (linha >= 11) OU (coluna >= 11) ENTAO
               REPITA
                  ESCREVAL (line_full)
                  campo_p1()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player1,", dê as coordenadas das posições dos barcos Dimitrius (x4) (Com 1 posição)...")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL ("                                                         -Erro: você posicionOU um barco fora da arena, tente novamente-")
                  ESCREVAL
                  ESCREVAL
                  ent_cord2_p1()
                  LIMPATELA
               ATE (linha <= 10) E (coluna <= 10)
            FIMSE
            SE (cord_p1[linha,coluna] = "#") ENTAO
               REPITA
                  ESCREVAL (line_full)
                  campo_p1()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player1,", dê as coordenadas das posições dos barcos Dimitrius (x4) (Com 1 posição)...")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL ("                                                         -Erro: você já posicionOU um barco nessa posição, tente OUtra-")
                  ESCREVAL
                  ESCREVAL
                  ent_cord2_p1()
                  LIMPATELA
               ATE (cord_p1[linha,coluna] <> "")
            FIMSE
            cord_p1[linha,coluna] <- "#"

            ESCREVAL (line_full)
            campo_p1()
            ESCREVAL
            ESCREVAL
            SE (i = 4) ENTAO
               ESCREVAL ("      ",player1,", barcos Dimitrius posicionados!")
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL("                                                                           Pressione Enter!")
               LEIA (enter)
               LIMPATELA
               INTERROMPA
            FIMSE
         FIMPARA // Fim barcos Dimitrius
         // Fim player 1

         //##########################################################
         //         Fim do setamento MANUAL do 1º jogador
         //##########################################################

         // Início jogada Player 2
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("       ",player2,", é chegado o momento...")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL("                                                              Para dar continuidade a batalha, pressione Enter!")
         ESCREVAL
         LEIA (enter)

         ENQUANTO ((auto <> "s") OU (auto <> "S")) E ((auto <> "n") OU (auto <> "N")) FACA
            LIMPATELA
            ESCREVAL (line_full)
            campo_p2()
            ESCREVAL
            ESCREVAL
            ESCREVAL ("       ",player2,", Gostaria de setar os barcos automaticamente?")
            ESCREVAL
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL("                                                                                 <S/N>")
            ESCREVAL
            LEIA (auto)
         FIMENQUANTO

         SE (auto = "S") OU (auto = "s")  ENTAO
            // Barco Octavius
            // PARA que define a quantidade DE barcos
            PARA i DE 1 ATE 1 FACA
               ent_auto()
               SE (dir = 1) ENTAO
                  ALEATORIO ON
                  ALEATORIO 1,5
                  LEIA(coluna)
                  LIMPATELA

                  linhaAuto()
               SENAO
                  ALEATORIO ON
                  ALEATORIO 1,5
                  LEIA(linha)
                  LIMPATELA

                  colunaAuto()
               FIMSE

               cord_p2[linha,coluna] <- "#"

               SE (dir = 1)ENTAO
                  PARA i DE 1 ATE 5 FACA
                     coluna <- coluna + 1
                     cord_p2[linha,coluna] <- "#"
                  FIMPARA
               SENAO
                  SE (dir = 2)ENTAO
                     PARA i DE 1 ATE 5 FACA
                        linha <- linha + 1
                        cord_p2[linha,coluna] <- "#"
                     FIMPARA
                  FIMSE
               FIMSE
            FIMPARA // Fim barco Octavius

            // Barcos World Discoverer (x2)
            PARA i DE 1 ATE 2 FACA
               ent_auto()
               SE (dir = 1) ENTAO
                  ALEATORIO ON
                  ALEATORIO 1,6
                  LEIA(coluna)
                  LIMPATELA

                  linhaAuto()
               SENAO
                  ALEATORIO ON
                  ALEATORIO 1,6
                  LEIA(linha)
                  LIMPATELA

                  colunaAuto()
               FIMSE

               SE (cord_p2[linha,coluna] = "#") ENTAO
                  REPITA
                     ent_auto()
                     SE (dir = 1) ENTAO
                        ALEATORIO ON
                        ALEATORIO 1,6
                        LEIA(coluna)
                        LIMPATELA

                        linhaAuto()
                     SENAO
                        ALEATORIO ON
                        ALEATORIO 1,6
                        LEIA(linha)
                        LIMPATELA

                        colunaAuto()
                     FIMSE
                  ATE (cord_p2[linha,coluna] <> "")
               FIMSE

               SE (dir = 1) ENTAO
                  posicaoBarco <- 0
                  ENQUANTO (posicaoBarco = 0) FACA
                     //i <- 0
                     temErro <- 0

                     PARA i DE 1 ATE 4 FACA
                        SE (cord_p2[linha,coluna + i] = "#") ENTAO
                           temErro <- 1
                        FIMSE
                     FIMPARA

                     SE(temErro > 0) ENTAO
                        ent_auto()
                        SE (dir = 1) ENTAO
                           ALEATORIO ON
                           ALEATORIO 1,6
                           LEIA(coluna)
                           LIMPATELA

                           linhaAuto()
                        SENAO
                           ALEATORIO ON
                           ALEATORIO 1,6
                           LEIA(linha)
                           LIMPATELA

                           colunaAuto()
                        FIMSE
                     SENAO
                        PARA i DE 1 ATE 4 FACA
                           cord_p2[linha,coluna] <- "#"
                           cord_p2[linha,coluna + i] <- "#"
                           posicaoBarco <- 1
                        FIMPARA
                     FIMSE
                  FIMENQUANTO
               SENAO
                  SE (dir = 2) ENTAO
                     posicaoBarco <- 0
                     ENQUANTO posicaoBarco = 0 FACA
                        //i <- 0
                        temErro <- 0

                        PARA i DE 1 ATE 4 FACA
                           SE(cord_p2[linha + i,coluna] = "#") ENTAO
                              temErro <- 1
                           FIMSE
                        FIMPARA

                        SE(temErro > 0) ENTAO
                           ent_auto()
                           SE (dir = 1) ENTAO
                              ALEATORIO ON
                              ALEATORIO 1,6
                              LEIA(coluna)
                              LIMPATELA

                              linhaAuto()
                           SENAO
                              ALEATORIO ON
                              ALEATORIO 1,6
                              LEIA(linha)
                              LIMPATELA

                              colunaAuto()
                           FIMSE
                        SENAO
                           PARA i DE 1 ATE 4 FACA
                              cord_p2[linha,coluna] <- "#"
                              cord_p2[linha + i,coluna] <- "#"
                              posicaoBarco <- 1
                           FIMPARA
                        FIMSE
                     FIMENQUANTO
                  FIMSE
               FIMSE
            FIMPARA // Fim barcos World Discoverer

            // Barcos SS America (x3)
            PARA i DE 1 ATE 3 FACA
               ent_auto()
               SE (dir = 1) ENTAO
                  ALEATORIO ON
                  ALEATORIO 1,8
                  LEIA(coluna)
                  LIMPATELA

                  linhaAuto()
               SENAO
                  ALEATORIO ON
                  ALEATORIO 1,8
                  LEIA(linha)
                  LIMPATELA

                  colunaAuto()
               FIMSE

               SE (cord_p2[linha,coluna] = "#") ENTAO
                  REPITA
                     ent_auto()
                     SE (dir = 1) ENTAO
                        ALEATORIO ON
                        ALEATORIO 1,8
                        LEIA(coluna)
                        LIMPATELA

                        linhaAuto()
                     SENAO
                        ALEATORIO ON
                        ALEATORIO 1,8
                        LEIA(linha)
                        LIMPATELA

                        colunaAuto()
                     FIMSE
                  ATE (cord_p1[linha,coluna] <> "")
               FIMSE

               SE (dir = 1) ENTAO
                  posicaoBarco <- 0
                  ENQUANTO posicaoBarco = 0 FACA
                     //i <- 0
                     temErro <- 0

                     PARA i DE 1 ATE 2 FACA
                        SE(cord_p2[linha,coluna + i] = "#") ENTAO
                           temErro <- 1
                        FIMSE
                     FIMPARA

                     SE(temErro > 0) ENTAO
                        ent_auto()
                        SE (dir = 1) ENTAO
                           ALEATORIO ON
                           ALEATORIO 1,8
                           LEIA(coluna)
                           LIMPATELA

                           linhaAuto()
                        SENAO
                           ALEATORIO ON
                           ALEATORIO 1,8
                           LEIA(linha)
                           LIMPATELA

                           colunaAuto()
                        FIMSE
                     SENAO
                        PARA i DE 1 ATE 2 FACA
                           cord_p2[linha,coluna] <- "#"
                           cord_p2[linha,coluna + i] <- "#"
                           posicaoBarco <- 1
                        FIMPARA
                     FIMSE
                  FIMENQUANTO
               SENAO
                  SE (dir = 2) ENTAO
                     posicaoBarco <- 0
                     ENQUANTO posicaoBarco = 0 FACA
                        //i <- 0
                        temErro <- 0

                        PARA i DE 1 ATE 2 FACA
                           SE(cord_p2[linha + i,coluna] = "#") ENTAO
                              temErro <- 1
                           FIMSE
                        FIMPARA

                        SE(temErro > 0) ENTAO
                           ent_auto()
                           SE (dir = 1) ENTAO
                              ALEATORIO ON
                              ALEATORIO 1,8
                              LEIA(coluna)
                              LIMPATELA

                              linhaAuto()
                           SENAO
                              ALEATORIO ON
                              ALEATORIO 1,8
                              LEIA(linha)
                              LIMPATELA

                              colunaAuto()
                           FIMSE
                        SENAO
                           PARA i DE 1 ATE 2 FACA
                              cord_p2[linha,coluna] <- "#"
                              cord_p2[linha + i,coluna] <- "#"
                              posicaoBarco <- 1
                           FIMPARA
                        FIMSE
                     FIMENQUANTO
                  FIMSE
               FIMSE
            FIMPARA // Fim barcos SS America

            // Barcos Dimitrius (x4)
            PARA i DE 1 ATE 4 FACA
               ALEATORIO ON
               ALEATORIO 1,10
               LEIA(linha)
               LIMPATELA
               SE (linha >= 11) ENTAO
                  REPITA
                     ALEATORIO 1,10
                     LEIA(linha)
                  ATE (linha <= 10)
               FIMSE

               colunaAuto()

               cord_p2[linha,coluna] <- "#"

               SE (cord_p2[linha,coluna] = "#") ENTAO
                  REPITA
                     ALEATORIO ON
                     ALEATORIO 1,10
                     LEIA(linha)
                     LIMPATELA
                     SE (linha >= 11) ENTAO
                        REPITA
                           ALEATORIO 1,10
                           LEIA(linha)
                        ATE (linha <= 10)
                     FIMSE

                     colunaAuto()

                     cord_p2[linha,coluna] <- "#"

                  ATE (cord_p2[linha,coluna] <> "")
               FIMSE
            FIMPARA

            LIMPATELA
            ESCREVAL (line_full)
            campo_p2()
            ESCREVAL
            ESCREVAL
            ESCREVAL("      ",player2,", barcos setados automaticamente")
            ESCREVAL
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL("                                                                           Pressione Enter!")
            LEIA (enter)
            LIMPATELA
            INTERROMPA
         SENAO
            // Manual
            // Barco Octavius
            // PARA que define a quantidade DE barcos
            PARA i DE 1 ATE 1 FACA
               LIMPATELA
               ESCREVAL (line_full)
               campo_p2()
               ESCREVAL
               ESCREVAL
               ESCREVAL("      ",player2,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
               ESCREVAL
               ESCREVAL
               ESCREVAL(line_full)
               ESCREVAL
               ESCREVAL("                                                                  *Digite as coordenadas E aperte Enter!*")
               ESCREVAL
               ESCREVAL
               ent_cord_p2()
               LIMPATELA
               SE (((dir = 1) E (coluna >= 6)) OU ((dir = 2) E (linha >= 6))) ENTAO
                  REPITA
                     ESCREVAL (line_full)
                     campo_p2()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player2,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                                         -Erro: você posicionOU o barco fora da arena, tente novamente-")
                     ESCREVAL
                     ent_cord_p2()
                     LIMPATELA
                  ATE (((dir = 1) E (coluna <= 5)) OU ((dir = 2) E (linha <= 5)))
               FIMSE
               SE (cord_p2[linha,coluna] = "#") ENTAO
                  REPITA
                     ESCREVAL (line_full)
                     campo_p1()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player2,", dê as coordenadas das posições do barco Octavius (Com 6 posições)...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                                         -Erro: você já posicionOU um barco nessa posição, tente OUtra-")
                     ESCREVAL
                     ESCREVAL
                     ent_cord_p2()
                     LIMPATELA
                  ATE (cord_p2[linha,coluna] <> "")
               FIMSE

               //cord_p1[linha,coluna] <- "#"

               SE (dir = 1)ENTAO
                  PARA i DE 1 ATE 5 FACA
                     cord_p2[linha,coluna] <- "#"
                     coluna <- coluna + 1
                     cord_p2[linha,coluna] <- "#"
                  FIMPARA
               SENAO
                  SE (dir = 2)ENTAO
                     PARA i DE 1 ATE 5 FACA
                        cord_p2[linha,coluna] <- "#"
                        linha <- linha + 1
                        cord_p2[linha,coluna] <- "#"
                     FIMPARA
                  FIMSE
               FIMSE


               ESCREVAL (line_full)
               campo_p2()
               SE (i > 1) ENTAO
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player2,", barco Octavius posicionado!")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL("                                                                           Pressione Enter!")
                  ESCREVAL
                  LEIA (enter)
                  LIMPATELA
                  INTERROMPA
               FIMSE
            FIMPARA // Fim barco Octavius

            // Barcos World Discoverer (x2)
            PARA i DE 1 ATE 2 FACA
               LIMPATELA
               ESCREVAL (line_full)
               campo_p2()
               ESCREVAL
               ESCREVAL
               ESCREVAL ("       ",player2,", dê as coordenadas das posições dos barcos World Discoverer (x2) (Com 5 posições)...")
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL("                                                                  *Digite as coordenadas E aperte Enter!*")
               ESCREVAL
               ESCREVAL
               ent_cord_p2()
               LIMPATELA
               SE (((dir = 1) E (coluna >= 7)) OU ((dir = 2) E (linha >= 7))) ENTAO
                  REPITA
                     ESCREVAL (line_full)
                     campo_p2()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("       ",player2,", dê as coordenadas das posições dos barcos World Discoverer (x2) (Com 5 posições)...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                                         -Erro: você posicionOU um barco fora da arena, tente novamente-")
                     ESCREVAL
                     ESCREVAL
                     ent_cord_p2()
                     LIMPATELA
                  ATE (((dir = 1) E (coluna <= 6)) OU ((dir = 2) E (linha <= 6)))
               FIMSE

               SE (cord_p2[linha,coluna] = "#") ENTAO
                  REPITA
                     ESCREVAL (line_full)
                     campo_p2()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("       ",player2,", dê as coordenadas das posições dos barcos World Discoverer (x2) (Com 5 posições)...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                                         -Erro: você já posicionOU um barco nessa posição, tente OUtra-")
                     ESCREVAL
                     ESCREVAL
                     ent_cord_p2()
                     LIMPATELA
                  ATE (cord_p2[linha,coluna] <> "")
               FIMSE

               SE (dir = 1) ENTAO
                  posicaoBarco <- 0
                  ENQUANTO posicaoBarco = 0 FACA
                     i <- 0
                     temErro <- 0

                     PARA i DE 1 ATE 4 FACA
                        SE(cord_p2[linha,coluna + i] = "#") ENTAO
                           temErro <- 1
                        FIMSE
                     FIMPARA

                     SE(temErro > 0) ENTAO
                        LIMPATELA
                        ESCREVAL (line_full)
                        campo_p2()
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL ("       ",player2,", dê as coordenadas das posições dos barcos World Discoverer (x2) (Com 5 posições)...")
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL (line_full)
                        ESCREVAL
                        ESCREVAL ("                                           -Erro: você já posicionOU um barco em algumas das posições, tente novamente-")
                        ESCREVAL
                        ESCREVAL
                        ent_cord_p2()
                        LIMPATELA
                     SENAO
                        PARA i DE 1 ATE 4 FACA
                           cord_p2[linha,coluna] <- "#"
                           cord_p2[linha,coluna + i] <- "#"
                           posicaoBarco <- 1
                        FIMPARA
                     FIMSE
                  FIMENQUANTO
               SENAO
                  SE (dir = 2) ENTAO
                     posicaoBarco <- 0
                     ENQUANTO posicaoBarco = 0 FACA
                        i <- 0
                        temErro <- 0

                        PARA i DE 1 ATE 4 FACA
                           SE(cord_p2[linha + i,coluna] = "#") ENTAO
                              temErro <- 1
                           FIMSE
                        FIMPARA

                        SE(temErro > 0) ENTAO
                           LIMPATELA
                           ESCREVAL (line_full)
                           campo_p2()
                           ESCREVAL
                           ESCREVAL
                           ESCREVAL ("       ",player2,", dê as coordenadas das posições dos barcos World Discoverer (x2) (Com 5 posições)...")
                           ESCREVAL
                           ESCREVAL
                           ESCREVAL (line_full)
                           ESCREVAL
                           ESCREVAL ("                                           -Erro: você já posicionOU um barco em algumas das posições, tente novamente-")
                           ESCREVAL
                           ESCREVAL
                           ent_cord_p2()
                           LIMPATELA
                        SENAO
                           PARA i DE 1 ATE 4 FACA
                              cord_p2[linha,coluna] <- "#"
                              cord_p2[linha + i,coluna] <- "#"
                              posicaoBarco <- 1
                           FIMPARA
                        FIMSE
                     FIMENQUANTO
                  FIMSE
               FIMSE
               SE (i = 2) ENTAO
                  LIMPATELA
                  ESCREVAL (line_full)
                  campo_p2()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player2,", barcos Discoverer posicionados!")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL("                                                                           Pressione Enter!")
                  LEIA (enter)
                  LIMPATELA
                  INTERROMPA
               FIMSE
            FIMPARA  // Fim barcos World Discoverer

            // Barcos SS America (x3)
            PARA i DE 1 ATE 3 FACA
               LIMPATELA
               ESCREVAL (line_full)
               campo_p2()
               ESCREVAL
               ESCREVAL
               ESCREVAL ("      ",player2,", dê as coordenadas das posições dos barcos SS America (x3) (Com 3 posições)...")
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL("                                                                  *Digite as coordenadas E aperte Enter!*")
               ESCREVAL
               ESCREVAL
               ent_cord_p2()
               LIMPATELA
               SE (((dir = 1) E (coluna >= 9)) OU ((dir = 2) E (linha >= 9))) ENTAO
                  REPITA
                     ESCREVAL (line_full)
                     campo_p2()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player2,", dê as coordenadas das posições dos barcos SS America (x3) (Com 3 posições)...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                                         -Erro: você posicionOU um barco fora da arena, tente novamente-")
                     ESCREVAL
                     ESCREVAL
                     ent_cord_p2()
                     LIMPATELA
                  ATE (((dir = 1) E (coluna <= 8)) OU ((dir = 2) E (linha <= 8)))
               FIMSE

               SE (cord_p1[linha,coluna] = "#") ENTAO
                  REPITA
                     ESCREVAL (line_full)
                     campo_p2()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player2,", dê as coordenadas das posições dos barcos SS America (x3) (Com 3 posições)...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                                         -Erro: você já posicionOU um barco nessa posição, tente OUtra-")
                     ESCREVAL
                     ESCREVAL
                     ent_cord_p1()
                     LIMPATELA
                  ATE (cord_p2[linha,coluna] <> "")
               FIMSE

               SE (dir = 1) ENTAO
                  posicaoBarco <- 0
                  ENQUANTO posicaoBarco = 0 FACA
                     i <- 0
                     temErro <- 0

                     PARA i DE 1 ATE 2 FACA
                        SE(cord_p2[linha,coluna + i] = "#") ENTAO
                           temErro <- 1
                        FIMSE
                     FIMPARA

                     SE(temErro > 0) ENTAO
                        LIMPATELA
                        ESCREVAL (line_full)
                        campo_p2()
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL ("      ",player2,", dê as coordenadas das posições dos barcos SS America (x3) (Com 3 posições)...")
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL (line_full)
                        ESCREVAL
                        ESCREVAL ("                                           -Erro: você já posicionOU um barco em algumas das posições, tente novamente-")
                        ESCREVAL
                        ESCREVAL
                        ent_cord_p2()
                        LIMPATELA
                     SENAO
                        PARA i DE 1 ATE 2 FACA
                           cord_p2[linha,coluna] <- "#"
                           cord_p2[linha,coluna + i] <- "#"
                           posicaoBarco <- 1
                        FIMPARA
                     FIMSE
                  FIMENQUANTO
               SENAO
                  SE (dir = 2) ENTAO
                     posicaoBarco <- 0
                     ENQUANTO posicaoBarco = 0 FACA
                        i <- 0
                        temErro <- 0

                        PARA i DE 1 ATE 2 FACA
                           SE(cord_p2[linha + i,coluna] = "#") ENTAO
                              temErro <- 1
                           FIMSE
                        FIMPARA

                        SE(temErro > 0) ENTAO
                           LIMPATELA
                           ESCREVAL (line_full)
                           campo_p2()
                           ESCREVAL
                           ESCREVAL
                           ESCREVAL ("      ",player2,", dê as coordenadas das posições dos barcos SS America (x3) (Com 3 posições)...")
                           ESCREVAL
                           ESCREVAL
                           ESCREVAL (line_full)
                           ESCREVAL
                           ESCREVAL ("                                           -Erro: você já posicionOU um barco em algumas das posições, tente novamente-")
                           ESCREVAL
                           ESCREVAL
                           ent_cord_p2()
                           LIMPATELA
                        SENAO
                           PARA i DE 1 ATE 2 FACA
                              cord_p2[linha,coluna] <- "#"
                              cord_p2[linha + i,coluna] <- "#"
                              posicaoBarco <- 1
                           FIMPARA
                        FIMSE
                     FIMENQUANTO
                  FIMSE
               FIMSE

               ESCREVAL (line_full)
               campo_p2()
               ESCREVAL
               ESCREVAL
               SE (i = 3) ENTAO
                  ESCREVAL ("      ",player2,", barcos SS America posicionados!")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL("                                                                           Pressione Enter!")
                  LEIA (enter)
                  LIMPATELA
                  INTERROMPA
               FIMSE
            FIMPARA // Fim barcos SS America

            // Barcos Dimitrius (x4)
            PARA i DE 1 ATE 4 FACA
               LIMPATELA
               ESCREVAL (line_full)
               campo_p2()
               ESCREVAL
               ESCREVAL
               ESCREVAL ("      ",player2,", dê as coordenadas das posições dos barcos Dimitrius (x4) (Com 1 posição)...")
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL("                                                                  *Digite as coordenadas e aperte Enter!*")
               ESCREVAL
               ESCREVAL
               ent_cord2_p2()
               LIMPATELA
               SE (linha >= 11) OU (coluna >= 11) ENTAO
                  REPITA
                     ESCREVAL (line_full)
                     campo_p2()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player2,", dê as coordenadas das posições dos barcos Dimitrius (x4) (Com 1 posição)...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                                         -Erro: você posicionOU um barco fora da arena, tente novamente-")
                     ESCREVAL
                     ESCREVAL
                     ent_cord2_p1()
                     LIMPATELA
                  ATE (linha <= 10) E (coluna <= 10)
               FIMSE
               SE (cord_p2[linha,coluna] = "#") ENTAO
                  REPITA
                     ESCREVAL (line_full)
                     campo_p2()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player2,", dê as coordenadas das posições dos barcos Dimitrius (x4) (Com 1 posição)...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL ("                                                         -Erro: você já posicionou um barco nessa posição, tente OUtra-")
                     ESCREVAL
                     ESCREVAL
                     ent_cord2_p2()
                     LIMPATELA
                  ATE (cord_p2[linha,coluna] <> "")
               FIMSE
               cord_p2[linha,coluna] <- "#"

               ESCREVAL (line_full)
               campo_p2()
               ESCREVAL
               ESCREVAL
               SE (i = 4) ENTAO
                  ESCREVAL ("      ",player2,", barcos Dimitrius posicionados!")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL("                                                                           Pressione Enter!")
                  LEIA (enter)
                  LIMPATELA
                  INTERROMPA
               FIMSE
            FIMPARA // Fim barcos Dimitrius
            // Fim player 2

            afundou_p1 <- 0
            afundou_p2 <- 0
            tentativas_p1 <- 0
            tentativas_p2 <- 0
            pontos_p1 <- 0
            pontos_p2 <- 0

            PARA i DE 1 ATE 2 FACA
               SE (i = 1) ENTAO
                  LIMPATELA
                  ESCREVAL (line_full)
                  campo_tiro_p1()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player1,". É a hora de atacar!")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL("                                                                           Pressione Enter!")
                  LEIA (enter)
                  LIMPATELA
                  PARA i DE 1 ATE 10 FACA
                     ESCREVAL (line_full)
                     campo_tiro_p1()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player1,", informe a coordenada em que vai atirar...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVA ("Linha: ")
                     LEIA (tiro_linha)
                     ESCREVA ("Coluna: ")
                     LEIA (tiro_coluna)
                     LIMPATELA
                     SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                        REPITA
                           ESCREVAL (line_full)
                           campo_tiro_p1()
                           ESCREVAL
                           ESCREVAL
                           ESCREVAL ("      ",player1,", você atirou pra fora da arena, tente novamente.")
                           ESCREVAL
                           ESCREVAL
                           ESCREVAL (line_full)
                           ESCREVAL
                           ESCREVA ("Linha: ")
                           LEIA(tiro_linha)
                           ESCREVA ("Coluna: ")
                           LEIA(tiro_coluna)
                           LIMPATELA
                        ATE (tiro_linha<=10) E (tiro_coluna<=10)
                     FIMSE
                     SE (cord_p2[tiro_linha,tiro_coluna]="X") ENTAO
                        SE (tiro_p1[tiro_linha,tiro_coluna]="X") ENTAO
                           REPITA
                              ESCREVAL (line_full)
                              campo_tiro_p1()
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL ("      ",player1,", você já atirou nesta posição, tente OUtra.")
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL (line_full)
                              ESCREVAL
                              ESCREVA ("Linha: ")
                              LEIA (tiro_linha)
                              ESCREVA ("Coluna: ")
                              LEIA (tiro_coluna)
                              LIMPATELA
                              SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                                 REPITA
                                    ESCREVAL (line_full)
                                    campo_tiro_p1()
                                    ESCREVAL
                                    ESCREVAL
                                    ESCREVAL ("      ",player1,", você atirou pra fora da arena, tente novamente.")
                                    ESCREVAL
                                    ESCREVAL
                                    ESCREVAL (line_full)
                                    ESCREVAL
                                    ESCREVA ("Linha: ")
                                    LEIA (tiro_linha)
                                    ESCREVA ("Coluna: ")
                                    LEIA (tiro_coluna)
                                    LIMPATELA
                                 ATE (tiro_linha<=10) E (tiro_coluna<=10)
                              FIMSE
                           ATE (tiro_p1[tiro_linha,tiro_coluna]="~")
                           SE (cord_p2[tiro_linha,tiro_coluna]="~") ENTAO
                              tiro_p1[tiro_linha,tiro_coluna] <- "O"
                              tentativas_p1 <- tentativas_p1 + 1
                           SENAO
                              tiro_p1[tiro_linha,tiro_coluna] <- "X"
                              afundou_p1 <- afundou_p1 + 1
                              tentativas_p1 <- tentativas_p1 + 1
                           FIMSE
                        SENAO
                           tiro_p1[tiro_linha,tiro_coluna] <- "X"
                           afundou_p1 <- afundou_p1 + 1
                           tentativas_p1 <- tentativas_p1 + 1
                        FIMSE
                     SENAO
                        SE (tiro_p1[tiro_linha,tiro_coluna]="O") ENTAO
                           REPITA
                              ESCREVAL (line_full)
                              campo_tiro_p1()
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL ("      ",player1,", você já atirOU nesta posição, tente OUtra.")
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL (line_full)
                              ESCREVAL
                              ESCREVA ("Linha: ")
                              LEIA (tiro_linha)
                              ESCREVA ("Coluna: ")
                              LEIA (tiro_coluna)
                              LIMPATELA
                              SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                                 REPITA
                                    ESCREVAL (line_full)
                                    campo_tiro_p1()
                                    ESCREVAL
                                    ESCREVAL
                                    ESCREVAL ("      ",player1,", você atirOU pra fora da arena, tente novamente.")
                                    ESCREVAL
                                    ESCREVAL
                                    ESCREVAL (line_full)
                                    ESCREVAL
                                    ESCREVA ("Linha: ")
                                    LEIA (tiro_linha)
                                    ESCREVA ("Coluna: ")
                                    LEIA (tiro_coluna)
                                    LIMPATELA
                                 ATE (tiro_linha<=10) E (tiro_coluna<=10)
                              FIMSE
                           ATE (tiro_p1[tiro_linha,tiro_coluna]="~")
                           SE (cord_p2[tiro_linha,tiro_coluna]="X") ENTAO
                              tiro_p1[tiro_linha,tiro_coluna] <- "X"
                              tentativas_p1 <- tentativas_p1 + 1
                           SENAO
                              tiro_p1[tiro_linha,tiro_coluna] <- "O"
                              tentativas_p1 <- tentativas_p1 + 1
                           FIMSE
                        SENAO
                           tiro_p1[tiro_linha,tiro_coluna] <- "O"
                           tentativas_p1 <- tentativas_p1 + 1
                        FIMSE
                     FIMSE
                     SE (afundou_p1=5) ENTAO
                        INTERROMPA
                     FIMSE
                  FIMPARA
                  LIMPATELA
                  ESCREVAL (line_full)
                  campo_tiro_p1()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player1,", fim dos ataques!")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL("                                                                           Pressione Enter!")
                  LEIA (enter)
                  LIMPATELA

                  ESCREVAL (line_full)
                  campo_tiro_p2()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL ("      ",player2,", agora é a sua vez!")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL("                                                                           Pressione Enter!")
                  LEIA (enter)
                  LIMPATELA
               SENAO
                  PARA i DE 1 ATE 10 FACA
                     ESCREVAL (line_full)
                     campo_tiro_p2()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player2,", informe a coordenada em que vai atirar...")
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVA ("Linha: ")
                     LEIA (tiro_linha)
                     ESCREVA ("Coluna: ")
                     LEIA (tiro_coluna)
                     LIMPATELA
                     SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                        REPITA
                           ESCREVAL (line_full)
                           campo_tiro_p2()
                           ESCREVAL
                           ESCREVAL
                           ESCREVAL ("      ",player2,", você atirou pra fora da arena, tente novamente.")
                           ESCREVAL
                           ESCREVAL
                           ESCREVAL (line_full)
                           ESCREVAL
                           ESCREVA ("Linha: ")
                           LEIA (tiro_linha)
                           ESCREVA ("Coluna: ")
                           LEIA (tiro_coluna)
                           LIMPATELA
                        ATE (tiro_linha<=10) E (tiro_coluna<=10)
                     FIMSE
                     SE (cord_p1[tiro_linha,tiro_coluna]="X") ENTAO
                        SE (tiro_p2[tiro_linha,tiro_coluna]="X") ENTAO
                           REPITA
                              ESCREVAL (line_full)
                              campo_tiro_p2()
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL ("      ",player2,", você já atirOU nessa posição, tente OUtra.")
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL (line_full)
                              ESCREVAL
                              ESCREVA ("Linha: ")
                              LEIA (tiro_linha)
                              ESCREVA ("Coluna: ")
                              LEIA (tiro_coluna)
                              LIMPATELA
                              SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                                 REPITA
                                    ESCREVAL (line_full)
                                    campo_tiro_p2()
                                    ESCREVAL
                                    ESCREVAL
                                    ESCREVAL ("      ",player2,", você atirOU pra fora da arena, tente novamente.")
                                    ESCREVAL
                                    ESCREVAL
                                    ESCREVAL (line_full)
                                    ESCREVAL
                                    ESCREVA ("Linha: ")
                                    LEIA (tiro_linha)
                                    ESCREVA ("Coluna: ")
                                    LEIA (tiro_coluna)
                                    LIMPATELA
                                 ATE (tiro_linha<=10) E (tiro_coluna<=10)
                              FIMSE
                           ATE (tiro_p2[tiro_linha,tiro_coluna]="~")
                           SE (cord_p1[tiro_linha,tiro_coluna]="~") ENTAO
                              tiro_p2[tiro_linha,tiro_coluna] <- "O"
                              tentativas_p2 <- tentativas_p2 + 1
                           SENAO
                              tiro_p2[tiro_linha,tiro_coluna] <- "X"
                              afundou_p2 <- afundou_p2 + 1
                              tentativas_p2 <- tentativas_p2 + 1
                           FIMSE
                        SENAO
                           tiro_p2[tiro_linha,tiro_coluna] <- "X"
                           afundou_p2 <- afundou_p2 + 1
                           tentativas_p2 <- tentativas_p2 + 1
                        FIMSE
                     SENAO
                        SE (tiro_p2[tiro_linha,tiro_coluna]="O") ENTAO
                           REPITA
                              ESCREVAL (line_full)
                              campo_tiro_p2()
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL ("      ",player2,", você já atirOU nesta posição, tente OUtra.")
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL (line_full)
                              ESCREVAL
                              ESCREVA ("Linha: ")
                              LEIA (tiro_linha)
                              ESCREVA ("Coluna: ")
                              LEIA (tiro_coluna)
                              LIMPATELA
                              SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                                 REPITA
                                    ESCREVAL (line_full)
                                    campo_tiro_p2()
                                    ESCREVAL
                                    ESCREVAL
                                    ESCREVAL (" ",player2,", você atirOU pra fora da arena, tente novamente.")
                                    ESCREVAL
                                    ESCREVAL
                                    ESCREVAL (line_full)
                                    ESCREVAL
                                    ESCREVA ("Linha: ")
                                    LEIA (tiro_linha)
                                    ESCREVA ("Coluna: ")
                                    LEIA (tiro_coluna)
                                    LIMPATELA
                                 ATE (tiro_linha <= 10) E (tiro_coluna <= 10)
                              FIMSE
                           ATE (tiro_p2[tiro_linha,tiro_coluna]="~")
                           SE (cord_p1[tiro_linha,tiro_coluna]="X") ENTAO
                              tiro_p2[tiro_linha,tiro_coluna] <- "X"
                              tentativas_p2 <- tentativas_p2 + 1
                           SENAO
                              tiro_p2[tiro_linha,tiro_coluna] <- "O"
                              tentativas_p2 <- tentativas_p2 + 1
                           FIMSE
                        SENAO
                           tiro_p2[tiro_linha,tiro_coluna] <- "O"
                           tentativas_p2 <- tentativas_p2 + 1
                        FIMSE
                     FIMSE
                     SE (afundou_p2=5) ENTAO
                        INTERROMPA
                     FIMSE
                  FIMPARA
                  LIMPATELA
                  ESCREVAL (line_full)
                  campo_tiro_p2()
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (" ",player2,", fim dos ataques!")
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  LEIA (enter)
                  LIMPATELA
               FIMSE
            FIMPARA
            ESCREVAL (line_full)
            ESCREVAL (line_none)
            ESCREVAL (topo)
            ESCREVAL (line_none)
            ESCREVAL (line_none)
            ESCREVAL ("      ",player1," acertou",afundou_p1," barcos.")
            pontos_p1 <- (afundou_p1 * 100) / tentativas_p1
            ESCREVAL (" ",player1," seu percentual de acerto foi de",pontos_p1,"%.")
            ESCREVAL (line_none)
            ESCREVAL (line_none)
            ESCREVAL (" ",player2," acertou",afundou_p2," barcos.")
            pontos_p2 <- (afundou_p2 * 100) / tentativas_p2
            ESCREVAL (" ",player2," seu percentual de acerto foi de",pontos_p2,"%.")
            ESCREVAL (line_none)
            novamente <- "z"
            SE (pontos_p1 > pontos_p2) ENTAO
               ENQUANTO (novamente <> "s") E (novamente <> "n") FACA
                  ESCREVAL (" ",player1," venceu. Parabéns!")
                  ESCREVAL (line_none)
                  ESCREVAL (line_none)
                  ESCREVAL ("                       Desejam jogar novamente? <s/n>")
                  LEIA (novamente)
                  ESCREVAL (line_none)
                  ESCREVAL (line_full)
               FIMENQUANTO
            SENAO
               SE (pontos_p1 = pontos_p2) ENTAO
                  ENQUANTO (novamente <> "s") E (novamente <> "n") FACA
                     ESCREVAL (" Empate. Parabéns a ambos!")
                     ESCREVAL (line_none)
                     ESCREVAL (line_none)
                     ESCREVAL ("                       Desejam jogar novamente? <s/n>")
                     LEIA (novamente)
                     ESCREVAL (line_none)
                     ESCREVAL (line_full)
                  FIMENQUANTO
               SENAO
                  ENQUANTO (novamente <> "s") E (novamente <> "n") FACA
                     ESCREVAL (" ",player2," venceu. Parabéns!")
                     ESCREVAL (line_none)
                     ESCREVAL (line_none)
                     ESCREVAL ("                       Desejam jogar novamente? <s/n>")
                     LEIA (novamente)
                     ESCREVAL (line_none)
                     ESCREVAL (line_full)
                  FIMENQUANTO
               FIMSE
            FIMSE
            SE (novamente="n") ENTAO
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
               LEIA (enter)
               LIMPATELA
            FIMSE
         FIMENQUANTO
FIMALGORITMO