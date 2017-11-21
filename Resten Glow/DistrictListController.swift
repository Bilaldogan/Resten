//
//  DistrictListController.swift
//  Resten Glow
//
//  Created by bilal on 21/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
protocol DistrictListDelegate {
    func districtSelected(selectedDistrict: String)
}
class DistrictListController: UITableViewController {
    var delegate : DistrictListDelegate?
    let districtList = ["Adalar","Arnavutköy","Ataşehir","Avcılar","Bağcılar","Bahçelievler","Bakırköy","Başakşehir","Bayrampaşa","Beşiktaş","Beykoz","Beylikdüzü","Beyoğlu","Büyükçekmece","Çatalca","Çekmeköy","Esenler","Esenyurt","Eyüp","Fatih","Gaziosmanpaşa","Güngören","Kadıköy","Kâğıthane","Kartal","Küçükçekmece","Maltepe","Pendik","Sancaktepe","Sarıyer","Silivri","Sultanbeyli","Sultangazi","Şile","Şişli","Tuzla","Ümraniye", "Üsküdar" , "Zeytinburnu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 39
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = districtList[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView(self.tableView, cellForRowAt: indexPath)
        self.delegate?.districtSelected(selectedDistrict: (cell.textLabel?.text)!)
        self.willMove(toParentViewController: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
        
    }


   
}
