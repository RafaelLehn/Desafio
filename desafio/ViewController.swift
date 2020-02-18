//
//  ViewController.swift
//  desafio
//
//  Created by Webeleven on 04/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

class ViewController: UIViewController {
    
    var currencies = [Inicial]()
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        accountButton.layer.cornerRadius = 5
        Ofertas()
        
        // Do any additional setup after loading the view.
    }
    
    func Ofertas(){
        let url = "http://www.mocky.io/v2/5d1b507634000054000006ed"
        AF.request(url).responseJSON(completionHandler: {
            response in
            if let locationJSON = response.value as? [[String:Any]]{
                
                let data = locationJSON as! [[String: Any]]
                for dataItem in data{
                    let inicial =  Inicial(
                    id: dataItem["id"] as! Int,
                    sku: dataItem["sku"] as! Int,
                    name: dataItem["nome"] as! String,
                    imagemUrl: dataItem["imagemUrl"] as! String
                   // classificacao: dataItem["classificacao"] as! Int
                    
                        
                    )
                    
                    self.currencies.append(inicial)
                    print(self.currencies)
                    self.collectionView.reloadData()
                
                }
            }
        })
    }

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.currencies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! collectionViewCell
        let currences = currencies[indexPath.row]
        cell.UpdateInicial(goal: currences)
        print(currencies[indexPath.row])
        
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
