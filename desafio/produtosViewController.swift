//
//  produtosViewController.swift
//  desafio
//
//  Created by Webeleven on 07/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class produtosViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBOutlet weak var ofertasLabel: UILabel!
    @IBOutlet weak var filterButton: UIButton!
    var currencies = [Currency]()
    @IBAction func closeView(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let produtoCell = UINib(nibName: "produtoCell", bundle: nil)
        tableview.register(produtoCell, forCellReuseIdentifier: "produtoGoalCell")
        
        tableview.rowHeight = 170
        tableview.estimatedRowHeight = 170
        
        self.filterButton.transform = self.filterButton.transform.rotated(by: CGFloat(M_PI_2))
        Produtos()
        
        tableview.reloadData()
       
        // Do any additional setup after loading the view.
    }
    
    func Produtos(){
        let url = "http://www.mocky.io/v2/5d1b4f0f34000074000006dd"
        
        AF.request(url).responseJSON(completionHandler: {
            response in
            if let locationJSON = response.value as? [String:Any] {
                
                let data = locationJSON["produtos"] as! [[String: Any]]
                for dataItem in data{
                    let currency =  Currency(
                    id: dataItem["id"] as! Int,
                    sku: dataItem["sku"] as! Int,
                    name: dataItem["nome"] as! String,
                    descricao: dataItem["descricao"] as! String,
                    imagemUrl: dataItem["imagemUrl"] as! String,
                    classificacao: dataItem["classificacao"] as! Int,
                    preco: dataItem["preco"] as! [String:Any])
                    
                
                    self.currencies.append(currency)
                    print(self.currencies.count)
                }
                
                self.ofertasLabel.text = "\(data.count) ofertas"
                self.tableview.reloadData()
                self.loading.removeFromSuperview()
            }
        })
    }
}

extension produtosViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let produtoCell = tableView.dequeueReusableCell(withIdentifier: "produtoGoalCell", for: indexPath) as! produtoCell
        let currences = currencies[indexPath.row]
        produtoCell.updateInfo(goal: currences)
        print(currencies.count)
        return produtoCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}


extension produtosViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goProductDetails", sender: nil)
    }
}
