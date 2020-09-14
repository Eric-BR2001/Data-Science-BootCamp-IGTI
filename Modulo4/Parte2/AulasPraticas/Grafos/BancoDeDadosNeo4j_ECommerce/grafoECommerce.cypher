// Dados de acesso para criação do banco de dados:
//DBMS Name: Graph
//Set Password: 123456

// CRIAÇÃO DOS NÓS E RELACIONAMENTOS DO BANCO DE DADOS

// Categorias de Produtos
CREATE
    (smartphones:CATEGORIA {name: 'Smartphones'}),
    (notebooks:CATEGORIA {name: 'Notebooks'}), 
    (cameras:CATEGORIA {name: 'Cameras'})
;

// Instâncias de Smartphones
CREATE
    (sony_xperia_z22:PRODUTO {name: 'Sony Experia Z22', preco: 765.00, pronta_entrega: true, disponibilidade: true}),
    (samsung_galaxy_s8:PRODUTO {name: 'Samsung Galaxy S8', preco: 784.00, pronta_entrega: true, disponibilidade: true}),
    (sony_xperia_xa1:PRODUTO {name: 'Sony Xperia XA1 Dual G3112', preco: 229.50, pronta_entrega: true, disponibilidade: false}),
    (iphone_8:PRODUTO {name: 'Apple iPhone 8 Plus 64GB', preco: 874.20, pronta_entrega: true, disponibilidade: false}),
    (xiaomi_mi_mix_2:PRODUTO {name: 'Xiaomi Mi Mix 2', preco: 420.87, pronta_entrega: true, disponibilidade: true}),
    (huawei_p8:PRODUTO {name: 'Huawei P8 Lite', preco: 191.00, pronta_entrega: true, disponibilidade: true})
;

// Relacionamento entre produtos e categorias para smartphones
MATCH
    (p1:PRODUTO{name:'Sony Experia Z22'}),
    (p2:PRODUTO{name:'Samsung Galaxy S8'}),    
    (p3:PRODUTO{name:'Sony Xperia XA1 Dual G3112'}), 
    (p4:PRODUTO{name:'Apple iPhone 8 Plus 64GB'}),
    (p5:PRODUTO{name:'Xiaomi Mi Mix 2'}),
    (p6:PRODUTO{name:'Huawei P8 Lite'}),
    (c1:CATEGORIA{name:'Smartphones'})
CREATE
    (p1)-[:PERTENCE_A]->(c1),
    (p2)-[:PERTENCE_A]->(c1),
    (p3)-[:PERTENCE_A]->(c1),
    (p4)-[:PERTENCE_A]->(c1),
    (p5)-[:PERTENCE_A]->(c1),
    (p6)-[:PERTENCE_A]->(c1)
RETURN p1, p2, p3, p4, p5, p6, c1;

//MATCH(n) RETURN n

// Instâncias de Notebooks
CREATE
    (acer_swift_3:PRODUTO {name: 'Acer Swift 3 SF314-51-34TX', preco: 595.00, pronta_entrega: true, disponibilidade: false}),
    (hp_pro_book:PRODUTO {name: 'HP ProBook 440 G4', preco: 771.30, pronta_entrega: true, disponibilidade: true}),
    (dell_inspiron_15:PRODUTO {name: 'Dell Inspiron 15 7577', preco: 1477.50, pronta_entrega: true, disponibilidade: true}),
    (apple_macbook:PRODUTO {name: "Apple MacBook A1534 12' Rose Gold", preco: 1293.00, pronta_entrega: false, disponibilidade: true})
;

// Relacionamento entre produtos e categorias para notebooks
MATCH
    (p7:PRODUTO{name:'Acer Swift 3 SF314-51-34TX'}),
    (p8:PRODUTO{name:'HP ProBook 440 G4'}),
    (p9:PRODUTO{name:'Dell Inspiron 15 7577'}),
    (p10:PRODUTO{name:"Apple MacBook A1534 12' Rose Gold"}), 
    (c2:CATEGORIA{name:'Notebooks'})
CREATE
    (p7)-[:PERTENCE_A]->(c2),
    (p8)-[:PERTENCE_A]->(c2),
    (p9)-[:PERTENCE_A]->(c2),
    (p10)-[:PERTENCE_A]->(c2)
RETURN p7, p8, p9, p10, c2;

// Instâncias de Câmeras
CREATE
    (canon_eos_6d:PRODUTO {name: 'Canon EOS 6D Mark II Body', preco: 1794.00, pronta_entrega: true, disponibilidade: false}),
    (nikon_d7500:PRODUTO {name: 'Nikon D7500 Kit 18-105mm VR', preco: 1612.35, pronta_entrega: true, disponibilidade: true})

// Relacionamento entre produtos e categorias para câmeras
MATCH
    (p11:PRODUTO{name:'Canon EOS 6D Mark II Body'}),
    (p12:PRODUTO{name:'Nikon D7500 Kit 18-105mm VR'}),
    (c3:CATEGORIA{name:'Cameras'})
CREATE
    (p11)-[:PERTENCE_A]->(c3),
    (p12)-[:PERTENCE_A]->(c3)
RETURN p11, p12, c3;

// Instâncias de Consumidores
CREATE
    (joe:CONSUMIDOR {name: 'Joe Baxton', email: 'joeee_baxton@example.com', idade: 25}),
    (daniel:CONSUMIDOR {name: 'Daniel Johnston', email: 'dan_j@example.com', idade: 31}),
    (alex:CONSUMIDOR {name: 'Alex McGyver', email: 'mcgalex@example.com', idade: 22}),
    (alisson:CONSUMIDOR {name: 'Allison York', email: 'ally_york1@example.com', idade: 24})
;

// Relacionamento entre consumidores e produtos

// Joe
MATCH
    (c1:CONSUMIDOR{email:'joeee_baxton@example.com'}),
    (p1:PRODUTO{name:'Nikon D7500 Kit 18-105mm VR'}),
    (p2:PRODUTO{name:'Apple iPhone 8 Plus 64GB'}),
    (p3:PRODUTO{name:"Apple MacBook A1534 12' Rose Gold"})
CREATE
    (c1)-[:VIEWED {views_count: 15}]->(p1),
    (c1)-[:ADDED_TO_WISH_LIST]->(p2),
    (c1)-[:COMPROU]->(p3)
RETURN c1, p1, p2, p3;

// Daniel
MATCH
    (c2:CONSUMIDOR{email:'dan_j@example.com'}),
    (p1:PRODUTO{name:'Sony Experia Z22'}),
    (p2:PRODUTO{name:'Dell Inspiron 15 7577'})
CREATE
    (c2)-[:VIEWED {views_count: 10}]->(p1),
    (c2)-[:VIEWED {views_count: 20}]->(p2),
    (c2)-[:ADDED_TO_WISH_LIST]->(p2)
RETURN c2, p1, p2;

// Alex
MATCH
    (c3:CONSUMIDOR{email:'mcgalex@example.com'}),
    (p1:PRODUTO{name:'Canon EOS 6D Mark II Body'}),
    (p2:PRODUTO{name:'Sony Xperia XA1 Dual G3112'}),
    (p3:PRODUTO{name:'Nikon D7500 Kit 18-105mm VR'}),
    (p4:PRODUTO{name:'Xiaomi Mi Mix 2'})
CREATE
    (c3)-[:VIEWED {views_count: 20}]->(p1),
    (c3)-[:ADDED_TO_WISH_LIST]->(p2),
    (c3)-[:ADDED_TO_WISH_LIST]->(p3),
    (c3)-[:COMPROU]->(p4)
RETURN c3, p1, p2, p3, p4;

// Allison
MATCH
    (c4:CONSUMIDOR{email:'ally_york1@example.com'}),
    (p1:PRODUTO{name:'Acer Swift 3 SF314-51-34TX'}),
    (p2:PRODUTO{name:'HP ProBook 440 G4'}),
    (p3:PRODUTO{name:'Huawei P8 Lite'}),
    (p4:PRODUTO{name:'Sony Xperia XA1 Dual G3112'})
CREATE
    (c4)-[:ADDED_TO_WISH_LIST]->(p1),
    (c4)-[:ADDED_TO_WISH_LIST]->(p2),
    (c4)-[:COMPROU]->(p3),
    (c4)-[:COMPROU]->(p4)
RETURN c4, p1, p2, p3, p4;

// Ofertas promocionais (recomendação de produtos)
CREATE
    (offer:OFERTAS_PROMOCIONAIS {tipo:'discount_offer', conteudo:'Notebooks discount offer...'})
WITH
    offer
MATCH
    (:CONSUMIDOR)-[:ADDED_TO_WISH_LIST | :VIEWED]->(notebook:PRODUTO)-[:PERTENCE_A]->(:CATEGORIA {name:'Notebooks'})
MERGE
    (offer)-[:USED_TO_PROMOTE]->(notebook)
;

//Para apagar todos os nós e relacionamentos do banco
//MATCH (n) -[r] -> () DELETE n, r;
//MATCH (n) DELETE n;

// Todos os nós e relacionamentos do banco
MATCH (n) RETURN n

// CONSULTAS AO BANCO DE DADOS

// Quais produtos foram comprados pelo consumidor Joe?
MATCH
    (c:CONSUMIDOR{email:'joeee_baxton@example.com'}),
    (p:PRODUTO)
RETURN (c)-[:COMPROU]->(p);

// Quais consumidores compraram produtos? Quais foram esses produtos?
MATCH
    (c:CONSUMIDOR),
    (p:PRODUTO)
RETURN (c)-[:COMPROU]->(p);

// Quais produtos da categoria notebook foram adicionados a lista de compras ou visualizados por algum consumidor?
MATCH (:CONSUMIDOR)-[:ADDED_TO_WISH_LIST | :VIEWED]->(notebook:PRODUTO)-[:PERTENCE_A]->(:CATEGORIA {name:'Notebooks'})
RETURN notebook;

// Quais produtos foram promovidos para recomendação?
MATCH
    (o:OFERTAS_PROMOCIONAIS)-[:USED_TO_PROMOTE]->(p:PRODUTO)
RETURN o, p;

// Quais produtos e consumidores foram envolvidos com ofertas do tipo desconto de produtos?
MATCH
    (o:OFERTAS_PROMOCIONAIS {tipo:'discount_offer'})-[:USED_TO_PROMOTE]->(p:PRODUTO)<-[:ADDED_TO_WISH_LIST | :VIEWED]-(c:CONSUMIDOR)
RETURN o, p, c;