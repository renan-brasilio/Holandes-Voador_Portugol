algoritmo "JogoVelha"
// Função : Jogo da Velha
// Autor : Andrey - andreywis@gmail.com
// Data : 02/11/2009
dos
var
   jogada:inteiro

   numeros:vetor[1..13,1..6] de caractere
   bloco:vetor[1..13,1..6] de caractere
   CONT:inteiro
   jogador1,jogador2:caractere
   turno:inteiro
   CONTINUA:logico
   jogo:vetor[1..3,1..3] de inteiro
   CONT_JOGO:inteiro
   resultado:inteiro
   msg:caractere
   sair:caractere

   procedimento mostra_tela_inicial()
   inicio
      limpatela
      escreval("|================================================================================|")
      escreval("|MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM|")
      escreval("|MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM|")
      escreval("|MMMMMMMM   MMMMM   MM  MMMMMMMMM  M        MMM  MMMMMMMM  MMMMM  MMMMMMM MMMMMMM|")
      escreval("|MMMMMMM   MMMMM   MMmM  MMMMMMM  MM  MMMMMMMMM  MMMMMMMM  MMMMM  MMMMMM   MMMMMM|")
      escreval("|MMM                 MMM  MMMMM  MMM  MMMMMMMMM  MMMMMMMM  MMMMM  MMMMM     MMMMM|")
      escreval("|MMMMM   MMMMM  MMMMMMMMM  MMM  MMMM        MMM  MMMMMMMM         MMMM  MMM  MMMM|")
      escreval("|M                 MMMMMMM  M  NMMMM  MMMMMMMMM  MMMMMMMM  MMMMM  MMM         MMM|")
      escreval("|MM   MMMMMM   MMMMMMMMMMMM   MMMMMM  MMMMMMMMM  MMMMMMMM  MMMMM  MM  MMMMMMM  MM|")
      escreval("|M   MMMMMM   MMMMMMMMMMMMMM MMMMMMM        MMM        MM  MMMMM  M  MMMMMMMMM  M|")
      escreval("|MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM|")
      escreval("|MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM|")
      escreval("|================================================================================|")
      escreval("")
      escreval("")
   fimprocedimento

   procedimento monta_jogo()
   inicio
      limpatela
      escreval("     A     B  C  D  E  F ---------------------------------- ")
      escreval("  |~~~~~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ")
      escreval("1 |",bloco[1,1] ,"|",bloco[2,1] ,"y",bloco[3,1] ,"m ",bloco[10,1])
      escreval("  |",bloco[1,2] ,"|",bloco[2,2] ,"y",bloco[3,2] ,"m ",bloco[10,2])
      escreval("2 |",bloco[1,3] ,"|",bloco[2,3] ,"y",bloco[3,3] ,"m ",bloco[10,3])
      escreval("3 |",bloco[1,4] ,"|",bloco[2,4] ,"y",bloco[3,4] ,"m ",bloco[10,4]," ",jogador1)
      escreval("3 |",bloco[1,5] ,"|",bloco[2,5] ,"y",bloco[3,5] ,"m ",bloco[10,5])
      escreval("4 |",bloco[1,6] ,"|",bloco[2,6] ,"y",bloco[3,6] ,"m ",bloco[10,6])
      escreval("4 | ------------------------------------------------- ")
      escreval(" 4",bloco[4,1] ,"|",bloco[5,1] ,"y",bloco[6,1] ,"m ",bloco[11,1])
      escreval(" 5",bloco[4,2] ,"y",bloco[5,2] ,"y",bloco[6,2] ,"m ",bloco[11,2])
      escreval(" 5",bloco[4,3] ,"y",bloco[5,3] ,"y",bloco[6,3] ,"m ",bloco[11,3])
      escreval(" |",bloco[4,4] ,"y",bloco[5,4] ,"y",bloco[6,4] ,"m ",bloco[11,4]," ",jogador2)
      escreval(" |",bloco[4,5] ,"y",bloco[5,5] ,"y",bloco[6,5] ,"m ",bloco[11,5])
      escreval(" |",bloco[4,6] ,"y",bloco[5,6] ,"y",bloco[6,6] ,"m ",bloco[11,6])
      escreval(" | .::::::::::::::h::::::::::::::::h::::::::::::::. m ")
      escreval(" m",bloco[7,1] ,"y",bloco[8,1] ,"y",bloco[9,1] ,"m ",bloco[12,1])
      escreval(" m",bloco[7,2] ,"y",bloco[8,2] ,"y",bloco[9,2] ,"m ",bloco[12,2])
      escreval(" m",bloco[7,3] ,"y",bloco[8,3] ,"y",bloco[9,3] ,"m ",bloco[12,3])
      escreval(" m",bloco[7,4] ,"y",bloco[8,4] ,"y",bloco[9,4] ,"m ",bloco[12,4])
      escreval(" m",bloco[7,5] ,"y",bloco[8,5] ,"y",bloco[9,5] ,"m ",bloco[12,5])
      escreval(" m",bloco[7,6] ,"y",bloco[8,6] ,"y",bloco[9,6] ,"m ",bloco[12,6])
      escreval(" m                .                .                m ")
      escreval(" s++++++++++++++++++++++++++++++++++++++++++++++++++s ")
   fimprocedimento
   procedimento seta_nome_jogada(nome_jogador:caractere)

   inicio
      se (resultado = 1) entao
         numeros[12,1] <- "  ........   "
         numeros[12,2] <- "  ........   "
         numeros[12,3] <- "   ......    O VENCEDOR É"
         numeros[12,4] <- "     ..      "+jogador1
         numeros[12,5] <- "     ..      "
         numeros[12,6] <- "    ....     "
         seta_bloco(12,12)
      fimse

      se (resultado = 2) entao
         numeros[12,1] <- "  ........   "
         numeros[12,2] <- "  ........   "
         numeros[12,3] <- "   ......    O VENCEDOR É"
         numeros[12,4] <- "     ..      "+jogador2
         numeros[12,5] <- "     ..      "
         numeros[12,6] <- "    ....     "
         seta_bloco(12,12)
      fimse

      se (resultado = 3) entao
         numeros[12,1] <- "    ??    ??    ";
         numeros[12,2] <- " ??????????????  DEU";
         numeros[12,3] <- "    ??    ??    ";
         numeros[12,4] <- "    ??    ??    ";
         numeros[12,5] <- " ??????????????  VELHA!";
         numeros[12,6] <- "    ??    ??    ";
         seta_bloco(12,12)
      fimse

      se (resultado = 0) entao
         numeros[12,1] <- "";
         numeros[12,2] <- "--------------------------";
         numeros[12,3] <- "Agora é a sua vez de jogar ";
         numeros[12,4] <- nome_jogador;
         numeros[12,5] <- "--------------------------";
         numeros[12,6] <- "";
         seta_bloco(12,12)
      fimse
   fimprocedimento

   funcao cpu_joga():inteiro
   var
      linha2,coluna2,i:inteiro
      retorno:inteiro
      setado:logico
   inicio
      //SE FOR A PRIMEIRA JOGADA DA CPU
      se (CONT_JOGO = 2) entao
         se (jogo[2,2] = 0) entao
            retorno <- 5
         senao
            aleatorio on
            aleatorio 1,9
               //Só passa se for diferente de 5, que é o selecionado pelo jogaror 1
               repita
                  leia(retorno)
               ate (retorno <> 5)
            aleatorio off
         fimse
      senao
         //SE FOR QUALQUER OUTRA JOGADA DA CPU
         se (setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 0) e (jogo[linha2,2] = 2) e (jogo[linha2,3] = 0) entao
                  se (linha2 = 1) entao
                     retorno <- 1
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 4
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 7
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se (setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
                se (jogo[linha2,1] = 0) e (jogo[linha2,2] = 1) e (jogo[linha2,3] = 0) entao
                  se (linha2 = 1) entao
                     retorno <- 1
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 4
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 7
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse

         se ( setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 2) e (jogo[linha2,2] = 0) e (jogo[linha2,3] = 0) entao
                  se (linha2 = 1) entao
                     retorno <- 3
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 6
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 9
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 1) e (jogo[linha2,2] = 0) e (jogo[linha2,3] = 0) entao
                  se (linha2 = 1) entao
                     retorno <- 2
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 5
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 8
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse

         se ( setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 0) e (jogo[linha2,2] = 0) e (jogo[linha2,3] = 2) entao
                  se (linha2 = 1) entao
                     retorno <- 1
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 4
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 7
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 0) e (jogo[linha2,2] = 0) e (jogo[linha2,3] = 1) entao
                  se (linha2 = 1) entao
                     retorno <- 1
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 4
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 7
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para coluna2 de 1 ate 3 faca
               se (jogo[1,coluna2] = 2) e (jogo[2,coluna2] = 0) e (jogo[3,coluna2] = 0) entao
                  se (coluna2 = 1) entao
                     retorno <- 7
                  fimse
                  se (coluna2 = 2) entao
                     retorno <- 8
                  fimse
                  se (coluna2 = 3) entao
                     retorno <- 9
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para coluna2 de 1 ate 3 faca
               se (jogo[1,coluna2] = 0) e (jogo[2,coluna2] = 0) e (jogo[3,coluna2] = 2) entao
                  se (coluna2 = 1) entao
                     retorno <- 1
                  fimse
                  se (coluna2 = 2) entao
                     retorno <- 4
                  fimse
                  se (coluna2 = 3) entao
                     retorno <- 7
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse

         se ( setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 1) e (jogo[linha2,2] = 1) e (jogo[linha2,3] = 0) entao
                  se (linha2 = 1) entao
                     retorno <- 3
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 6
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 9
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 0) e (jogo[linha2,2] = 1) e (jogo[linha2,3] = 1) entao
                  se (linha2 = 1) entao
                     retorno <- 1
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 4
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 7
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 1) e (jogo[linha2,2] = 0) e (jogo[linha2,3] = 1) entao
                  se (linha2 = 1) entao
                     retorno <- 2
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 5
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 8
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para coluna2 de 1 ate 3 faca
               se (jogo[1,coluna2] = 1) e (jogo[2,coluna2] = 1) e (jogo[3,coluna2] = 0) entao
                  se (coluna2 = 1) entao
                     retorno <- 7
                  fimse
                  se (coluna2 = 2) entao
                     retorno <- 8
                  fimse
                  se (coluna2 = 3) entao
                     retorno <- 9
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para coluna2 de 1 ate 3 faca
               se (jogo[1,coluna2] = 0) e (jogo[2,coluna2] = 1) e (jogo[3,coluna2] = 1) entao
                  se (coluna2 = 1) entao
                     retorno <- 1
                  fimse
                  se (coluna2 = 2) entao
                     retorno <- 2
                  fimse
                  se (coluna2 = 3) entao
                     retorno <- 3
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         //PRA NÃO TRAVAR
         se (jogo[1,1] = 1) e (jogo[1,2] = 0) e (jogo[1,3] = 2) entao
            retorno <- 2
            setado <- verdadeiro
         fimse
         se (jogo[2,1] = 1) e (jogo[2,2] = 0) e (jogo[2,3] = 2) entao
            retorno <- 5
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 1) e (jogo[3,2] = 0) e (jogo[3,3] = 2) entao
            retorno <- 8
            setado <- verdadeiro
         fimse

         se (jogo[1,1] = 2) e (jogo[1,2] = 0) e (jogo[1,3] = 1) entao
            retorno <- 2
            setado <- verdadeiro
         fimse
         se (jogo[2,1] = 2) e (jogo[2,2] = 0) e (jogo[2,3] = 1) entao
            retorno <- 5
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 2) e (jogo[3,2] = 0) e (jogo[3,3] = 1) entao
            retorno <- 8
            setado <- verdadeiro
         fimse


         se (jogo[1,1] = 1) e (jogo[1,2] = 1) e (jogo[1,3] = 0) entao
            retorno <- 3
            setado <- verdadeiro
         fimse
         se (jogo[2,1] = 1) e (jogo[2,2] = 1) e (jogo[2,3] = 0) entao
            retorno <- 6
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 1) e (jogo[3,2] = 1) e (jogo[3,3] = 0) entao
            retorno <- 9
            setado <- verdadeiro
         fimse
         //PRA NÃO PERDER
         se (jogo[1,1] = 1) e (jogo[1,2] = 1) e (jogo[1,3] = 0) entao
            retorno <- 3
            setado <- verdadeiro
         fimse
         se (jogo[2,1] = 1) e (jogo[2,2] = 1) e (jogo[2,3] = 0) entao
            retorno <- 6
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 1) e (jogo[3,2] = 1) e (jogo[3,3] = 0) entao
            retorno <- 9
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 0) e (jogo[1,2] = 1) e (jogo[1,3] = 1) entao
            retorno <- 1
            setado <- verdadeiro
         fimse
         se (jogo[2,1] = 0) e (jogo[2,2] = 1) e (jogo[2,3] = 1) entao
            retorno <- 4
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 0) e (jogo[3,2] = 1) e (jogo[3,3] = 1) entao
            retorno <- 7
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 1) e (jogo[1,2] = 0) e (jogo[1,3] = 1) entao
            retorno <- 2
            setado <- verdadeiro
         fimse
         se (jogo[2,1] = 1) e (jogo[2,2] = 0) e (jogo[2,3] = 1) entao
            retorno <- 5
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 1) e (jogo[3,2] = 0) e (jogo[3,3] = 1) entao
            retorno <- 8
            setado <- verdadeiro
         fimse

         se (jogo[1,1] = 1) e (jogo[2,1] = 1) e (jogo[3,1] = 0) entao
            retorno <- 7
            setado <- verdadeiro
         fimse
         se (jogo[1,2] = 1) e (jogo[2,2] = 1) e (jogo[3,2] = 0) entao
            retorno <- 8
            setado <- verdadeiro
         fimse
         se (jogo[1,3] = 1) e (jogo[2,3] = 1) e (jogo[3,3] = 0) entao
            retorno <- 9
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 1) e (jogo[2,1] = 0) e (jogo[3,1] = 1) entao
            retorno <- 4
            setado <- verdadeiro
         fimse
         se (jogo[1,2] = 1) e (jogo[2,2] = 0) e (jogo[3,2] = 1) entao
            retorno <- 5
            setado <- verdadeiro
         fimse
         se (jogo[1,3] = 1) e (jogo[2,3] = 0) e (jogo[3,3] = 1) entao
            retorno <- 6
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 0) e (jogo[2,1] = 1) e (jogo[3,1] = 1) entao
            retorno <- 1
            setado <- verdadeiro
         fimse
         se (jogo[1,2] = 0) e (jogo[2,2] = 1) e (jogo[3,2] = 1) entao
            retorno <- 2
            setado <- verdadeiro
         fimse
         se (jogo[1,3] = 0) e (jogo[2,3] = 1) e (jogo[3,3] = 1) entao
            retorno <- 3
            setado <- verdadeiro
         fimse

         se (jogo[3,1] = 0) e (jogo[2,2] = 1) e (jogo[1,3] = 1) entao
            retorno <- 7
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 1) e (jogo[2,2] = 0) e (jogo[1,3] = 1) entao
            retorno <- 5
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 1) e (jogo[2,2] = 1) e (jogo[1,3] = 0) entao
            retorno <- 3
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 0) e (jogo[2,2] = 1) e (jogo[3,3] = 1) entao
            retorno <- 1
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 1) e (jogo[2,2] = 0) e (jogo[3,3] = 1) entao
            retorno <- 5
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 1) e (jogo[2,2] = 1) e (jogo[3,3] = 0) entao
            retorno <- 9
            setado <- verdadeiro
         fimse
         se ( setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 2) e (jogo[linha2,2] = 2) e (jogo[linha2,3] = 0) entao
                  se (linha2 = 1) entao
                     retorno <- 3
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 6
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 9
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 0) e (jogo[linha2,2] = 2) e (jogo[linha2,3] = 2) entao
                  se (linha2 = 1) entao
                     retorno <- 1
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 4
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 7
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para linha2 de 1 ate 3 faca
               se (jogo[linha2,1] = 2) e (jogo[linha2,2] = 0) e (jogo[linha2,3] = 2) entao
                  se (linha2 = 1) entao
                     retorno <- 2
                  fimse
                  se (linha2 = 2) entao
                     retorno <- 5
                  fimse
                  se (linha2 = 3) entao
                     retorno <- 8
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para coluna2 de 1 ate 3 faca
               se (jogo[1,coluna2] = 2) e (jogo[2,coluna2] = 2) e (jogo[3,coluna2] = 0) entao
                  se (coluna2 = 1) entao
                     retorno <- 7
                  fimse
                  se (coluna2 = 2) entao
                     retorno <- 8
                  fimse
                  se (coluna2 = 3) entao
                     retorno <- 9
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para coluna2 de 1 ate 3 faca
               se (jogo[1,coluna2] = 0) e (jogo[2,coluna2] = 2) e (jogo[3,coluna2] = 2) entao
                  se (coluna2 = 1) entao
                     retorno <- 1
                  fimse
                  se (coluna2 = 2) entao
                     retorno <- 2
                  fimse
                  se (coluna2 = 3) entao
                     retorno <- 3
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para coluna2 de 1 ate 3 faca
               se (jogo[1,coluna2] = 2) e (jogo[2,coluna2] = 0) e (jogo[3,coluna2] = 2) entao
                  se (coluna2 = 1) entao
                     retorno <- 2
                  fimse
                  se (coluna2 = 2) entao
                     retorno <- 5
                  fimse
                  se (coluna2 = 3) entao
                     retorno <- 8
                  fimse
                  setado <- verdadeiro
                  interrompa
               fimse
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            se (jogo[2,2] = 2) e (jogo[3,3] = 2) e (jogo[3,1] = 0)  entao
               retorno <- 1
               setado <- verdadeiro
            fimse
         fimse
         se ( setado <> verdadeiro) entao
            se (jogo[1,1] = 2) e (jogo[3,1] = 2) e (jogo[3,3] = 0) e (jogo[2,3] = 2)  entao
               retorno <- 9
               setado <- verdadeiro
            fimse
         fimse
         se ( setado <> verdadeiro) entao
            se (jogo[1,1] = 2) e (jogo[3,3] = 2) e (jogo[2,2] = 1) e (jogo[2,3] = 0)  entao
               retorno <- 6
               setado <- verdadeiro
            fimse
         fimse
         se ( setado <> verdadeiro) entao
            se (jogo[1,1] = 2) e (jogo[2,3] = 2) e (jogo[3,3] = 0)  entao
               retorno <- 9
               setado <- verdadeiro
            fimse
         fimse
         se ( setado <> verdadeiro) entao
            se (jogo[1,2] = 2) e (jogo[3,3] = 2) e (jogo[3,1] = 0) entao
               retorno <- 7
               setado <- verdadeiro
            fimse
         fimse
         se ( setado <> verdadeiro) entao
            para i de 1 ate 3 faca
               para linha2 de 1 ate 3 faca
                  se (jogo[i,1] = 2) e (jogo[linha2,2] = 2) e (jogo[1,3] = 0)  ou (jogo[2,1] = 2) e (jogo[linha2,3] = 2) e (jogo[1,3] = 0)entao
                     retorno <- 3
                     setado <- verdadeiro
                  fimse
               fimpara
            fimpara
         fimse
         se ( setado <> verdadeiro) entao
            para i de 1 ate 3 faca
               para linha2 de 1 ate 3 faca
                  se (jogo[i,3] = 2) e (jogo[linha2,2] = 2) e (jogo[1,1] = 0) ou (jogo[2,3] = 2) e (jogo[linha2,1] = 2) e (jogo[1,1] = 0) entao
                     retorno <- 1
                     setado <- verdadeiro
                  fimse
               fimpara
            fimpara
         fimse
         //PARA GANHAR
         se (jogo[1,1] = 2) e (jogo[1,2] = 2) e (jogo[1,3] = 0) entao
            retorno <- 3
            setado <- verdadeiro
         fimse
         se (jogo[2,1] = 2) e (jogo[2,2] = 2) e (jogo[2,3] = 0) entao
            retorno <- 6
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 2) e (jogo[3,2] = 2) e (jogo[3,3] = 0) entao
            retorno <- 9
            setado <- verdadeiro
         fimse

         se (jogo[1,1] = 0) e (jogo[1,2] = 2) e (jogo[1,3] = 2) entao
            retorno <- 1
            setado <- verdadeiro
         fimse
         se (jogo[2,1] = 0) e (jogo[2,2] = 2) e (jogo[2,3] = 2) entao
            retorno <- 4
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 0) e (jogo[3,2] = 2) e (jogo[3,3] = 2) entao
            retorno <- 7
            setado <- verdadeiro
         fimse

         se (jogo[1,1] = 2) e (jogo[1,2] = 0) e (jogo[1,3] = 2) entao
            retorno <- 2
            setado <- verdadeiro
         fimse
         se (jogo[2,1] = 2) e (jogo[2,2] = 0) e (jogo[2,3] = 2) entao
            retorno <- 5
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 2) e (jogo[3,2] = 0) e (jogo[3,3] = 2) entao
            retorno <- 8
            setado <- verdadeiro
         fimse

         se (jogo[1,1] = 2) e (jogo[2,1] = 2) e (jogo[3,1] = 0) entao
            retorno <- 7
            setado <- verdadeiro
         fimse
         se (jogo[1,2] = 2) e (jogo[2,2] = 2) e (jogo[3,2] = 0) entao
            retorno <- 8
            setado <- verdadeiro
         fimse
         se (jogo[1,3] = 2) e (jogo[2,3] = 2) e (jogo[3,3] = 0) entao
            retorno <- 9
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 2) e (jogo[2,1] = 0) e (jogo[3,1] = 2) entao
            retorno <- 4
            setado <- verdadeiro
         fimse
         se (jogo[1,2] = 2) e (jogo[2,2] = 0) e (jogo[3,2] = 2) entao
            retorno <- 5
            setado <- verdadeiro
         fimse
         se (jogo[1,3] = 2) e (jogo[2,3] = 0) e (jogo[3,3] = 2) entao
            retorno <- 6
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 0) e (jogo[2,1] = 2) e (jogo[3,1] = 2) entao
            retorno <- 1
            setado <- verdadeiro
         fimse
         se (jogo[1,2] = 0) e (jogo[2,2] = 2) e (jogo[3,2] = 2) entao
            retorno <- 2
            setado <- verdadeiro
         fimse
         se (jogo[1,3] = 0) e (jogo[2,3] = 2) e (jogo[3,3] = 2) entao
            retorno <- 3
            setado <- verdadeiro
         fimse

         se (jogo[3,1] = 0) e (jogo[2,2] = 2) e (jogo[1,3] = 2) entao
            retorno <- 7
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 2) e (jogo[2,2] = 0) e (jogo[1,3] = 2) entao
            retorno <- 5
            setado <- verdadeiro
         fimse
         se (jogo[3,1] = 2) e (jogo[2,2] = 2) e (jogo[1,3] = 0) entao
            retorno <- 3
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 0) e (jogo[2,2] = 2) e (jogo[3,3] = 2) entao
            retorno <- 1
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 2) e (jogo[2,2] = 0) e (jogo[3,3] = 2) entao
            retorno <- 5
            setado <- verdadeiro
         fimse
         se (jogo[1,1] = 2) e (jogo[2,2] = 2) e (jogo[3,3] = 0) entao
            retorno <- 9
            setado <- verdadeiro
         fimse

      fimse

      retorne retorno
   fimfuncao

   procedimento seta_bloco(bloc,num:inteiro)
   inicio
      para CONT de 1 ate 6 faca
         bloco[bloc,CONT] <- numeros[num,CONT]
      fimpara
   fimprocedimento
   procedimento seta_jogo(num:inteiro)
   inicio
          se (num = 1) entao
            jogo[1,1] <- turno
            seta_bloco(num,turno+9)
         fimse
         se (num = 2) entao
            jogo[1,2] <- turno
            seta_bloco(num,turno+9)
         fimse
         se (num = 3) entao
            jogo[1,3] <- turno
            seta_bloco(num,turno+9)
         fimse
         se (num = 4) entao
            jogo[2,1] <- turno
            seta_bloco(num,turno+9)
         fimse
         se (num = 5) entao
            jogo[2,2] <- turno
            seta_bloco(num,turno+9)
         fimse
         se (num = 6) entao
            jogo[2,3] <- turno
            seta_bloco(num,turno+9)
         fimse
         se (num = 7) entao
            jogo[3,1] <- turno
            seta_bloco(num,turno+9)
         fimse
         se (num = 8) entao
            jogo[3,2] <- turno
            seta_bloco(num,turno+9)
         fimse
         se (num = 9) entao
            jogo[3,3] <- turno
            seta_bloco(num,turno+9)
         fimse
   fimprocedimento

   //VERIFICA SE AINDA NÃO DEU VELHA E SE ALGUÉM GANHOU
   funcao velha():logico
   var
      linha,coluna:inteiro
      retorno:logico
   inicio

      retorno <- verdadeiro
      para linha de 1 ate 3 faca
         para coluna de 1 ate 3 faca
            se (jogo[linha,1]=1) e (jogo[linha,2]=1) e (jogo[linha,3]=1) ou (jogo[1,coluna]=1) e (jogo[2,coluna]=1) e (jogo[3,coluna]=1) ou (jogo[1,1]=1) e (jogo[2,2]=1) e (jogo[3,3]=1) ou (jogo[3,1]=1) e (jogo[2,2]=1) e (jogo[1,3]=1) entao
               resultado <- 1
               retorno <- falso
            fimse
         fimpara
      fimpara
      para linha de 1 ate 3 faca
         para coluna de 1 ate 3 faca
            se (jogo[linha,1]=2) e (jogo[linha,2]=2) e (jogo[linha,3]=2) ou (jogo[1,coluna]=2) e (jogo[2,coluna]=2) e (jogo[3,coluna]=2) ou (jogo[1,1]=2) e (jogo[2,2]=2) e (jogo[3,3]=2) ou (jogo[3,1]=2) e (jogo[2,2]=2) e (jogo[1,3]=2) entao
               resultado <- 2
               retorno <- falso
            fimse
         fimpara
      fimpara
      se (CONT_JOGO = 10) e ((resultado <> 1) OU (resultado <> 2)) entao
         resultado <- 3
         retorno <- falso
      fimse

      retorne retorno
   fimfuncao

   //FUNÇÃO QUE VERIFICA SE A JOGADA É VÁLIDA OU NÃO
   funcao checa_jogada(num:inteiro):logico
   var
      retorno:logico
   inicio
      se (num > 0) e (num < 10) entao
         se (num = 1) entao
            se(jogo[1,1] = 0) entao
               retorno <- verdadeiro
            senao
               retorno <- falso
            fimse
         fimse
         se (num = 2) entao
            se(jogo[1,2] = 0) entao
               retorno <- verdadeiro
            senao
               retorno <- falso
            fimse
         fimse
         se (num = 3) entao
            se(jogo[1,3] = 0) entao
               retorno <- verdadeiro
            senao
               retorno <- falso
            fimse
         fimse
         se (num = 4) entao
            se(jogo[2,1] = 0) entao
               retorno <- verdadeiro
            senao
               retorno <- falso
            fimse
         fimse
         se (num = 5) entao
            se(jogo[2,2] = 0) entao
               retorno <- verdadeiro
            senao
               retorno <- falso
            fimse
         fimse
         se (num = 6) entao
            se(jogo[2,3] = 0) entao
               retorno <- verdadeiro
            senao
               retorno <- falso
            fimse
         fimse
         se (num = 7) entao
            se(jogo[3,1] = 0) entao
               retorno <- verdadeiro
            senao
               retorno <- falso
            fimse
         fimse
         se (num = 8) entao
            se(jogo[3,2] = 0) entao
               retorno <- verdadeiro
            senao
               retorno <- falso
            fimse
         fimse
         se (num = 9) entao
            se(jogo[3,3] = 0) entao
               retorno <- verdadeiro
            senao
               retorno <- falso
            fimse
         fimse
      senao
         retorno <- falso
      fimse

      retorne retorno
   fimfuncao

   inicio
   //SETA OS NÚMEROS INICIAIS PARA MOSTRAR NA TELA DO JOGO
   numeros[1,1] <- "~~~~~|";
   numeros[1,2] <- "~~~22|";
   numeros[1,3] <- "~~~22|";        ~~~~~~~~~~~~~~
   numeros[1,4] <- "----- "         ~~~~~~~~~~~~~~
   numeros[1,5] <- "~~~~~|";          22
   numeros[1,6] <- "~~~22|"           22
   numeros[2,1] <- "~~~22|";          22
   numeros[2,2] <- "----- "           22
   //numeros[1,3] <- "      11 11     ";
  // numeros[1,4] <- "         11     ";
  // numeros[1,5] <- "         11     ";
   //numeros[1,6] <- "         11     ";
   numeros[2,1] <- "       2222     ";
   numeros[2,2] <- "     2     2    ";
   numeros[2,3] <- "          22    ";
   numeros[2,4] <- "        22      ";
   numeros[2,5] <- "     22         ";
   numeros[2,6] <- "     2222222    ";
   numeros[3,1] <- "     333333     ";
   numeros[3,2] <- "         333    ";
   numeros[3,3] <- "     333333     ";
   numeros[3,4] <- "          33    ";
   numeros[3,5] <- "          33    ";
   numeros[3,6] <- "     333333     ";
   numeros[4,1] <- "         444    ";
   numeros[4,2] <- "       44 44    ";
   numeros[4,3] <- "     44   44    ";
   numeros[4,4] <- "    44444444    ";
   numeros[4,5] <- "          44    ";
   numeros[4,6] <- "          44    ";
   numeros[5,1] <- "     5555555    ";
   numeros[5,2] <- "     55         ";
   numeros[5,3] <- "     555555     ";
   numeros[5,4] <- "          55    ";
   numeros[5,5] <- "          55    ";
   numeros[5,6] <- "     555555     ";
   numeros[6,1] <- "      6666      ";
   numeros[6,2] <- "    666         ";
   numeros[6,3] <- "    6666666     ";
   numeros[6,4] <- "    66    66    ";
   numeros[6,5] <- "    66    66    ";
   numeros[6,6] <- "     666666     ";
   numeros[7,1] <- "    77777777    ";
   numeros[7,2] <- "         77     ";
   numeros[7,3] <- "        77      ";
   numeros[7,4] <- "       77       ";
   numeros[7,5] <- "      77        ";
   numeros[7,6] <- "     77         ";
   numeros[8,1] <- "      88888     ";
   numeros[8,2] <- "     88   88    ";
   numeros[8,3] <- "      88 88     ";
   numeros[8,4] <- "     88   88    ";
   numeros[8,5] <- "     88   88    ";
   numeros[8,6] <- "      88888     ";
   numeros[9,1] <- "     999999     ";
   numeros[9,2] <- "    99    99    ";
   numeros[9,3] <- "    99    99    ";
   numeros[9,4] <- "     9999999    ";
   numeros[9,5] <- "         999    ";
   numeros[9,6] <- "      9999      ";
   numeros[10,1] <- "     oooooo     ";
   numeros[10,2] <- "   oo      oo   ";
   numeros[10,3] <- "  oo        oo  ";
   numeros[10,4] <- "  oo        oo  ";
   numeros[10,5] <- "   oo      oo   ";
   numeros[10,6] <- "      oooo      ";
   numeros[11,1] <- "  xx        xx  ";
   numeros[11,2] <- "   xx      xx   ";
   numeros[11,3] <- "      x  x      ";
   numeros[11,4] <- "      x  x      ";
   numeros[11,5] <- "   xx      xx   ";
   numeros[11,6] <- "  xx        xx  ";

   //MOSTRA A TELA INICIAL E SOLICITA O NOME DOS JOGADORES
   mostra_tela_inicial()
   escreval("Digite o nome dos jogadores")
   escreval("")
   escreva("\o/ Jogador 1: ")
   leia(jogador1)
   escreval("")
   escreva("\o/ Jogador 2 ('CPU' para jogar contra o computador): ")
   leia(jogador2)

   //SETA OS BLOCOS COM OS NÚMEROS INICIAIS
   seta_bloco(1,1)
   seta_bloco(2,2)
   seta_bloco(3,3)
   seta_bloco(4,4)
   seta_bloco(5,5)
   seta_bloco(6,6)
   seta_bloco(7,7)
   seta_bloco(8,8)
   seta_bloco(9,9)
   seta_bloco(10,10)
   seta_bloco(11,11)

   turno <- 1
   se (turno = 1) entao
      seta_nome_jogada(jogador1)
   senao
      seta_nome_jogada(jogador2)
   fimse

   //CONTADOR PARA VER QUANTAS JOGADAS FORAM FEITAS
   CONT_JOGO <- 1

   CONTINUA <- verdadeiro

   msg <- ""

   enquanto (CONTINUA = verdadeiro) faca

      //VERIFICA SE AINDA NÃO DEU VELHA
      CONTINUA <- velha()
      se(CONTINUA = verdadeiro) entao
         //MONTA O JOGO NA TELA
         monta_jogo()
         escreval(msg)
         escreva("Escolha o local da sua jogada: ")

         //VERIFICA SE ESTÁ JOGANDO CONTRA A CPU E FAZ A JOGADA
         se (jogador2 = "CPU") e (turno = 2) entao
            jogada <- cpu_joga()
         senao
            leia(jogada)
         fimse
         //VERIFICA SE É UMA JOGADA VÁLIDA
         se (checa_jogada(jogada) = verdadeiro) entao
            seta_jogo(jogada)
            msg<-""
            //ADICIONA JOGADA AO CONTADOR
            CONT_JOGO <- CONT_JOGO + 1
            //MUDA O TURNO DA JOGADA
            se (turno = 1) entao
               turno <- 2
            senao
               turno <- 1
            fimse

            //SETA NOME DO JOGADOR
            se (turno = 1) entao
               seta_nome_jogada(jogador1)
            senao
               seta_nome_jogada(jogador2)
            fimse
         senao
            msg <- "Você selecionou uma jogada inválida!"
         fimse

      fimse
   fimenquanto
   se (turno = 1) entao
      seta_nome_jogada(jogador1)
   senao
      seta_nome_jogada(jogador2)
   fimse
   //MONTA O JOGO FINALIZADO NA TELA
   monta_jogo()
   //SOLICITA ALGUMA TECLA PARA SAIR
   escreval("Pressione qualquer tecla para sair.")
   leia(sair)
fimalgoritmo