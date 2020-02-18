//
//  Product.swift
//  desafio
//
//  Created by Webeleven on 17/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import Foundation
class Product: NSObject {
    
    var modelo: [String:Any]!
    var padrao: [String:Any]!
    var id: Int!
    var sku: Int!
    var name: String!
    var descricao: String!
    var imagemUrl: String!
    var classificacao: Int!
    var preco: [String:Any]!
    var precoAnterior: Int?
    var precoAtual: Int?
    var planoPagamento: String?

    init(modelo: [String:Any], padrao: [String:Any], id: Int, sku: Int, name: String, descricao: String, imagemUrl: String, classificacao: Int, preco: [String:Any]) {
        super.init()

        self.modelo = modelo
        self.padrao = padrao
        self.id = id
        self.sku = sku
        self.name = name
        self.descricao = descricao
        self.imagemUrl = imagemUrl
        self.classificacao = classificacao
        self.preco = preco
        self.precoAnterior = preco["precoAnterior"] as? Int
        self.precoAtual = preco["precoAtual"] as? Int
        self.planoPagamento = preco["planoPagamento"] as? String
    }
}
