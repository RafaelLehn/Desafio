//
//  detalhesProdutosViewController.swift
//  desafio
//
//  Created by Webeleven on 14/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class detalhesProdutosViewController: UIViewController{
    
    
    @IBOutlet weak var likeView: UIView!
    
    @IBOutlet weak var ball1: UIView!
    @IBOutlet weak var ball2: UIView!
    @IBOutlet weak var ball3: UIView!
    @IBOutlet weak var ball4: UIView!
    @IBOutlet weak var ball5: UIView!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var codigoLabel: UILabel!
    @IBOutlet weak var precoAntigo: UILabel!
    @IBOutlet weak var precoAtual: UILabel!
    @IBOutlet weak var parcelado: UILabel!
    @IBOutlet weak var desconto: UIView!
    @IBOutlet weak var descontoLabel: UILabel!
    
    @IBOutlet weak var instalacaoLabel: UILabel!
    @IBOutlet weak var parceladoLabel: UILabel!
    @IBOutlet weak var controleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var descricaoLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var comprarButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var megamamuteButton: UIButton!
    var currencies = [Imagens]()
    
    @IBAction func close(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Layout()
        
        Produtos()
        
        Underline()
    }
    
    func Layout(){
        ball1.layer.cornerRadius = 10
        ball2.layer.cornerRadius = 10
        ball3.layer.cornerRadius = 10
        ball4.layer.cornerRadius = 10
        ball5.layer.cornerRadius = 10
        likeView.layer.cornerRadius = 15
        desconto.layer.cornerRadius = 10
        comprarButton.layer.cornerRadius = 20
        mapButton.layer.cornerRadius = 5
        megamamuteButton.layer.borderWidth = 1
        megamamuteButton.layer.borderColor = megamamuteButton.tintColor.cgColor
        likeView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    func Underline(){
        
        let underlineAttribute = [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        precoAntigo.attributedText = underlineAttributedString
    }

    func Produtos(){
            let url = "http://www.mocky.io/v2/5d1b4fd23400004c000006e1"
            
            AF.request(url).responseJSON(completionHandler: {
                response in
                if let locationJSON = response.value as? [String:Any] {
                    self.nomeLabel.text = locationJSON["nome"] as! String
                    self.descricaoLabel.text = locationJSON["descricao"] as! String
                    
                    let categorias = locationJSON["categorias"] as! [[String:Any]]
                    
                    let modelo = locationJSON["modelo"] as! [String:Any]
                    
                    let padrao = modelo["padrao"] as! [String:Any]
                    
                    let preco = padrao["preco"] as! [String:Any]
                    
                    let imagens = padrao["imagens"] as! [[String:Any]]
                    
                    for dataImagens in imagens{
                        let currency = Imagens(
                            
                            imagemUrl: dataImagens["url"] as! String
                        )
                        self.currencies.append(currency)
                    }

                    // preços
                    self.codigoLabel.text = String("Cód. Item \(padrao["sku"]!)") as! String
                    self.precoAntigo.text = String("R$ \(preco["precoAnterior"]!)") as! String
                    self.precoAtual.text = String("R$ \(preco["precoAtual"]!)") as! String
                    self.parcelado.text = String("ou em até \(preco["planoPagamento"]!)") as! String
                    self.descontoLabel.text = String("- \(preco["porcentagemDesconto"]!)%") as! String
                    
                    // serviços
                    let servicos = padrao["servicos"] as! [[String:Any]]
                    let item = servicos[0]
                    self.instalacaoLabel.text = item["nome"] as! String
                    self.parceladoLabel.text = item["parcelamento"] as! String
                }
                self.collectionView.reloadData()
            })
    }
    
}

extension detalhesProdutosViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.currencies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! collectionViewCell
        let currences = currencies[indexPath.row]
        cell.updateInfo(goal: currences)
        print(currencies[indexPath.row])
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}
