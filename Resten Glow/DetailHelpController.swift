//
//  DetailHelpController.swift
//  Resten Glow
//
//  Created by bilal on 26/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
class DetailHelpController: CollapsibleTableSectionViewController {
    
    @IBOutlet weak var customNavigaiton: CustomNavigationView!
    var sections: [Section] = sectionsData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customNavigaiton.navDelegate = self
        if let title = data as? String {
            self.customNavigaiton.title = title
        }
        self.delegate = self
    }
    
}
extension DetailHelpController: CollapsibleTableSectionDelegate {
    
    func numberOfSections(_ tableView: UITableView) -> Int {
        return sections.count
    }
    
    func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomCell ??
            CustomCell(style: .default, reuseIdentifier: "Cell")
        
        let item: Item = sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row]
        
        cell.nameLabel.text = item.name
        
        return cell
    }
    func collapsibleTableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func collapsibleTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    func shouldCollapseByDefault(_ tableView: UITableView) -> Bool {
        return true
    }

}
extension DetailHelpController : CustomNavigationViewDelegate {
    internal func backButtonTapped() {
        self.back()
    }
}
