import 'package:flutter/material.dart';

class Waste {
  final String name;
  final Color color;
  final dynamic icon;
  final String title;
  final List<String> content;
  final List<String> images;
  final List<String> discart;
  final List<List<String>> impacts;
  final List<List<String>> links;
  final List<List<String>> hints;
  final List<String> searchItens;
  final String recyclable;
  final String notRecyclable;

  Waste(
    this.name, {
    this.color,
    this.icon,
    this.title,
    this.content,
    this.images,
    this.discart,
    this.impacts,
    this.links,
    this.hints,
    this.searchItens,
    this.recyclable,
    this.notRecyclable,
  });
}

List<Waste> wasteList = [
  Waste(
    'Papel',
    color: Color(0xFF0F9DDA),
    icon: AssetImage("assets/icons/paper.png"),
    title: 'Como descartar papel corretamente?',
    content: [
      'O papel é produzido a partir de fibras vegetais, e podem ser reciclados facilmente.',
      'Os materiais classificados como papel são recolhidos pela COLETA SELETIVA, e podem ser jogados nos ECOPONTOS.',
    ],
    recyclable:
        "Jornais, Revistas, Livros, Apostilas, Folhas, Folhetos, Caixas de Papelão, Embalagens TetraPak.",
    notRecyclable:
        "Papel carbono, Celofane, Parafinado, Papeis Amanteigados, Papeis Sujos, Fitas, Etiquetas Adesivas, Fotografias, Toalhas de Papel, Lenços usados, Guardanapos Usados",
    discart: [
      "Separar os papeis secos em uma sacola plástica.",
      "Inclua caixas de papelão desmontadas.",
      "De preferência a não rasgar e nem amassar o papel.",
      "Não incluir papeis sujos de gordura, amanteigado ou parafinado."
    ],
    impacts: [
      [
        "ambiental",
        "Reduz a poluição atmosférica por conta da queima do papel."
      ],
      [
        "ambiental",
        "Se descartado da forma incorreta auxilia no aumento de resíduos nos Aterros Sanitários."
      ],
      [
        "ambiental",
        "A reciclagem diminui o uso de recursos hídricos na produção do material."
      ]
    ],
    images: ['assets/img/recycling-blue.png'],
    links: [],
    hints: [],
    searchItens: [
      '',
      "Livro, Jornal, jornais, Revista ,Caderno, Envelopes, Listas Telefônica, Cartolina, Cartões, Cartazes, Aparas de papel, Formulários",
      "Sacos de papel, Panfletos, Caixa de leite, Caixa de suco, Papeis de presente, papel de seda, Papelão, Apostilas"
    ],
  ),
  Waste('Plástico',
      color: Color(0xFFFF3636),
      icon: AssetImage('assets/icons/plastic.png'),
      title: 'Como descartar plástico corretamente?',
      content: [
        'O material plástico sintético demora em torno de 500 a 1000 anos, acumulando cada vez mais lixo.',
        'Os materiais classificados como plástico são recolhidos pela COLETA SELETIVA, e podem ser jogados nos ECOPONTOS.',
      ],
      recyclable:
          "Embalagens Plásticas, Garrafas, Potes, Sacos,  Sacolas, Baldes, Canetas, Brinquedos, Canos, Tubos PVC, Conexão PVC, Mesas de plástico, Cadeiras de Plástico, Radiografias.",
      notRecyclable:
          "Embalagens metalizadas, Adesivos, Cabos de panela, Espuma de Colchão, Esponja, Embalagens de Produtos Tóxicos, Isopor",
      discart: [
        "Lave as embalagens e deixe-as secar.",
        "Diminuir o tamanho das garrafas PETs, amassando-as com as mãos.",
        "É preciso ainda fechar as garrafas com a tampa após amassada.",
        "As sacolas plásticas podem ser usadas como sacos de lixo e depositados nos ecopontos."
      ],
      impacts: [
        [
          "ambiental",
          "Causa grande impacto na fauna marinha, pois os animais podem se alimentar dos fragmentos plásticos no mar."
        ],
        [
          "ambiental",
          "Gera um grande volume de lixo, levando a enchentes e entupimentos de bueiros."
        ],
        [
          "ambiental",
          "A grande maioria das embalagens são longa vida, demorando anos para sumir do ambiente."
        ]
      ],
      images: ['assets/img/recycling-red.png'],
      links: [],
      hints: [],
      searchItens: [
        'plastico plástico garrafas e potes, sacos e sacolas, baldes, canetas, brinquedos, canos, tubos e conexão de PVC, mesas e cadeiras de plástico e radiografias',
        "Potes de creme, xampu e condicionador lavados, embalagens plásticas de alimentos tipo de leite e iogurte, bolsa plástica, garrafas pet, embalagens de produto de limpeza e higiene, como detergente, sabão liquido, amaciante, água sanitária, sabonete liquido, álcool,",
        "Potes de creme, shampoo,  xampu e condicionador lavados, embalagens plásticas de alimentos tipo de leite e iogurte, bolsa plástica, garrafas pet, embalagens de produto de limpeza e higiene, como detergente, sabão liquido, amaciante, água sanitária, sabonete liquido, álcool,"
      ]),
  Waste('Metal',
      color: Color(0xFFFFBC11),
      icon: AssetImage('assets/icons/metal.png'),
      title: 'Como descartar metal corretamente?',
      content: [
        'O metal é produzido  de fontes minerais e sua reciclagem tem extrema importância ambiental e econômica.',
        'Os materiais classificados como metal são recolhidos pela COLETA SELETIVA, e podem ser jogados nos ECOPONTOS.',
      ],
      recyclable:
          'Latas de Bebidas, Latas de Alimentos, Panelas, Parafusos, Pregos, Grampos, Clipes, Ferro, Alumínio, Cobre, Latão, Aerossóis',
      notRecyclable:
          'Latas com tintas, Vernizes, Objetos Contaminados com Materiais Tóxicos, Esponja de Aço, Pilhas, Baterias',
      discart: [
        "Lavar e secar o material completamente",
        "Latas sempre devem estar amassadas ou prensadas para otimizar o armazenamento",
        "Parafusos e pregos devem ser mantidos todos dentro de uma garrafa PET ou recipiente similar.",
        "Depois de separado, deposite na lixeira correta. "
      ],
      impacts: [
        [
          "ambiental",
          "Absorvido por vegetais e animais, causando intoxicações em todos os níveis da cadeia alimentar."
        ],
        ["ambiental", "Contaminação dos rios e nascentes."],
        [
          "ambiental",
          "Contaminação por vias aéreas de toxinas liberadas no ar."
        ]
      ],
      images: ['assets/img/recycling-yellow.png'],
      links: [],
      hints: [],
      searchItens: [
        'metal, metais latas limpas de bebidas e alimentos, panelas, parafusos e pregos, grampos e clipes, os objetos de ferro ou lata de aerossóis, garfo, faca, ferramenta, colher, fios , cabos',
        'Ferragens, arames, fio de cobre, latas de alumínio de refrigerantes, cerveja, chás entre outras, folhas de alumínio, embalagem marmitex limpas, panelas, prateleiras e estantes de ferro, fogão, geladeira, freezer',
      ]),
  Waste('Vidro',
      color: Color(0xFF2D9F46),
      icon: AssetImage('assets/icons/glass.png'),
      title: 'Como descartar vidro corretamente?',
      content: [
        'O vidro podem ser totalmente reaproveitadas no ciclo produtivo da reciclagem, sem nenhuma perda de material.',
        'Os materiais classificados como vidro são recolhidos pela COLETA SELETIVA, e podem ser jogados nos ECOPONTOS.',
      ],
      recyclable: 'Embalagens de Vidro, Garrafas, Potes, Copos, Taças, Pratos',
      notRecyclable:
          'Espelhos, Vidros Temperados ou Resfriados, Cristais, Porcelanas, Cerâmica, Pirex, Lâmpadas.',
      discart: [
        "Separar os papeis secos em uma sacola plástica",
        "Inclua caixas de papelão desmontadas",
        "De preferência a não rasgar e nem amassar o papel",
        "Não incluir papeis sujos de gordura, amanteigado ou parafinado."
      ],
      impacts: [
        [
          "ambiental",
          "Causa acidentes gravíssimos descartado de forma incorreta."
        ],
        [
          "ambiental",
          "Não se degrada na natureza gerando acúmulo de material não usado."
        ],
        [
          "ambiental",
          "Causa incêndios em florestas no período de estiagem onde a vegetação fica mais seca."
        ]
      ],
      images: ['assets/img/recycling-green.png'],
      links: [],
      hints: [],
      searchItens: [
        'vidro, garrafas, potes , copos, taças, prato',
        'Frascos, garrafas de cerveja, vinho, bebidas destiladas'
      ]),
  Waste(
    'Orgânico',
    color: Color(0xFFA33315),
    icon: AssetImage('assets/icons/organic.png'),
    title: 'Como descartar orgânicos corretamente?',
    content: [
      'Materiais orgânicos podem ser reciclados por compostagem, gerando em adubo ',
      'A COLETA SELETIVA não faz a coleta do lixo orgânico, então não deve ser jogando nos ECOPONTOS.',
    ],
    discart: [
      "Separe cascas de frutas, raízes e legumes e cascas de ovos.",
      "Escolha um recipiente limpo e seco.",
      "Distribua o seu lixo neste recipiente.",
      "Espere por uma semana.",
      "Você vai ver os seus restos de comida se transformarem em solo. Seu composto estará pronto quando tiver aspecto e cheiro de terra."
    ],
    impacts: [
      [
        "ambiental",
        "Interfere gravemente no efeito estufa, uma vez descartado de forma incorreta a decomposição desse material produz gás metano."
      ],
      [
        "ambiental",
        "O estado de decomposição faz com que saia um líquido escuro que contém alta carga de poluidora e é proveniente de matérias orgânicas em putrefação."
      ],
      [
        "ambiental",
        "O acúmulo do lixo orgânico nos Aterros Sanitários atrai animais vetores de doenças."
      ]
    ],
    links: [
      [
        'Compostagem de Materiais Orgânicos',
        'https://www.dinamicambiental.com.br/blog/reciclagem/lixo-organico-reciclado/#:~:text=%C3%89%20poss%C3%ADvel%20reciclar%20alimentos%2C%20folhas,sua%20decomposi%C3%A7%C3%A3o%20gera%20g%C3%A1s%20metano.'
      ]
    ],
    images: ['assets/img/recycling-brown.png'],
    hints: [],
    recyclable:
        'organico, orgânico comida, frutas, legumes, verduras, pizza, leite, farinha, alimentos, bebidas, arroz, feijão, macarrão, carne, massas, peixe, frango',
    notRecyclable: 'materiais não orgânicos',
    searchItens: [
      'organico, orgânico comida, frutas, legumes, verduras, pizza, leite, farinha, alimentos, bebidas, arroz, feijão, macarrão, carne, massas, peixe, frango'
    ],
  ),
  Waste(
    'Óleo Vegetal',
    color: Color(0xFFDFA100),
    icon: AssetImage('assets/icons/oil.png'),
    title: 'Como descartar óleo vegetal corretamente?',
    content: [
      'Oleos Vegetais podem contaminar o meio ambiente, e devem ser descartados corretamente.',
      'Oleos vegetais são recolhidos pela COLETA SELETIVA, e as embalagens com óleo vegetal podem ser deixado nos ECOPONTOS.',
    ],
    recyclable:
        "óleo vegetal, óleo de cozinha, óleo de girassol, óleo de canola, óleo de soja, gordura animal",
    notRecyclable:
        "óleos minerais, óleos sinteticos, óleo de máquinas, óleo de veiculos",
    discart: [
      "Esperar o óleo esfriar.",
      "Peneirar o óleo de modo que ele fique mais limpo possível.",
      "Colocar o óleo usado em um recipiente de garrafa PET ou embalagem de sabão líquido.",
      "Fazer o descarte em locais onde tenha os ecopontos.",
    ],
    impacts: [
      [
        "ambiental",
        "Poluição das águas que abastecem as residências para o consumo."
      ],
      [
        "ambiental",
        "Prejudica as condições estéticas e sanitárias do meio ambiente."
      ],
      ["ambiental", "Poluição dos lençóis freáticos e contaminação do solo."]
    ],
    images: ['assets/img/recycling-orangel.png'],
    links: [],
    hints: [],
    searchItens: [' oleo óleo, gordura'],
  ),
  Waste(
    'Não Reciclável',
    color: Colors.grey,
    icon: AssetImage('assets/icons/no-recycle.png'),
    title: 'Como descartar não recicláveis corretamente?',
    content: [
      'Alguns resíduos, após passarem por processos industriais, não podem ser reutilizados e tem como destino o lixo comum.',
      'A COLETA SELETIVA não faz a coleta de materiais não recicláveis. Eles devem ser jogados nas LIXEIRAS TRADICIONAIS.'
    ],
    recyclable: 'materiais recicláveis',
    notRecyclable:
        "Adesivos, Etiquetas, Fita Crepe, Papel Carbono, Fotografias, Papel Toalha, Papel Higiênico, Papéis Sujos, Guardanapos Engordurados, Papéis Metalizados, Papéis Plastificados, Clipes, Grampos, Esponjas de Aço, Latas de Tintas, Latas de Combustível, Pilhas, Cabos de Panela, Tomadas, Isopor, Espuma, Acrílicos, Espelhos, Cristal, Ampolas de Medicamentos, Cerâmicas,Louças, Lâmpadas, Vidros Temperados",
    images: ['assets/img/recycling-grey.png'],
    discart: [
      '',
      '',
      '',
      '',
    ],
    impacts: [
      ["ambiental", ''],
      ["ambiental", ''],
      ["ambiental", ''],
      ["ambiental", ''],
    ],
    links: [],
    hints: [],
    searchItens: [
      'Papel carbono, celofane, amanteigado, parafinado, papeis amanteigados ou sujos, adesivos, fotografias, toalhas, lenços e guardanapos',
      'espelhos, cristal, ampolas de medicamentos, cerâmicas e louças, lâmpadas, vidros temperados cabos de panela, tomadas, isopor, adesivos',
      'espuma, acrílicos clipes, grampos, esponjas de aço, latas de tintas, latas de combustível, adesivos, etiquetas',
      'fita crepe, papel carbono, fotografias, papel toalha, papel higiênico, papéis e guardanapos engordurados, papéis metalizados, parafinados ou plastificados',
      'Papel higiênico, absorventes, fraudas, fita crepe, guardanapos, fotografias, filtro de cigarros, copos de papel, caixa de pizza engordurada',
      'Papéis enxarcados, Papel vegetal,  Lata de desodorante, Lata de tinta, Lata de verniz,,',
      'osso de frango, carne, Vidros de janela, Cristal, Espelho, Madeira'
    ],
  ),
  Waste(
    'Pilhas e Baterias',
    color: Color(0xFFFF5C00),
    icon: AssetImage('assets/icons/battery.png'),
    title: 'Como descartar pilhas e baterias corretamente?',
    content: [
      'Pilhas e Baterias possuem metais pesados que podem contaminar o solo e lençóis freáticos',
      'A COLETA SELETIVA não faz a coleta do pilhas e baterias, então não deve ser jogando nos ECOPONTOS. Mas alguns supermercados recolhem esses materiais.',
    ],
    recyclable: 'pilhas, baterias',
    notRecyclable: '',
    discart: [
      "Confira se essa embalagem pode ser descartada em lixo comum, como a parte plástica ou de papelão.",
      "Certifique-se que o material não está estourado ou vazando. Caso isso aconteça, não ingerir ou colocar as mãos sujas nos olhos.",
      "Guardar em um recipiente separado, que pode ser uma garrafa pet.",
      "As pilhas/baterias após o uso devem ser entregues aos estabelecimentos como supermercados e/ou às assistências técnicas."
    ],
    impacts: [
      [
        "ambiental",
        "Esses materiais jogados em aterros sanitários ou lixões pode ocorrer a contaminação do solo e lençóis freáticos por metais pesados."
      ],
      [
        "ambiental",
        "Jogados na água podem entrar na cadeia alimentar e causar sérios problemas à saúde como câncer e danos ao sistema nervoso central."
      ],
      ["ambiental", "A queima deste material pode contaminar o ar."]
    ],
    images: ['assets/img/recycling-orange.png'],
    links: [],
    hints: [
      [
        'Dica: Você pode separar suas pilhas e baterias em um recipiente e levar em supermercados que realizam a coleta destes objetos. ',
        "assets/img/coletor-baterias.jpg"
      ]
    ],
    searchItens: ['pilhas e baterias'],
  ),
  Waste(
    'Resíduo Eletrônico',
    color: Colors.green[900],
    icon: AssetImage('assets/icons/eletronic.png'),
    title: 'Como descartar eletrônicos corretamente?',
    content: [
      'Resíduo eletrônico, ou lixo eletrônico, são os equipamentos eletrônicos descartados ou obsoletos.',
      'A COLETA SELETIVA realiza o tratamento correto desses equipamentos, portanto eles podem ser descartados nos ECOPONTOS.'
    ],
    recyclable:
        'Computadores, Tablets, Monitores, LEDs, Teclados, Impressoras, Câmeras Fotográficas, Aparelhos de som, Televisores, Microondas, Rádios, Telefones, Celulares, Carregadores',
    notRecyclable: 'Baterias e pilhas.',
    discart: [
      '',
      '',
      '',
      '',
    ],
    impacts: [
      [
        "ambiental",
        "Eletrônicos possuem em sua composição metais pesados altamente tóxicos, como mercúrio, cádmio, berílio e chumbo. Em contato com o solo, podem contaminam o lençol freático, e, se queimados, podem liberar toxinas perigosas ao meio ambiente."
      ],
      ["ambiental", "."],
      ["ambiental", "."]
    ],
    images: ['assets/img/recycling-green.png'],
    links: [],
    hints: [],
    searchItens: [
      'eletronicos , eletrônicos, Computadores, tablets, monitores, LEDs, Teclados, impressoras, câmeras fotográficas, aparelhos de som, televisores, tv, micro-ondas, microondas, rádios, radios, telefones, celulares e carregadores'
    ],
  ),
];
