class QuestionAnswer {
  final String question;
  final List<String> answer;
  final List<String> images;

  QuestionAnswer(this.question, this.answer, [this.images]);
}

List<QuestionAnswer> questionsList = [
  QuestionAnswer(
    'O que é Coleta Seletiva?',
    [
      'Coleta seletiva é a coleta diferenciada de resíduos que foram previamente separados segundo a sua constituição ou composição (plástico, vidro, metal ou papel). Ou seja, resíduos com características similares são selecionados pelo gerador (que pode ser o cidadão, uma empresa ou outra instituição) e disponibilizados para a coleta separadamente.',
      ' De acordo com a Política Nacional de Resíduos Sólidos, a implantação da coleta seletiva é obrigação dos municípios e metas referentes à coleta seletiva fazem parte do conteúdo mínimo que deve constar nos planos de gestão integrada de resíduos sólidos dos municípios.'
    ],
    [
      "assets/img/associacao-coleta1.jpg",
      "assets/img/associacao-coleta2.jpg",
      "assets/img/associacao-coleta3.jpg",
      "assets/img/associacao-coleta4.jpg",
    ],
  ),
  QuestionAnswer(
    'Qual é a importância da Coleta Seletiva?',
    [
      'A importância da coleta seletiva é justamente a redução dos impactos ambientais do consumo. Quando separamos o lixo (ou o que sobrou do que consumimos), facilitamos muito o seu tratamento e diminuímos as chances de impactos nocivos para o ambiente e para a saúde da vida no planeta, incluindo a vida humana. Praticar a coleta seletiva é um dos pilares do consumo sustentável.',
      'A importância desta atividade está relacionada diretamente a vida social. Nas áreas urbanas, o lixo descartado incorretamente pode se acumular em locais inadequados formando focos de proliferação de mosquitos e de outros vetores de doenças. O vento e a chuva podem transportar o descarte para mares e rios, podendo ocasionar na alimentação indevida dos animais silvestres. '
    ],
    [
      "assets/img/lixo1.jpg",
      "assets/img/lixo2.jpg",
      "assets/img/lixo3.jpg",
    ],
  ),
  QuestionAnswer(
    'Como você pode contribuir?',
    [
      'Separando o seu material e descartando corretamente na coleta seletiva e em caso de ainda não possuir rota de coleta em sua rua, deposite o seu resíduo em um dos nossos eco pontos espalhados pela cidade.',
      'O resíduo a ser separado (papel, metal, plástico ou vidro) pode estar em um saco plástico ou caixa de papelão e depositado em um de nossos ecopontos posicionados pela cidade.',
      'Outra forma de contribuição é a divulgação do nosso programa de coleta seletiva, para os seus parentes, vizinhos e também em suas redes sociais, como também divulgando o nosso Instragram (@associacaocatadores) e este aplicativo.'
    ],
    [],
  ),
  QuestionAnswer(
    'Quem Somos?',
    [
      '      Nós, da Associação de Catadores de Teresópolis, somos um grupo de catadores individuais, que vimos na coletividade uma forma de melhorar não só a nossa situação financeira, como abranger uma área maior em nosso município, trazendo melhorias ao meio ambiente e aumentando a nossa geração de renda, com uma gestão mais adequada dos resíduos sólidos que podem ser reciclados.',
      '      Nos reunimos como a Associação de Catadores de Teresópolis, para trabalhar junto ao poder público, visando aumentar o emprego e renda das pessoas que tem a reciclagem como o seu único meio de sobrevivência.'
    ],
    [
      "assets/img/associacao-caminhao.webp",
      "assets/img/associacao-ecopontos.webp",
      "assets/img/associacao-equipamentos.webp",
      "assets/img/associacao-esteira.webp",
      "assets/img/associacao-equipamentos2.jpg",
    ],
  ),
];
