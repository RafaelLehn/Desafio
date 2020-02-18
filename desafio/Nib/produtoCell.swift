//
//  produtoCell.swift
//  desafio
//
//  Created by Webeleven on 12/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class produtoCell: UITableViewCell{
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var precoAntigo: UILabel!
    @IBOutlet weak var precoAtual: UILabel!
    @IBOutlet weak var precoParcelado: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    
    
    func updateInfo(goal: Currency){
        
        let underlineAttribute = [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        precoAntigo.attributedText = underlineAttributedString
        
        self.nome.text = goal.name
        
        let preco1 = "R$ \(String(goal.precoAnterior ?? 0))"
        let preco2 = "R$ \(String(goal.precoAtual ?? 0)),00"
        let preco3 = String(goal.planoPagamento ?? "")
        
        self.precoAntigo.text = preco1
        self.precoAtual.text = preco2
        self.precoParcelado.text = preco3
        self.imagem.kf.setImage(with: URL(string: goal.imagemUrl))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class UnderlinedLabel: UILabel {

override var text: String? {
    didSet {
        guard let text = text else { return }
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
        // Add other attributes if needed
        self.attributedText = attributedText
        }
    }
}
