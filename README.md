# RPG Game
Jogo de ataque e defesa simples desenvolvido em Flutter como APS da disciplina de Programação Orientada a Objeto

## Atividades Práticas Supervisionadas II – APS II

### Objetivos:

• Compreender os fundamentos da Programação Orientada a Objetos;

• Modelar problema com diagrama de classes (UML);

• Dominar o uso e aplicação dos pilares da Programação Orientada a Objetos;

• Desenvolver um jogo de RPG aplicando Orientação a Objetos.


### Role-Playing Game (RPG) – Padrão:

• O jogo será entre um usuário e o computador;

• O usuário escolhe seu personagem dentre as opções de uma lista de personagens enquanto o computador escolhe seu personagem também dessa lista randomicamente e não podendo ser igual ao personagem escolhido pelo usuário (vice-versa);

• Na primeira rodada o usuário ataca e o computador se defende;

• O usuário escolhe o tipo de ataque, mas a força do ataque é escolhidarandomicamente;

• O computador escolhe aleatoriamente a defesa e o poder da defesa.

• Se o poder do ataque for maior que o da defesa o atacante retira energia do defensor;

• Na próxima rodada o computador ataca e o usuário se defende. Assim até um dos dois perder toda a energia;

• Em cada uso do ataque especial ou da defesa especial, quem usou deve perder energia também.

• Cada personagem deve possuir pelo menos:

 ◦ ataque comum - força que varia entre um intervalo de 1 a 100;
 
 ◦ defesa comum - força que varia entre um intervalo de 1 a 100;
 
 ◦ magia - força que varia entre um intervalo de 1 a 100;
 
 ◦ defesa magica - força que varia entre um intervalo de 1 a 100;
 
 ◦ energia - varia entre um intervalo de 0 a 100.
 
• É obrigatório utilizar técnicas de orientação a objetos, como classe (concreta, abstrata e final) encapsulamento, interface, herança e polimorfismo.

 
### Observações:

• Além da implementação do jogo, deverá constar também no arquivo enviado o diagrama de classes em UML.

• Seja livre para adicionar/remover recursos no seu jogo. Essa é só uma proposta padrão para quem não quiser elaborar o próprio jogo!
