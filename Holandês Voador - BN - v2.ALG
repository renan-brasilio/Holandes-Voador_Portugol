algoritmo "Hol�ndes Voador - BN v2"

// Disciplina     : [L�gica de Programa��o e Algor�tmos]
// Professor      : Edson Pedro Ferlin
// Fun��o         : Simula um jogo de Batalha Naval
// Autor        : Renan Rocha
// Data de in�nio : 01/04/2017
// Data de t�rmino: 26/06/2017

//------------------------------------------------------------------
//                         VARI�VEIS
//------------------------------------------------------------------

var

   // Matrizes
   cord_p1, cord_p2, tiro_p1, tiro_p2: vetor [1..10,1..10] de caractere
   // Inteiros
   b1, b2, b3, b4, temErro, posicaoBarco, i, j, k, linha, coluna, tiro_linha, tiro_coluna, afundou_p1, afundou_p2, tentativas_p1, tentativas_p2, dir: inteiro
   // Reais
   pontos_p1, pontos_p2: real
   // Caracteres
   barcos_ref, resp, enter, line_none, line_full, topo, player1, player2, novamente, auto: caractere
   // Mensagens com repeti��o
   line: vetor [0..20] de caractere

   //------------------------------------------------------------------
   //                      Fim (VARI�VEIS)
   //------------------------------------------------------------------


   //------------------------------------------------------------------
   //                       PROCEDIMENTOS
   //------------------------------------------------------------------

PROCEDIMENTO topo_campos()

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
FIMPROCEDIMENTO


PROCEDIMENTO campo_p1()

INICIO
   topo_campos()
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
//------------- o 2� jogador (cordenadas) --------------------------
PROCEDIMENTO campo_p2()

INICIO
   topo_campos()
   ESCREVAL ("                            1  2  3  4  5  6  7  8  9  10                                                                  1  2  3  4  5  6  7  8  9  10")
   ESCREVAL ("                         1  ",tiro_p1[1,1],"  ",tiro_p1[1,2],"  ",tiro_p1[1,3],"  ",tiro_p1[1,4],"  ",tiro_p1[1,5],"  ",tiro_p1[1,6],"  ",tiro_p1[1,7],"  ",tiro_p1[1,8],"  ",cord_p1[1,9],"  ",tiro_p1[1,10],"                                                                1  ",cord_p2[1,1],"  ",cord_p2[1,2],"  ",cord_p2[1,3],"  ",cord_p2[1,4],"  ",cord_p2[1,5],"  ",cord_p2[1,6],"  ",cord_p2[1,7],"  ",cord_p2[1,8],"  ",cord_p2[1,9],"  ",cord_p2[1,10],"")
   ESCREVAL ("                         2  ",tiro_p1[2,1],"  ",tiro_p1[2,2],"  ",tiro_p1[2,3],"  ",tiro_p1[2,4],"  ",tiro_p1[2,5],"  ",tiro_p1[2,6],"  ",tiro_p1[2,7],"  ",tiro_p1[2,8],"  ",cord_p1[2,9],"  ",tiro_p1[2,10],"                             785                                2  ",cord_p2[2,1],"  ",cord_p2[2,2],"  ",cord_p2[2,3],"  ",cord_p2[2,4],"  ",cord_p2[2,5],"  ",cord_p2[2,6],"  ",cord_p2[2,7],"  ",cord_p2[2,8],"  ",cord_p2[2,9],"  ",cord_p2[2,10],"")
   ESCREVAL ("                         3  ",tiro_p1[3,1],"  ",tiro_p1[3,2],"  ",tiro_p1[3,3],"  ",tiro_p1[3,4],"  ",tiro_p1[3,5],"  ",tiro_p1[3,6],"  ",tiro_p1[3,7],"  ",tiro_p1[3,8],"  ",cord_p1[3,9],"  ",tiro_p1[3,10],"                             78889                              3  ",cord_p2[3,1],"  ",cord_p2[3,2],"  ",cord_p2[3,3],"  ",cord_p2[3,4],"  ",cord_p2[3,5],"  ",cord_p2[3,6],"  ",cord_p2[3,7],"  ",cord_p2[3,8],"  ",cord_p2[3,9],"  ",cord_p2[3,10],"")
   ESCREVAL ("                         4  ",tiro_p1[4,1],"  ",tiro_p1[4,2],"  ",tiro_p1[4,3],"  ",tiro_p1[4,4],"  ",tiro_p1[4,5],"  ",tiro_p1[4,6],"  ",tiro_p1[4,7],"  ",tiro_p1[4,8],"  ",cord_p1[4,9],"  ",tiro_p1[4,10],"                  7777777777728888887                           4  ",cord_p2[4,1],"  ",cord_p2[4,2],"  ",cord_p2[4,3],"  ",cord_p2[4,4],"  ",cord_p2[4,5],"  ",cord_p2[4,6],"  ",cord_p2[4,7],"  ",cord_p2[4,8],"  ",cord_p2[4,9],"  ",cord_p2[4,10],"")
   ESCREVAL ("              LINHA      5  ",tiro_p1[5,1],"  ",tiro_p1[5,2],"  ",tiro_p1[5,3],"  ",tiro_p1[5,4],"  ",tiro_p1[5,5],"  ",tiro_p1[5,6],"  ",tiro_p1[5,7],"  ",tiro_p1[5,8],"  ",cord_p1[5,9],"  ",tiro_p1[5,10],"                7888888888888888888880               LINHA      5  ",cord_p2[5,1],"  ",cord_p2[5,2],"  ",cord_p2[5,3],"  ",cord_p2[5,4],"  ",cord_p2[5,5],"  ",cord_p2[5,6],"  ",cord_p2[5,7],"  ",cord_p2[5,8],"  ",cord_p2[5,9],"  ",cord_p2[5,10],"")
   ESCREVAL ("           (horizontal)  6  ",tiro_p1[6,1],"  ",tiro_p1[6,2],"  ",tiro_p1[6,3],"  ",tiro_p1[6,4],"  ",tiro_p1[6,5],"  ",tiro_p1[6,6],"  ",tiro_p1[6,7],"  ",tiro_p1[6,8],"  ",cord_p1[6,9],"  ",tiro_p1[6,10],"                7888888888888888888884            (horizontal)  6  ",cord_p2[6,1],"  ",cord_p2[6,2],"  ",cord_p2[6,3],"  ",cord_p2[6,4],"  ",cord_p2[6,5],"  ",cord_p2[6,6],"  ",cord_p2[6,7],"  ",cord_p2[6,8],"  ",cord_p2[6,9],"  ",cord_p2[6,10],"")
   ESCREVAL ("                         7  ",tiro_p1[7,1],"  ",tiro_p1[7,2],"  ",tiro_p1[7,3],"  ",tiro_p1[7,4],"  ",tiro_p1[7,5],"  ",tiro_p1[7,6],"  ",tiro_p1[7,7],"  ",tiro_p1[7,8],"  ",cord_p1[7,9],"  ",tiro_p1[7,10],"                  7777777777728888887                           7  ",cord_p2[7,1],"  ",cord_p2[7,2],"  ",cord_p2[7,3],"  ",cord_p2[7,4],"  ",cord_p2[7,5],"  ",cord_p2[7,6],"  ",cord_p2[7,7],"  ",cord_p2[7,8],"  ",cord_p2[7,9],"  ",cord_p2[7,10],"")
   ESCREVAL ("                         8  ",tiro_p1[8,1],"  ",tiro_p1[8,2],"  ",tiro_p1[8,3],"  ",tiro_p1[8,4],"  ",tiro_p1[8,5],"  ",tiro_p1[8,6],"  ",tiro_p1[8,7],"  ",tiro_p1[8,8],"  ",cord_p1[8,9],"  ",tiro_p1[8,10],"                             78884                              8  ",cord_p2[8,1],"  ",cord_p2[8,2],"  ",cord_p2[8,3],"  ",cord_p2[8,4],"  ",cord_p2[8,5],"  ",cord_p2[8,6],"  ",cord_p2[8,7],"  ",cord_p2[8,8],"  ",cord_p2[8,9],"  ",cord_p2[8,10],"")
   ESCREVAL ("                         9  ",tiro_p1[9,1],"  ",tiro_p1[9,2],"  ",tiro_p1[9,3],"  ",tiro_p1[9,4],"  ",tiro_p1[9,5],"  ",tiro_p1[9,6],"  ",tiro_p1[9,7],"  ",tiro_p1[9,8],"  ",cord_p1[9,9],"  ",tiro_p1[9,10],"                             782                                9  ",cord_p2[9,1],"  ",cord_p2[9,2],"  ",cord_p2[9,3],"  ",cord_p2[9,4],"  ",cord_p2[9,5],"  ",cord_p2[9,6],"  ",cord_p2[9,7],"  ",cord_p2[9,8],"  ",cord_p2[9,9],"  ",cord_p2[9,10],"")
   ESCREVAL ("                         10 ",tiro_p1[10,1],"  ",tiro_p1[10,2],"  ",tiro_p1[10,3],"  ",tiro_p1[10,4],"  ",tiro_p1[10,5],"  ",tiro_p1[10,6],"  ",tiro_p1[10,7],"  ",tiro_p1[10,8],"  ",tiro_p1[10,9],"  ",tiro_p1[10,10],"                                                                10 ",cord_p2[10,1],"  ",cord_p2[10,2],"  ",cord_p2[10,3],"  ",cord_p2[10,4],"  ",cord_p2[10,5],"  ",cord_p2[10,6],"  ",cord_p2[10,7],"  ",cord_p2[10,8],"  ",cord_p2[10,9],"  ",cord_p2[10,10],"")
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

//- Procedimento contendo os dois campos com a seta indicativa para
//---------------- o 1� jogador (tiro) -----------------------------
PROCEDIMENTO campo_tiro_p1()

INICIO
   topo_campos()
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
//---------------- o 2� jogador (tiro) -----------------------------
PROCEDIMENTO campo_tiro_p2()

INICIO
   topo_campos()
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

//-- Procedimento contendo a entrada de cordenadas do 1� jogador ---
PROCEDIMENTO ent_cord_p1()
INICIO
   // Entrada de posicionamento
   ESCREVA (line[0])
   LEIA (dir)
   // Verifica se 1 ou 2 foram digitados
   SE (dir > 2) OU (dir < 1) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ", player1, barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  (line[3])
         ESCREVAL
         ESCREVAL
         ESCREVA  (line[0])
         LEIA (dir)
      ATE (dir = 1) OU (dir = 2)
   FIMSE // Fim da verifica��o

   // Entrada de linha
   ESCREVA (line[1])
   LEIA (linha)

   // Verifica se a linha foi informada entre 1 E 10
   SE (linha < 1) OU (linha >= 11) OU (linha = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  (line[4])
         ESCREVAL
         ESCREVAL
         ESCREVA  (line[0], dir)
         ESCREVAL
         ESCREVA  (line[1])
         LEIA (linha)
      ATE ((linha >= 1) E (linha < 11)) OU (linha <> 0)
   FIMSE // Fim

   // Entrada de coluna
   ESCREVA (line[2])
   LEIA (coluna)

   // Verifica se a coluna foi informada entre 1 e 10
   SE (coluna < 1) OU (coluna >= 11) OU (coluna = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA  (line[5])
         ESCREVAL
         ESCREVAL
         ESCREVA  (line[0], dir)
         ESCREVAL
         ESCREVA  (line[1], linha)
         ESCREVAL
         ESCREVA  (line[2])
         LEIA(coluna)
      ATE ((coluna >= 1) E (coluna < 11)) OU (coluna <> 0)
   FIMSE // Fim
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

//-- Procedimento de barcos com somente uma posi��o, 1� jogador ----
PROCEDIMENTO ent_cord2_p1()
INICIO

   // Entrada de linha
   ESCREVA (line[1])
   LEIA (linha)

   // Verifica se a linha foi informada entre 1 e 10
   SE (linha < 1) OU (linha >= 11) OU (linha = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1, barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA (line[4])
         ESCREVAL
         ESCREVAL
         ESCREVA  (line[1])
         LEIA (linha)
      ATE ((linha >= 1) E (linha < 11)) OU (linha <> 0)
   FIMSE // Fim

   // Entrada de coluna
   ESCREVA (line[2])
   LEIA (coluna)

   // Verifica se a coluna foi informada entre 1 e 10
   SE (coluna < 1) OU (coluna >= 11) OU (coluna = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL(line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL("      ",player1,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL(line_full)
         ESCREVAL
         ESCREVA (line[5])
         ESCREVAL
         ESCREVAL
         ESCREVA (line[1], linha)
         ESCREVAL
         ESCREVA (line[2])
         LEIA(coluna)
      ATE ((coluna >= 1) E (coluna < 11)) OU (coluna <> 0)
   FIMSE // Fim
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

//-- Procedimento de barcos com somente uma posi��o, 1� jogador ----
PROCEDIMENTO ent_cord3_p1()
INICIO

   // Entrada de linha
   ESCREVA (line[1])
   LEIA (tiro_linha)

   // Verifica se a linha foi informada entre 1 e 10
   SE (tiro_linha < 1) OU (tiro_linha >= 11) OU (tiro_linha = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_tiro_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA (line[4])
         ESCREVAL
         ESCREVAL
         ESCREVAL
         ESCREVA  (line[1])
         LEIA (tiro_linha)
      ATE ((tiro_linha >= 1) E (tiro_linha < 11)) OU (tiro_linha <> 0)
   FIMSE // Fim

   // Entrada de coluna
   ESCREVA (line[1])
   LEIA (tiro_coluna)

   // Verifica se a coluna foi informada entre 1 e 10
   SE (tiro_coluna < 1) OU (tiro_coluna >= 11) OU (tiro_coluna = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL(line_full)
         campo_tiro_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL("      ",player1,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL(line_full)
         ESCREVAL
         ESCREVA (line[5])
         ESCREVAL
         ESCREVAL
         ESCREVAL
         ESCREVA (line[1], tiro_linha)
         ESCREVAL
         ESCREVA (line[2])
         LEIA(tiro_coluna)
      ATE ((tiro_coluna >= 1) E (tiro_coluna < 11)) OU (tiro_coluna <> 0)
   FIMSE // Fim
FIMPROCEDIMENTO
//------------------------ Fim -------------------------------------

PROCEDIMENTO ent_cord_p2()
INICIO
   // 2.1.Entrada das coordenadas de posicionamento do 1� jogador
   ESCREVA  (line[0])
   LEIA (dir)
   // 2.2.Verifica SE 1 OU 2 foram digitados
   SE (dir > 2) OU (dir < 1) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA (line[3])
         ESCREVAL
         ESCREVAL
         ESCREVA  (line[0])
         LEIA (dir)
      ATE (dir = 1) OU (dir = 2)
   FIMSE // 2.2.Fim

   // 2.3.Entrada das coordenadas DE linha do 1� jogador
   ESCREVA (line[1])
   LEIA (linha)

   // 2.4.Verifica SE a linha foi informada entre 1 E 10
   SE (linha < 1) OU (linha >= 11) OU (linha = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2, barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA (line[4])
         ESCREVAL
         ESCREVAL
         ESCREVA  (line[0], dir)
         ESCREVAL
         ESCREVA  (line[1])
         LEIA (linha)
      ATE ((linha >= 1) E (linha < 11)) OU (linha <> 0)
   FIMSE // 2.4.Fim

   // 2.5.Entrada das coordenadas DE coluna do 1� jogador
   ESCREVA (line[2])
   LEIA (coluna)

   // 2.6.Verifica SE a coluna foi informada entre 1 E 10
   SE (coluna < 1) OU (coluna >= 11) OU (coluna = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA (line[5])
         ESCREVAL
         ESCREVAL
         ESCREVA  (line[0], dir)
         ESCREVAL
         ESCREVA  (line[1], linha)
         ESCREVAL
         ESCREVA  (line[2])
         LEIA(coluna)
      ATE ((coluna >= 1) E (coluna < 11)) OU (coluna <> 0)
   FIMSE // 2.6.Fim
FIMPROCEDIMENTO

// 3.PROCEDIMENTO Barcos com somente uma posi��o, 1� jogador
PROCEDIMENTO ent_cord2_p2()
INICIO

   // 3.1.Entrada das coordenadas de linha do 1� jogador
   ESCREVA (line[1])
   LEIA (linha)

   // 3.2.Verifica SE a linha foi informada entre 1 E 10
   SE (linha < 1) OU (linha >= 11) OU (linha = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2, barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA (line[4])
         ESCREVAL
         ESCREVAL
         ESCREVAL
         ESCREVA  (line[1])
         LEIA (linha)
      ATE ((linha >= 1) E (linha < 11)) OU (linha <> 0)
   FIMSE // 3.2.Fim

   // 3.3.Entrada das coordenadas DE coluna do 1� jogador
   ESCREVA (line[2])
   LEIA (coluna)

   // 3.4.Verifica SE a coluna foi informada entre 1 E 10
   SE (coluna < 1) OU (coluna >= 11) OU (coluna = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL(line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL("      ",player2, barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL(line_full)
         ESCREVAL
         ESCREVA (line[5])
         ESCREVAL
         ESCREVAL
         ESCREVA (line[0], dir)
         ESCREVAL
         ESCREVA (line[1], linha)
         ESCREVAL
         ESCREVA (line[2])
         LEIA(coluna)
      ATE ((coluna >= 1) E (coluna < 11)) OU (coluna <> 0)
   FIMSE // 3.4.Fim
FIMPROCEDIMENTO

PROCEDIMENTO ent_cord3_p2()
INICIO

   // 3.1.Entrada das coordenadas de linha do 1� jogador
   ESCREVA (line[1])
   LEIA (tiro_linha)

   // 3.2.Verifica SE a linha foi informada entre 1 E 10
   SE (tiro_linha < 1) OU (tiro_linha >= 11) OU (tiro_linha = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL (line_full)
         campo_tiro_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2, barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVA (line[4])
         ESCREVAL
         ESCREVAL
         ESCREVAL
         ESCREVA  (line[1])
         LEIA (tiro_linha)
      ATE ((tiro_linha >= 1) E (tiro_linha < 11)) OU (tiro_linha <> 0)
   FIMSE // 3.2.Fim

   // 3.3.Entrada das coordenadas DE coluna do 1� jogador
   ESCREVA (line[2])
   LEIA (tiro_coluna)

   // 3.4.Verifica SE a coluna foi informada entre 1 E 10
   SE (tiro_coluna < 1) OU (tiro_coluna >= 11) OU (tiro_coluna = 0) ENTAO
      REPITA
         LIMPATELA
         ESCREVAL(line_full)
         campo_tiro_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL("      ",player2, barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL(line_full)
         ESCREVAL
         ESCREVA (line[5])
         ESCREVAL
         ESCREVAL
         ESCREVA (line[1], tiro_coluna)
         ESCREVAL
         ESCREVA (line[2])
         LEIA(tiro_coluna)
      ATE ((tiro_coluna >= 1) E (tiro_coluna < 11)) OU (tiro_coluna <> 0)
   FIMSE // 3.4.Fim
FIMPROCEDIMENTO

// 4.Tela com informa��es DE Tutorial
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
   ESCREVAL("          Holand�s Voador � um jogo DE Batalha Naval e lhe colocar� em uma guerra em                           / ___!___   ___!___    ___!___")
   ESCREVAL("          que cada jogador ter� seus barcos pirata. O objetivo � destruir os piratas                          / (      (  (      (   (      (")
   ESCREVAL("          inimigos e garantir seu tesouro! Mas antes disso, � preciso encontr�-los.                        / /   \______\  \______\   \______\")
   ESCREVAL("          Ganhar� quem destruir todos os barcos piratas inimigos primeiro. No in�cio                     /  /   ____!_____ ___!______ ____!_____        _  _")
   ESCREVAL("          do jogo � necess�rio alocar os 10 barcos, com diferentes tamanhos e bolar                    /   /   /          /          /         /         \/")
   ESCREVAL("          uma estrat�gia, lembre-se bem das posi��es pois ap�s voc� terminar, ser� a                 /    /    |         ||         ||         |")
   ESCREVAL("          vez de seu advers�rio. Ap�s os barcos alocados, ser� a hora da batalha, ca-              /_____/     \         \\         \\         \")
   ESCREVAL("          da um ter� uma chance, se acertar pode continuar, se errar � a vez do ad-                      \      \_________\\_________\\_________\")
   ESCREVAL("          vers�rio. Os barcos s�o representados com #, ao acert�-lo, o mesmo ficar�                       \         |          |         |")
   ESCREVAL("          com um 'X' no local DE acerto. Crie sua estrat�gia e parta para a batalha!                       \________!__________!_________!_________/")
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

   // ------------------------------------------------------------------
   //                          In�cio do Jogo
   // ------------------------------------------------------------------

   // 5.Linha completa PARA dar formato ao cabe�alho E rodap�s das telas
   line[0] <- "             Posicionamento (1 = Horizontal | 2 = Vertical): "
   line[1] <- "             Linha: "
   line[2] <- "             Coluna: "
   line[3] <- "                                                           -Erro: Digite 1 ou 2 para o posicionamento!-"
   line[4] <- "                                                           -Erro: Digite o n�mero da Linha de 1 a 10!-"
   line[5] <- "                                                           -Erro: Digite o n�mero da Coluna de 1 a 10!-"
   line[6] <- "       Entre com o nome do primeiro jogador e aperte Enter: "
   line[7] <- "       Entre com o nome do segundo jogador e aperte Enter: "
   line[8] <- "                                                        -Erro: Voc� n�o digitou o nome do primeiro jogador!-"
   line[9] <- "                                                         -Erro: Voc� n�o digitou o nome do segundo jogador!-"
   line[10] <- "                                                                          Pressione Enter!"
   line[11] <- "                                                         -Erro: Digite um nome diferente do primeiro jogador!-"
   line[12] <- "                                                                 *Digite as coordenadas e aperte Enter!*"
   line[13] <- "                                                      -Erro: voc� posicionou o barco fora da arena, tente novamente-"
   line[14] <- "                                                      -Erro: voc� j� posicionou um barco nessa posi��o, tente outra-"
   line[15] <- "                                               -Erro: voc� j� posicionou um barco em algumas das posi��es, tente novamente-"
   line[16] <- "                                                           -Erro: voc� atirou fora da arena, tente novamente-"
   line[17] <- "                                                           -Erro: voc� j� atirou nessa posi��o, tente outra-"
   line_full <- "      _________________________________________________________________________________________________________________________________________________________")

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
   LIMPATELA
   // -----------

   // 7.Declara��o do topo que SEr� utilizado nas telas
   topo <- "                                                                           O Holand�s Voador"

   // 8.Verifica se o jogador quer ver as instru��es antes DE jogar
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
      ESCREVAL("                                                             Gostaria de ver as instru��es antes de iniciar?")
      ESCREVAL("                                                                                  <S/N>")
      LEIA (resp)
      LIMPATELA
   FIMENQUANTO // 8.Fim

   // 9.Mostra o tutorial caso o jogador queira v�-lo E coleta o nome dos jogadores
   SE (resp = "s") OU (resp = "S") ENTAO
      ESCREVAL (line_full)
      tutorial()
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL
      ESCREVA (line[6])
      LEIA (player1)

      // 9.1.Verifica se o nome n�o est� vazio
      SE (player1 = "") ENTAO
         REPITA
            LIMPATELA
            ESCREVAL (line_full)
            tutorial()
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL (line[8])
            ESCREVAL
            ESCREVA (line[6])
            LEIA (player1)
         ATE (player1 <> "")
      FIMSE // 9.1.Fim

      LIMPATELA
      ESCREVAL (line_full)
      tutorial()
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL
      ESCREVA  (line[7])
      LEIA (player2)

      REPITA
         SE (player2 = player1) ENTAO
            REPITA
               LIMPATELA
               ESCREVAL (line_full)
               tutorial()
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[11])
               ESCREVAL
               ESCREVA  (line[7])
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
                  ESCREVAL (line[9])
                  ESCREVAL
                  ESCREVA  (line[7])
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
      ESCREVAL (line[10])
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
         ESCREVA  (line[6])
         LEIA (player1)

         SE (player1 = "") ENTAO
            REPITA
               LIMPATELA
               ESCREVAL (line_full)
               barcop1()
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[8])
               ESCREVAL
               ESCREVA  (line[6])
               LEIA (player1)
            ATE (player1 <> "")
         FIMSE

         LIMPATELA
         ESCREVAL (line_full)
         barcop2()
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL
         ESCREVA (line[7])
         LEIA (player2)

         REPITA
            SE (player2 = player1) ENTAO
               REPITA
                  LIMPATELA
                  ESCREVAL (line_full)
                  barcop2()
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL (line[11])
                  ESCREVAL
                  ESCREVA (line[7])
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
                     ESCREVAL (line[9])
                     ESCREVAL
                     ESCREVA (line[7])
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
         ESCREVAL (line[10])
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

      // In�nio do jogo
      // Player 1
      LIMPATELA
      ESCREVAL (line_full)
      campo_p1()
      ESCREVAL
      ESCREVAL
      ESCREVAL ("       ",player1,", � chegado o momento...")
      ESCREVAL
      ESCREVAL
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL("                                                              Para come�ar a batalha, pressione Enter!")
      ESCREVAL
      LEIA (enter)

      // Manual
      // Barco Octavius
      // PARA que define a quantidade DE barcos
      PARA i DE 1 ATE 1 FACA
         barcos_ref <- ", d� as coordenadas das posi��es do barco Octavius (Com 6 posi��es)..."

         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL("      ",player1,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL(line_full)
         ESCREVAL
         ESCREVAL(line[12])
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
               ESCREVAL ("      ",player1,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[13])
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
               ESCREVAL ("      ",player1,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[14])
               ESCREVAL
               ESCREVAL
               ent_cord_p1()
               LIMPATELA
            ATE (cord_p1[linha,coluna] <> "")
         FIMSE

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
            ESCREVAL(line[10])
            ESCREVAL
            LEIA (enter)
            LIMPATELA
            INTERROMPA
         FIMSE
      FIMPARA // Fim barco Octavius

      // Barco World Discoverer
      PARA i DE 1 ATE 1 FACA
         barcos_ref <- ", d� as coordenadas das posi��es do barco World Discoverer (Com 5 posi��es)..."
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("       ",player1,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL(line[12])
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
               ESCREVAL ("       ",player1,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[13])
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
               ESCREVAL ("       ",player1,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[14])
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
                  ESCREVAL ("       ",player1,barcos_ref)
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL (line[15])
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
                     ESCREVAL ("       ",player1,barcos_ref)
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL (line[15])
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
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1,", barco Discoverer posicionado!")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL(line[10])
         LEIA (enter)
         LIMPATELA
         INTERROMPA
      FIMPARA  // Fim barcos World Discoverer

      // Barco SS America
      PARA i DE 1 ATE 1 FACA
         barcos_ref <- ", d� as coordenadas das posi��es do barco SS America (Com 3 posi��es)..."
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL(line[12])
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
               ESCREVAL ("      ",player1,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[13])
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
               ESCREVAL ("      ",player1,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[14])
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
                  ESCREVAL ("      ",player1,barcos_ref)
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL (line[15])
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
                     ESCREVAL ("      ",player1,barcos_ref)
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL (line[15])
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
         ESCREVAL ("      ",player1,", barco SS America posicionado!")
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL("                                                                           Pressione Enter!")
         LEIA (enter)
         LIMPATELA
         INTERROMPA
      FIMPARA // Fim barcos SS America

      // Barcos Dimitrius (x2)
      PARA i DE 1 ATE 2 FACA
         barcos_ref <- ", d� as coordenadas das posi��es dos barcos Dimitrius (x2) (Com 1 posi��o)..."
         LIMPATELA
         ESCREVAL (line_full)
         campo_p1()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player1,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL(line[12])
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
               ESCREVAL ("      ",player1,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[13])
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
               ESCREVAL ("      ",player1,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[14])
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
            ESCREVAL(line[10])
            LEIA (enter)
            LIMPATELA
            INTERROMPA
         FIMSE
      FIMPARA // Fim barcos Dimitrius
      // Fim player 1

      //##########################################################
      //         Fim do setamento do 1� jogador
      //##########################################################

      // In�cio jogada Player 2
      LIMPATELA
      ESCREVAL (line_full)
      campo_p2()
      ESCREVAL
      ESCREVAL
      ESCREVAL ("       ",player2,", � chegado o momento...")
      ESCREVAL
      ESCREVAL
      ESCREVAL (line_full)
      ESCREVAL
      ESCREVAL("                                                              Para dar continuidade a batalha, pressione Enter!")
      ESCREVAL
      LEIA (enter)

      // Manual
      // Barco Octavius
      // PARA que define a quantidade DE barcos
      PARA i DE 1 ATE 1 FACA
         barcos_ref <- ", d� as coordenadas das posi��es do barco Octavius (Com 6 posi��es)..."
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL("      ",player2,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL(line_full)
         ESCREVAL
         ESCREVAL(line[12])
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
               ESCREVAL ("      ",player2,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[13])
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
               ESCREVAL ("      ",player2,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[14])
               ESCREVAL
               ESCREVAL
               ent_cord_p2()
               LIMPATELA
            ATE (cord_p2[linha,coluna] <> "")
         FIMSE

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
            ESCREVAL(line[10])
            ESCREVAL
            LEIA (enter)
            LIMPATELA
            INTERROMPA
         FIMSE
      FIMPARA // Fim barco Octavius

      // Barcos World Discoverer (x2)
      PARA i DE 1 ATE 1 FACA
         barcos_ref <- ", d� as coordenadas das posi��es do barco World Discoverer (Com 5 posi��es)..."
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("       ",player2,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL(line[12])
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
               ESCREVAL ("       ",player2,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[13])
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
               ESCREVAL ("       ",player2,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[14])
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
                  ESCREVAL ("       ",player2,barcos_ref)
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL (line[15])
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
                     ESCREVAL ("       ",player2,barcos_ref)
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL (line[15])
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
         SE (i > 1) ENTAO
            LIMPATELA
            ESCREVAL (line_full)
            campo_p2()
            ESCREVAL
            ESCREVAL
            ESCREVAL ("      ",player2,", barco Discoverer posicionado!")
            ESCREVAL
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL(line[10])
            LEIA (enter)
            LIMPATELA
            INTERROMPA
         FIMSE
      FIMPARA  // Fim barcos World Discoverer

      // Barco SS America
      PARA i DE 1 ATE 3 FACA
         barcos_ref <- ", d� as coordenadas das posi��es do barco SS America (Com 3 posi��es)..."
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL(line[12])
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
               ESCREVAL ("      ",player2,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[13])
               ESCREVAL
               ESCREVAL
               ent_cord_p2()
               LIMPATELA
            ATE (((dir = 1) E (coluna <= 8)) OU ((dir = 2) E (linha <= 8)))
         FIMSE

         SE (cord_p2[linha,coluna] = "#") ENTAO
            REPITA
               ESCREVAL (line_full)
               campo_p2()
               ESCREVAL
               ESCREVAL
               ESCREVAL ("      ",player2,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[14])
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
                  ESCREVAL ("      ",player2,barcos_ref)
                  ESCREVAL
                  ESCREVAL
                  ESCREVAL (line_full)
                  ESCREVAL
                  ESCREVAL (line[15])
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
                     ESCREVAL ("      ",player2,barcos_ref)
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL (line[15])
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
         SE (i > 1) ENTAO
            ESCREVAL ("      ",player2,", barco SS America posicionado!")
            ESCREVAL
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL(line[10])
            LEIA (enter)
            LIMPATELA
            INTERROMPA
         FIMSE
      FIMPARA // Fim barcos SS America

      // Barcos Dimitrius (x4)
      PARA i DE 1 ATE 2 FACA
         barcos_ref <- ", d� as coordenadas das posi��es dos barcos Dimitrius (x2) (Com 1 posi��o)..."
         LIMPATELA
         ESCREVAL (line_full)
         campo_p2()
         ESCREVAL
         ESCREVAL
         ESCREVAL ("      ",player2,barcos_ref)
         ESCREVAL
         ESCREVAL
         ESCREVAL (line_full)
         ESCREVAL
         ESCREVAL(line[12])
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
               ESCREVAL ("      ",player2,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[13])
               ESCREVAL
               ESCREVAL
               ent_cord2_p2()
               LIMPATELA
            ATE (linha <= 10) E (coluna <= 10)
         FIMSE
         SE (cord_p2[linha,coluna] = "#") ENTAO
            REPITA
               ESCREVAL (line_full)
               campo_p2()
               ESCREVAL
               ESCREVAL
               ESCREVAL ("      ",player2,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL (line[14])
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
         SE (i = 2) ENTAO
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
      // ---------------------------------------------------------------

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
            ESCREVAL ("      ",player1,". � a hora de atacar!")
            ESCREVAL
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL(line[10])
            LEIA (enter)
            LIMPATELA
            PARA i DE 1 ATE 10 FACA
               barcos_ref <- ", informe a coordenada em que vai atirar..."
               ESCREVAL (line_full)
               campo_tiro_p1()
               ESCREVAL
               ESCREVAL
               ESCREVAL ("      ",player1,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ent_cord3_p1()
               LIMPATELA
               SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                  REPITA
                     ESCREVAL (line_full)
                     campo_tiro_p1()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player1,barcos_ref)
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL(line[12])
                     ESCREVAL
                     ESCREVAL
                     ent_cord3_p1()
                     LIMPATELA
                  ATE (tiro_linha<=10) E (tiro_coluna<=10)
               FIMSE
               SE (cord_p2[tiro_linha,tiro_coluna]="#") ENTAO
                  SE (tiro_p2[tiro_linha,tiro_coluna]="#") ENTAO
                     REPITA
                        ESCREVAL (line_full)
                        campo_tiro_p1()
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL ("      ",player1,barcos_ref)
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL (line_full)
                        ESCREVAL
                        ESCREVAL(line[17])
                        ESCREVAL
                        ent_cord3_p1()
                        LIMPATELA
                        SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                           REPITA
                              ESCREVAL (line_full)
                              campo_tiro_p1()
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL ("      ",player1,barcos_ref)
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL (line_full)
                              ESCREVAL
                              ESCREVAL(line[16])
                              ESCREVAL
                              ent_cord3_p1()
                              LIMPATELA
                           ATE (tiro_linha<=10) E (tiro_coluna<=10)
                        FIMSE
                     ATE (tiro_p2[tiro_linha,tiro_coluna]="~")
                     SE (cord_p2[tiro_linha,tiro_coluna]="~") ENTAO
                        tiro_p2[tiro_linha,tiro_coluna] <- "O"
                        tentativas_p1 <- tentativas_p1 + 1
                     SENAO
                        tiro_p2[tiro_linha,tiro_coluna] <- "#"
                        afundou_p1 <- afundou_p1 + 1
                        tentativas_p1 <- tentativas_p1 + 1
                     FIMSE
                  SENAO
                     tiro_p2[tiro_linha,tiro_coluna] <- "#"
                     afundou_p1 <- afundou_p1 + 1
                     tentativas_p1 <- tentativas_p1 + 1
                  FIMSE
               SENAO
                  SE (tiro_p2[tiro_linha,tiro_coluna]="O") ENTAO
                     REPITA
                        ESCREVAL (line_full)
                        campo_tiro_p1()
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL ("      ",player1,barcos_ref)
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL (line_full)
                        ESCREVAL
                        ESCREVAL(line[17])
                        ESCREVAL
                        ent_cord3_p1()
                        LIMPATELA
                        SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                           REPITA
                              ESCREVAL (line_full)
                              campo_tiro_p1()
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL ("      ",player1,barcos_ref)
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL (line_full)
                              ESCREVAL
                              ESCREVAL(line[16])
                              ESCREVAL
                              ent_cord3_p1()
                              LIMPATELA
                           ATE (tiro_linha<=10) E (tiro_coluna<=10)
                        FIMSE
                     ATE (tiro_p2[tiro_linha,tiro_coluna]="~")
                     SE (cord_p2[tiro_linha,tiro_coluna]="#") ENTAO
                        tiro_p2[tiro_linha,tiro_coluna] <- "#"
                        tentativas_p1 <- tentativas_p1 + 1
                     SENAO
                        tiro_p2[tiro_linha,tiro_coluna] <- "O"
                        tentativas_p1 <- tentativas_p1 + 1
                     FIMSE
                  SENAO
                     tiro_p2[tiro_linha,tiro_coluna] <- "O"
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
            ESCREVAL(line[10])
            LEIA (enter)
            LIMPATELA

            ESCREVAL (line_full)
            campo_tiro_p2()
            ESCREVAL
            ESCREVAL
            ESCREVAL ("      ",player2,", agora � a sua vez!")
            ESCREVAL
            ESCREVAL
            ESCREVAL (line_full)
            ESCREVAL
            ESCREVAL(line[10])
            LEIA (enter)
            LIMPATELA
         SENAO
            PARA i DE 1 ATE 10 FACA
               barcos_ref <- ", informe a coordenada em que vai atirar..."
               ESCREVAL (line_full)
               campo_tiro_p2()
               ESCREVAL
               ESCREVAL
               ESCREVAL ("      ",player2,barcos_ref)
               ESCREVAL
               ESCREVAL
               ESCREVAL (line_full)
               ESCREVAL
               ESCREVAL(line[12])
               ESCREVAL
               ESCREVAL
               ent_cord3_p2()
               LIMPATELA
               SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                  REPITA
                     ESCREVAL (line_full)
                     campo_tiro_p2()
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL ("      ",player2,barcos_ref)
                     ESCREVAL
                     ESCREVAL
                     ESCREVAL (line_full)
                     ESCREVAL
                     ESCREVAL(line[17])
                     ESCREVAL
                     ent_cord3_p2()
                     LIMPATELA
                  ATE (tiro_linha<=10) E (tiro_coluna<=10)
               FIMSE
               SE (cord_p1[tiro_linha,tiro_coluna]="#") ENTAO
                  SE (tiro_p1[tiro_linha,tiro_coluna]="#") ENTAO
                     REPITA
                        ESCREVAL (line_full)
                        campo_tiro_p2()
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL ("      ",player2,barcos_ref)
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL (line_full)
                        ESCREVAL
                        ESCREVAL(line[16])
                        ESCREVAL
                        ent_cord3_p2()
                        LIMPATELA
                        SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                           REPITA
                              ESCREVAL (line_full)
                              campo_tiro_p2()
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL ("      ",player2,barcos_ref)
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL (line_full)
                              ESCREVAL
                              ESCREVAL(line[17])
                              ESCREVAL
                              ent_cord3_p2()
                              LIMPATELA
                           ATE (tiro_linha<=10) E (tiro_coluna<=10)
                        FIMSE
                     ATE (tiro_p1[tiro_linha,tiro_coluna]="~")
                     SE (cord_p1[tiro_linha,tiro_coluna]="~") ENTAO
                        tiro_p1[tiro_linha,tiro_coluna] <- "O"
                        tentativas_p2 <- tentativas_p2 + 1
                     SENAO
                        tiro_p1[tiro_linha,tiro_coluna] <- "#"
                        afundou_p2 <- afundou_p2 + 1
                        tentativas_p2 <- tentativas_p2 + 1
                     FIMSE
                  SENAO
                     tiro_p1[tiro_linha,tiro_coluna] <- "#"
                     afundou_p2 <- afundou_p2 + 1
                     tentativas_p2 <- tentativas_p2 + 1
                  FIMSE
               SENAO
                  SE (tiro_p1[tiro_linha,tiro_coluna]="O") ENTAO
                     REPITA
                        ESCREVAL (line_full)
                        campo_tiro_p2()
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL ("      ",player2,barcos_ref)
                        ESCREVAL
                        ESCREVAL
                        ESCREVAL (line_full)
                        ESCREVAL
                        ESCREVAL(line[16])
                        ESCREVAL
                        ent_cord3_p2()
                        LIMPATELA
                        SE (tiro_linha>=11) OU (tiro_coluna>=11) ENTAO
                           REPITA
                              ESCREVAL (line_full)
                              campo_tiro_p2()
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL (" ",player2,barcos_ref)
                              ESCREVAL
                              ESCREVAL
                              ESCREVAL (line_full)
                              ESCREVAL
                              ESCREVAL(line[17])
                              ESCREVAL
                              ent_cord3_p2()
                              LIMPATELA
                           ATE (tiro_linha <= 10) E (tiro_coluna <= 10)
                        FIMSE
                     ATE (tiro_p1[tiro_linha,tiro_coluna]="~")
                     SE (cord_p1[tiro_linha,tiro_coluna]="#") ENTAO
                        tiro_p1[tiro_linha,tiro_coluna] <- "#"
                        tentativas_p2 <- tentativas_p2 + 1
                     SENAO
                        tiro_p1[tiro_linha,tiro_coluna] <- "X"
                        tentativas_p2 <- tentativas_p2 + 1
                     FIMSE
                  SENAO
                     tiro_p1[tiro_linha,tiro_coluna] <- "X"
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
      ESCREVAL ("      ",player1," seu percentual de acerto foi de",pontos_p1,"%.")
      ESCREVAL (line_none)
      ESCREVAL (line_none)
      ESCREVAL ("      ",player2," acertou",afundou_p2," barcos.")
      pontos_p2 <- (afundou_p2 * 100) / tentativas_p2
      ESCREVAL ("      ",player2," seu percentual de acerto foi de",pontos_p2,"%.")
      ESCREVAL (line_none)
      novamente <- "z"
      SE (pontos_p1 > pontos_p2) ENTAO
         ENQUANTO (novamente <> "s") E (novamente <> "n") FACA
            ESCREVAL ("      ",player1," venceu. Parab�ns!")
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
               ESCREVAL ("      Empate. Parab�ns a ambos!")
               ESCREVAL (line_none)
               ESCREVAL (line_none)
               ESCREVAL ("                       Desejam jogar novamente? <s/n>")
               LEIA (novamente)
               ESCREVAL (line_none)
               ESCREVAL (line_full)
               LIMPATELA
            FIMENQUANTO
         SENAO
            ENQUANTO (novamente <> "s") E (novamente <> "n") FACA
               ESCREVAL ("      ",player2," venceu. Parab�ns!")
               ESCREVAL (line_none)
               ESCREVAL (line_none)
               ESCREVAL ("                       Desejam jogar novamente? <s/n>")
               LEIA (novamente)
               ESCREVAL (line_none)Z
               ESCREVAL (line_full)
               LIMPATELA
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