# IOS_jogo_da_memoria
É um jogo simples de cartas feito em iOS, usado para testar a memória dos jogadores.

### Como Jogar
O jogador deve encontrar todos os pares de cartas, revelando as cartas de duas em duas. Caso encontre um par, o mesmo sumirá imediatamente, caso contrário, as cartas irão virar para baixo outra vez. Você pode tentar acertar a combinação quantas vezes quiser. O jogo só acaba quando todas as castas sumirem.

### Desafio
Encontrar todos os pares com a menor quantidade de movimentos.

## Como construi o Jogo
* Criei uma classe com o nome de `game` que gerencia todo o processo de criação do dech de cartas;
* Adicionei uma variável de contator de movimentos a minha view, chamado `flipCountLabel`, para tornar o jogo mais desafiante;
* Criei um botão `Jogar de Novo` onde a action só está disponível quando todas as cartas estiveram setadas com a opção `.isMatched`

