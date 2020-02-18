//
//  collectionViewCell.swift
//  desafio
//
//  Created by Webeleven on 18/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class collectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var image: UIImageView!
    
    func updateInfo(goal: Imagens){
        
        self.image.kf.setImage(with: URL(string: goal.imagemUrl))
    }
    
    func UpdateInicial(goal: Inicial){
        
        self.image.kf.setImage(with: URL(string: goal.imagemUrl))
    }
    
}
