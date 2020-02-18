//
//  Currency.swift
//  desafio
//
//  Created by Webeleven on 11/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import Foundation

class Inicial: NSObject {
    var id: Int!
    var sku: Int!
    var name: String!
    var imagemUrl: String!
    var precoAnterior: Int?
    var precoAtual: Int?
    var planoPagamento: String?

    init(id: Int, sku: Int, name: String, imagemUrl: String) {
        super.init()

        self.id = id
        self.sku = sku
        self.name = name
        self.imagemUrl = imagemUrl
       // self.classificacao = classificacao
//        self.precoAnterior = preco["precoAnterior"] as? Int
//        self.precoAtual = preco["precoAtual"] as? Int
//        self.planoPagamento = preco["planoPagamento"] as? String
    }
}
