## Code for Manuscript 8193 - IEEE Latin America Transactions

![Graphical abstract](https://github.com/melfernandess/Codes-for-Manuscript-8193/blob/main/Imagens/Resumo.png?raw=true).

A presente implementação utilizou o sistema [IEEE 34 Barras](https://cmte.ieee.org/pes-testfeeders/resources/) do IEEE.

Um script contendo a base de dados deste sistema é criada no OpenDSS.

Em seguida, uma função .m responsável por interfacear o OpenDSS ao Matlab é executada sendo o AG a ferramenta de solução implementada.

Após receber os valores de SOC, o algoritmo calcula a potência que a bateria absorve ou fornece ao sistema. 

Finalmente, são obtidas as perdas de energia elétrica do sistema de distribuição considerando a operação do BESS.

## Requerimentos
- Matlab (2015 ou posterior)
- OpenDSS (versão 7.6.5.42 ou posterior)

## Procedimentos Para Execução
- Salvar arquivos da pasta Codes numa mesma pasta em seu computador.
- Alterar o diretório `C:\Users\mel\OneDrive\Desktop\Doutorado 2023\04 Abril\Artigo\Run_IEEE34Mod2.dss` do arquivo `Code.m` para o seu diretório atual.

## Screenshots de Alguns Resultados
<div id="header" align="center">
  <img src="https://github.com/melfernandess/Codes-for-Manuscript-8193/blob/main/Imagens/Fig.%201.jpg?raw=true" width="400"/>
  <img src="https://github.com/melfernandess/Codes-for-Manuscript-8193/blob/main/Imagens/Fig.%203.jpg?raw=true" width="400"/>
</div>


