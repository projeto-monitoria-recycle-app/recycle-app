import 'package:flutter/material.dart';

class Waste {
  final String name;
  final Color color;
  final dynamic icon;
  final String title;
  final List<String> content;
  final List<String> images;
  final String discart;
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
    color: Colors.blue,
    icon: AssetImage("assets/icons/paper.png"),
    title: 'Como descartar papel corretamente?',
    content: [
      'A reciclagem de materiais, como o papel, é uma prática importante, pois é uma maneira de tentar reduzir os impactos das atividades humanas no meio ambiente. O papel é produzido a partir de fibras vegetais, principalmente o eucalipto.',
      'Esta prática possui também um importante impacto na economia, pois impede o acúmulo de papeis em aterros sanitários, contribuindo para a redução de resíduos sólidos, diminuição de impactos negativos no solo e, consequentemente, diminuição da poluição.',
    ],
    recyclable:
        "Jornais, revistas, livros, apostilas, folhas e folhetos (de preferência sem rasgar nem amassar), caixas de papelão desmontadas e embalagens TetraPak.",
    notRecyclable:
        "Papel carbono, celofane, amanteigado, parafinado, papeis amanteigados ou sujos, fitas e etiquetas adesivas, fotografias, toalhas, lenços e guardanapos usados.",
    images: ['assets/img/recycling-blue.png'],
    links: [],
    hints: [],
    searchItens: [
      '',
      "Livro Jornal, jornais, Revista ,Caderno, Envelopes, Listas Telefônica, Cartolina, Cartões, Cartazes, Aparas de papel, Formulários",
      "Sacos de papel, Panfletos, Caixa de leite, Caixa de suco, Papeis de presente, papel de seda, Papelão, Apostilas"
    ],
  ),
  Waste('Plástico',
      color: Colors.red,
      icon: AssetImage('assets/icons/plastic.png'),
      title: 'Como descartar plástico corretamente?',
      content: [
        'O plástico é um dos produtos mais utilizados na sociedade atual. O material plástico sintético demora um grande tempo para se decompor, em torno de 500 a 1000 anos, acumulando cada vez mais lixo.',
      ],
      recyclable:
          "Embalagens e utensílios como garrafas e potes, sacos e sacolas, baldes, canetas, brinquedos, canos, tubos e conexão de PVC, mesas e cadeiras de plástico e radiografias.",
      notRecyclable:
          "Embalagens metalizadas, adesivos, cabos de panela, espuma de colchão, esponja de cozinha, embalagens de produtos tóxicos, isopor.",
      images: ['assets/img/recycling-red.png'],
      links: [],
      hints: [],
      searchItens: [
        'plastico plástico garrafas e potes, sacos e sacolas, baldes, canetas, brinquedos, canos, tubos e conexão de PVC, mesas e cadeiras de plástico e radiografias',
        "Potes de creme, xampu e condicionador lavados, embalagens plásticas de alimentos tipo de leite e iogurte, bolsa plástica, garrafas pet, embalagens de produto de limpeza e higiene, como detergente, sabão liquido, amaciante, água sanitária, sabonete liquido, álcool,",
        "Potes de creme, shampoo,  xampu e condicionador lavados, embalagens plásticas de alimentos tipo de leite e iogurte, bolsa plástica, garrafas pet, embalagens de produto de limpeza e higiene, como detergente, sabão liquido, amaciante, água sanitária, sabonete liquido, álcool,"
      ]),
  Waste('Metal',
      color: Colors.yellow[700],
      icon: AssetImage('assets/icons/metal.png'),
      title: 'Como descartar metal corretamente?',
      content: [
        'O metal é um dos produtos mais utilizados nas tarefas do dia-a-dia. A reciclagem do metal é de extrema importância para o meio ambiente.',
        'Quando reciclamos o metal ou compramos metal reciclado estamos contribuindo com o meio ambiente, pois este material deixa de ir para os aterros sanitários ou para a natureza (rios, lagos, solo, matas).',
        'Uma das etapas mais importantes no processo de reciclagem de metal é a separação e sua coleta seletiva, realizada pela associação de catadores.',
      ],
      recyclable:
          'Latas limpas de bebidas e alimentos, panelas, parafusos e pregos, grampos e clipes, os objetos de ferro ou lata de aerossóis.',
      notRecyclable:
          'Latas com tintas, vernizes e outros, restos de materiais tóxicos, esponja de aço, pilhas e baterias.',
      images: ['assets/img/recycling-yellow.png'],
      links: [],
      hints: [],
      searchItens: [
        'metal, metais latas limpas de bebidas e alimentos, panelas, parafusos e pregos, grampos e clipes, os objetos de ferro ou lata de aerossóis, garfo, faca, ferramenta, colher, fios , cabos'
            "Ferragens, arames, fio de cobre, latas de alumínio de refrigerantes, cerveja, chás entre outras, folhas de alumínio, embalagem marmitex limpas, panelas, prateleiras e estantes de ferro, fogão, geladeira, freezer"
      ]),
  Waste('Vidro',
      color: Colors.green,
      icon: AssetImage('assets/icons/glass.png'),
      title: 'Como descartar vidro corretamente?',
      content: [
        'O vidro é um material que possui um tempo indeterminado para desaparecer do meio ambiente. Embalagens de vidro podem ser totalmente reaproveitadas no ciclo produtivo da reciclagem, sem nenhuma perda de material.',
        'A reutilização do vidro para a produção de novas embalagens consome menor quantidade de energia e emite resíduos menos particulados de CO2, contribuindo para a preservação do meio ambiente.',
        'Outro aspecto é o menor descarte de lixo, reduzindo os custos de coleta urbana, e aumentando a vida útil dos aterros sanitários. ',
      ],
      recyclable:
          'Embalagens como garrafas e potes de qualquer cor vazias e limpas, copos e taças.',
      notRecyclable:
          'Espelhos, vidros planos, temperados e resfriados, cristais, utensílios de porcelanas e cerâmica, pirex e similares, lâmpadas.',
      images: ['assets/img/recycling-green.png'],
      links: [],
      hints: [],
      searchItens: [
        'vidro, garrafas, potes , copos e taças, prato',
        'Frascos, garrafas de cerveja, vinho, bebidas destiladas'
      ]),
  Waste(
    'Orgânico',
    color: Colors.brown,
    icon: AssetImage('assets/icons/organic.png'),
    title: 'Como descartar orgânicos corretamente?',
    content: [
      'A prática de reciclagem de lixo orgânico está sendo cada vez mais utilizada. Uma possibilidade é a compostagem. Este processo transforma o lixo orgânico em adubo o que é favorável tanto ao meio ambiente, uma vez que esse material não será despejado em aterros sanitários, quanto ao solo que será amparado por um material bastante nutritivo. O mais legal é que esse método pode ser feito em casa. ',
      'A coleta seletiva não faz a coleta do lixo orgânico. Acesse o link para mais informações sobre compostagem: ',
    ],
    links: [
      [
        'Compostagem de Materiais Orgânicos',
        'https://www.dinamicambiental.com.br/blog/reciclagem/lixo-organico-reciclado/#:~:text=%C3%89%20poss%C3%ADvel%20reciclar%20alimentos%2C%20folhas,sua%20decomposi%C3%A7%C3%A3o%20gera%20g%C3%A1s%20metano.'
      ]
    ],
    images: ['assets/img/recycling-brown.png'],
    hints: [],
    recyclable: '',
    notRecyclable: '',
    searchItens: [
      'organico, orgânico comida, frutas, legumes, verduras, pizza, leite, farinha, alimentos, bebidas, arroz, feijão, macarrão, carne, massas, peixe, frango'
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
    recyclable: "",
    notRecyclable: "Óleos minerais e sinteticos (de máquinas e veiculos)",
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
      'Alguns resíduos não são adequados para o processo da coleta seletiva. Estes materiais após passarem por processos industriais, não podem ser reutilizados e tem como destino o lixo comum.',
      'Abaixo, daremos dicas de quais materiais não são adequados para a separação do processo da coleta seletiva. Ao praticar está ação, você estará ajudando o meio ambiente de Teresópolis e também contribuindo com a equipe de catadores durante o processo de separação dos resíduos.',
      'A coleta seletiva não faz a coleta de materiais não recicláveis. Eles devem ser jogados nas lixeiras tradicionais.'
    ],
    recyclable:
        'A coleta seletiva não faz a coleta de materiais não recicláveis. Eles devem ser jogados nas lixeiras tradicionais.',
    notRecyclable:
        "Papéis não recicláveis: adesivos, etiquetas, fita crepe, papel carbono, fotografias, papel toalha, papel higiênico, papéis e guardanapos engordurados, papéis metalizados, parafinados ou plastificados.\n\nMetais não recicláveis: clipes, grampos, esponjas de aço, latas de tintas, latas de combustível e pilhas.\n\nPlásticos não recicláveis: cabos de panela, tomadas, isopor, adesivos, espuma, acrílicos.\n\nVidros não recicláveis: espelhos, cristal, ampolas de medicamentos, cerâmicas e louças, lâmpadas, vidros temperados planos",
    images: ['assets/img/recycling-grey.png'],
    links: [],
    hints: [],
    searchItens: [
      'Papel carbono, celofane, amanteigado, parafinado, papeis amanteigados ou sujos, adesivos, fotografias, toalhas, lenços e guardanapos',
      ' espelhos, cristal, ampolas de medicamentos, cerâmicas e louças, lâmpadas, vidros temperados cabos de panela, tomadas, isopor, adesivos',
      ' espuma, acrílicos clipes, grampos, esponjas de aço, latas de tintas, latas de combustível, adesivos, etiquetas',
      ' fita crepe, papel carbono, fotografias, papel toalha, papel higiênico, papéis e guardanapos engordurados, papéis metalizados, parafinados ou plastificados',
      'Papel higiênico, absorventes, fraudas, fita crepe, guardanapos, fotografias, filtro de cigarros, copos de papel, caixa de pizza engordurada',
      'Papéis enxarcados, Papel vegetal,  Lata de desodorante, Lata de tinta, Lata de verniz,,',
      'osso de frango, carne, Vidros de janela, Cristal, Espelho, Madeira'
    ],
  ),
  Waste(
    'Pilhas e Baterias',
    color: Colors.orange,
    icon: AssetImage('assets/icons/battery.png'),
    title: 'Como descartar pilhas e baterias corretamente?',
    content: [
      'A contaminação do solo e lençóis freáticos são algumas consequências do descarte incorreto de pilhas e baterias usadas. Algumas dessas, compostas de metais pesados, como o chumbo, mercúrio, níquel e cádmio; são capazes de causar doenças renais, cânceres e problemas relacionados no sistema nervoso central. ',
      'A coleta seletiva recolhe o lixo eletrônico como, computadores, eletrodomésticos e demais produtos eletrônicos, porém coleta seletiva não faz a coleta de pilhas e baterias.',
    ],
    recyclable: '',
    notRecyclable: '',
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
      'Se descartados de forma inadequada, podem causar sérios riscos para o meio ambiente, pois possuem em sua composição metais pesados altamente tóxicos, como mercúrio, cádmio, berílio e chumbo, além de outros compostos químicos. Em contato com o solo, podem contaminam o lençol freático, e, se queimados, podem liberar toxinas perigosas ao meio ambiente.',
      'Portanto, a manipulação e processamento desses resíduos, de forma incorreta e desprotegida, podem contaminar os seres humanos que executam estas tarefas e o meio ambiente à sua volta.',
      'A coleta seletiva realiza o tratamento correto desses equipamentos, portanto eles podem ser descartados nos ecopontos.'
    ],
    recyclable:
        'Computadores, tablets, monitores, LEDs, teclados, impressoras, câmeras fotográficas, aparelhos de som, televisores, micro-ondas, rádios, telefones, celulares e carregadores',
    notRecyclable: 'Baterias e pilhas.',
    images: ['assets/img/recycling-green.png'],
    links: [],
    hints: [],
    searchItens: [
      'eletronicos , eletrônicos, Computadores, tablets, monitores, LEDs, Teclados, impressoras, câmeras fotográficas, aparelhos de som, televisores, tv, micro-ondas, microondas, rádios, radios, telefones, celulares e carregadores'
    ],
  ),
];
