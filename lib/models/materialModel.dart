import 'package:flutter/material.dart';

class Waste {
  final String name;
  final Color color;
  final dynamic icon;
  final String title;
  final List<String> content;
  final List<String> images;
  final String discart;
  final List<String> process;
  final String destination;
  final String economicalImpact;
  final String socialImpact;
  final String environmentalImpact;
  final List<String> itens;

  Waste(
    this.name, {
    this.color,
    this.icon,
    this.title,
    this.content,
    this.images,
    this.discart,
    this.process,
    this.destination,
    this.economicalImpact,
    this.socialImpact,
    this.environmentalImpact,
    this.itens,
  });
}

List<Waste> wasteList = [
  Waste(
    'Papel',
    color: Colors.blue,
    icon: AssetImage("assets/icons/paper.png"),
    title: 'Como descartar papel corretamente?',
    content: [
      'Muitas vezes, não imaginamos a importância do descarte correto de papéis. Rasgamos, amassamos e descartamos pensando somente na segurança e sigilo da informação, mas esquecemos da sustentabilidade.',
      'Amassar o papel não o impedirá de ser reciclado, no entanto, as fibras que o compõe perdem a resistência mais facilmente.',
      'Já o papel rasgado, além de ocupar menos espaço, facilita o transporte e mantém a maioria de suas fibras intactas, facilitando o processo de reciclagem.'
    ],
    images: ['assets/img/onBoardingImg-04.svg'],
    itens: [
      '',
      'livro'
          'Jornais',
      'Revista',
      'Caderno',
      'Envelopes',
      'Listas Telefônica',
      'Cartolina',
      'Cartões',
      'Cartazes',
      'Aparas de papel',
      'Formulários de computador',
      'Sacos de papel',
      'Caixas de Papelão',
      'Panfletos'
    ],
  ),

  Waste('Plástico',
      color: Colors.red,
      icon: AssetImage('assets/icons/plastic.png'),
      title: 'Como descartar plástico corretamente?',
      content: [
        'O plástico é um dos produtos mais utilizados na sociedade atual. O material plástico sintético demora um grande tempo para se decompor, em torno de 500 a 1000 anos, acumulando cada vez mais lixo.',
        'A reciclagem do plástico é de extrema importância para o meio ambiente. Não podemos esquecer também, que a reciclagem de plástico gera renda para milhares de pessoas no Brasil que atuam, principalmente, em empresas e cooperativas de catadores e recicladores de materiais reciclados.',
        'O que separar para a coleta seletiva: embalagens e utensílios como garrafas e potes, sacos e sacolas, baldes, canetas, brinquedos, canos, tubos e conexão de PVC, mesas e cadeiras de plástico e radiografias. ',
        'O que não separar: embalagens metalizadas, adesivos, cabos de panela, espuma de colchão, esponja de cozinha, embalagens de produtos tóxicos, isopor. '
      ],
      images: [
        'assets/img/onBoardingImg-04.svg'
      ],
      itens: [
        'plastico plástico garrafas e potes, sacos e sacolas, baldes, canetas, brinquedos, canos, tubos e conexão de PVC, mesas e cadeiras de plástico e radiografias'
      ]),
  Waste('Metal',
      color: Colors.yellow[700],
      icon: AssetImage('assets/icons/metal.png'),
      title: 'Como descartar metal corretamente?',
      content: [
        'O metal é um dos produtos mais utilizados nas tarefas do dia-a-dia. A reciclagem do metal é de extrema importância para o meio ambiente.',
        'Quando reciclamos o metal ou compramos metal reciclado estamos contribuindo com o meio ambiente, pois este material deixa de ir para os aterros sanitários ou para a natureza (rios, lagos, solo, matas).',
        'Uma das etapas mais importantes no processo de reciclagem de metal é a separação e coleta seletiva do metal realizada pela associação de catadores.',
        'O que separar para coleta seletiva: latas limpas de bebidas e alimentos, panelas, parafusos e pregos, grampos e clipes, os objetos de ferro ou lata de aerossóis.',
        'O que não separar: latas com tintas, vernizes e outros, restos de materiais tóxicos, esponja de aço, pilhas e baterias.'
      ],
      images: [
        'assets/img/onBoardingImg-04.svg'
      ],
      itens: [
        'metal, metais latas limpas de bebidas e alimentos, panelas, parafusos e pregos, grampos e clipes, os objetos de ferro ou lata de aerossóis'
      ]),
  Waste('Vidro',
      color: Colors.green,
      icon: AssetImage('assets/icons/glass.png'),
      title: 'Como descartar vidro corretamente?',
      content: [
        'O vidro é um material que possui um tempo indeterminado para desaparecer do meio ambiente. Embalagens de vidro podem ser totalmente reaproveitadas no ciclo produtivo da reciclagem do, sem nenhuma perda de material.',
        'A reutilização do vidro para a produção de novas embalagens consome menor quantidade de energia e emite resíduos menos particulados de CO2, contribuindo para a preservação do meio ambiente.',
        'Outro aspecto é o menor descarte de lixo, reduzindo os custos de coleta urbana, e aumentando a vida útil dos aterros sanitários. ',
        'O que separar para a coleta seletiva: embalagens como garrafas e potes de qualquer cor vazias e limpas, copos e taças. ',
        'O que não separar: espelhos, vidros planos, temperados e resfriados, cristais, utensílios de porcelanas e cerâmica, pirex e similares, lâmpadas. '
      ],
      images: [
        'assets/img/onBoardingImg-04.svg'
      ],
      itens: [
        'vidro, garrafas, potes , copos e taças'
      ]),
  Waste(
    'Orgânico',
    color: Colors.brown,
    icon: AssetImage('assets/icons/organic.png'),
    title: 'Como descartar orgânicos corretamente?',
    content: [
      'A prática de reciclagem de lixo orgânico está sendo cada vez mais utilizada. Uma possibilidade é a compostagem. Este processo transforma o lixo orgânico em adubo o que é favorável tanto ao meio ambiente, uma vez que esse material não será despejado em aterros sanitários, quanto ao solo que será amparado por um material bastante nutritivo. O mais legal é que esse método pode ser feito em casa. ',
      'A coleta seletiva não faz a coleta do lixo orgânico. ',
      'Acesse o link para mais informações: https://www.dinamicambiental.com.br/blog/reciclagem/lixo-organico-reciclado/#:~:text=%C3%89%20poss%C3%ADvel%20reciclar%20alimentos%2C%20folhas,sua%20decomposi%C3%A7%C3%A3o%20gera%20g%C3%A1s%20metano.'
    ],
    images: ['assets/img/onBoardingImg-04.svg'],
    itens: [
      'organico, orgânico comida, frutas, legumes, verduras, pizza, leite, farinha'
    ],
  ),
  Waste(
    'Óleo Vegetal',
    color: Colors.orangeAccent,
    icon: AssetImage('assets/icons/oil.png'),
    title: 'Como descartar óleo vegetal corretamente?',
    content: [
      'Muitos bares, restaurantes, hotéis e residências ainda jogam o óleo utilizado na cozinha direto na rede de esgoto, desconhecendo os prejuízos dessa ação. Quando retido no encanamento, o óleo causa entupimento das tubulações e faz com que seja necessária a aplicação de diversos produtos químicos para a sua remoção.',
      'Entretanto, todos esses métodos de descarte do óleo de cozinha usados são meios de contaminação do meio ambiente, podendo poluir as águas, o solo e até mesmo a atmosfera. ',
      'Como separar o seu óleo vegetal: armazenar o óleo de cozinha em uma garrafa pet ou embalagem de sabão liquido.',
      'O que não realizar com o óleo: não descartar o óleo na pia, ralos, bueiros ou no meio ambiente.'
    ],
    images: ['assets/img/onBoardingImg-04.svg'],
    itens: [' oleo óleo'],
  ),
  Waste(
    'Não Reciclável',
    color: Colors.grey,
    icon: AssetImage('assets/icons/no-recycle.png'),
    title: 'Como descartar não recicláveis corretamente?',
    content: [
      'Alguns resíduos não são adequados para o processo da coleta seletiva. Estes materiais após passarem por processos industriais, não podem ser reutilizados e tem como destino o lixo comum.',
      'Abaixo, daremos dicas de quais materiais não são adequados para a separação do processo da coleta seletiva. Ao praticar está ação, você estará ajudando o meio ambiente de Teresópolis e também contribuindo com a equipe de catadores durante o processo de separação dos resíduos.',
      'Quais resíduos não são adequados? ',
      'Papéis não recicláveis: adesivos, etiquetas, fita crepe, papel carbono, fotografias, papel toalha, papel higiênico, papéis e guardanapos engordurados, papéis metalizados, parafinados ou plastificados.',
      'Metais não recicláveis: clipes, grampos, esponjas de aço, latas de tintas, latas de combustível e pilhas.',
      'Plásticos não recicláveis: cabos de panela, tomadas, isopor, adesivos, espuma, teclados de computador, acrílicos.',
      'Vidros não recicláveis: espelhos, cristal, ampolas de medicamentos, cerâmicas e louças, lâmpadas, vidros temperados planos',
    ],
    images: ['assets/img/onBoardingImg-04.svg'],
    itens: [
      ' espelhos, cristal, ampolas de medicamentos, cerâmicas e louças, lâmpadas, vidros temperados planoscabos de panela, tomadas, isopor, adesivos, espuma, teclados de computador, acrílicos clipes, grampos, esponjas de aço, latas de tintas, latas de combustível e pilhasadesivos, etiquetas, fita crepe, papel carbono, fotografias, papel toalha, papel higiênico, papéis e guardanapos engordurados, papéis metalizados, parafinados ou plastificados.'
    ],
  ),
  Waste(
    'Pilhas e Baterias',
    color: Colors.orange,
    icon: AssetImage('assets/icons/battery.png'),
    title: 'Como descartar pilhas e baterias corretamente?',
    content: [
      'A contaminação do solo e lençóis freáticos são algumas consequências do descarte incorreto de pilhas e baterias usadas. Algumas dessas, compostas de metais pesados, como o chumbo, mercúrio, níquel e cádmio; são capazes de causar doenças renais, cânceres e problemas relacionados no sistema nervoso central. ',
      'Dica: você pode separar suas pilhas e baterias em um recipiente e levar em supermercados que realizam a coleta destes objetos. '
    ],
    images: ['assets/img/onBoardingImg-04.svg'],
    itens: ['pilhas e baterias'],
  ),
  // Waste(
  //   'Eletrônicos',
  //   color: Colors.green[900],
  //   icon: AssetImage('assets/icons/eletronic.png'),
  //   title: '',
  //   content: [''],
  //   images: ['assets/img/onBoardingImg-04.svg'],
  // )
];
