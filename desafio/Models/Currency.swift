//
//  Currency.swift
//  desafio
//
//  Created by Webeleven on 11/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import Foundation

class Currency: NSObject {
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

    init(id: Int, sku: Int, name: String, descricao: String, imagemUrl: String, classificacao: Int, preco: [String:Any]) {
        super.init()

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
