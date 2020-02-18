//
//  imagens.swift
//  desafio
//
//  Created by Webeleven on 18/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import Foundation
class Imagens: NSObject {
    
    var imagemUrl: String!

init(imagemUrl: String) {
    super.init()
    self.imagemUrl = imagemUrl
    }
}
