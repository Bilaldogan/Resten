//
//  MyBagPopupController.swift
//  Resten Glow
//
//  Created by Baran on 24.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class MyBagPopupController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfigure()
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.shadowViewBottomConstraint.constant = -self.shadowView.frame.height
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.shadowViewBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    @IBAction func closePopupAct(_ sender: UIButton) {
        self.back(animated: true, isModal: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var shadowViewBottomConstraint: NSLayoutConstraint!
    
}

extension MyBagPopupController {
    
    func tableViewConfigure(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func configure(){
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.blurView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.blurEffect(customView: blurView)
        self.shadowView.addShadow(location: .top)
    }
    
}

extension MyBagPopupController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = Bundle.main.loadNibNamed("AddProductCell", owner: self, options: nil)?.first as! AddProductCell
            
            return cell
        default:
            let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return (self.tableView.frame.height - 10) / 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            switch section {
            case 2:
                return 5
            default:
                return 0.0001
            }
        case .phone:
            switch section {
            case 2:
                return 15
            default:
                return 0.0001
            }
        default:
            return 0.0001
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footerView : UIView!
        
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 15))
            footerView.backgroundColor = ColorUtil.lightGray
            
        case .phone:
            footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 5))
            footerView.backgroundColor = ColorUtil.lightGray
            
        default:
            break
        }
        return footerView
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            switch section {
            case 0:
                return 0
            default:
                return 0
            }
        case .phone:
            switch section {
            case 0:
                return 0
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView : UIView!
        var headerSmallView : UIView!
        var headerLabel : UILabel!
        
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
            headerView.backgroundColor = ColorUtil.lightGray
            headerSmallView = UIView(frame: CGRect(x: self.view.frame.width * 0.3, y: 80, width: self.view.frame.width * 0.7, height: 1.0))
            headerSmallView.backgroundColor = ColorUtil.purple
            
            headerLabel = UILabel(frame: CGRect(x: headerView.frame.width * 0.05, y: 0, width: headerView.frame.width * 0.9, height: 80))
            headerLabel.backgroundColor = UIColor.clear
            headerLabel.textColor = ColorUtil.purple
            headerLabel.textAlignment = .right
            headerLabel.font = UIFont(name: "JosefinSans-BoldItalic", size: 20)
            headerLabel.minimumScaleFactor = 6.0 / 10.0
        case .phone:
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
            headerView.backgroundColor = ColorUtil.lightGray
            headerSmallView  = UIView(frame: CGRect(x: self.view.frame.width * 0.3, y: 40, width: self.view.frame.width * 0.7, height: 1.0))
            headerSmallView.backgroundColor = ColorUtil.purple
            
            headerLabel = UILabel(frame: CGRect(x: headerView.frame.width * 0.05, y: 0, width: headerView.frame.width * 0.9, height: 40))
            headerLabel.textColor = ColorUtil.purple
            headerLabel.textAlignment = .right
            headerLabel.font = UIFont(name: "JosefinSans-BoldItalic", size: 13)
            headerLabel.minimumScaleFactor = 6.0 / 10.0
        default:
            break
        }
        
        switch section {
        case 0:
            headerLabel.text = ""
        case 1:
            headerLabel.text = "İSTEĞE GÖRE HİZMETLER"
            headerView.addSubview(headerSmallView)
            headerView.addSubview(headerLabel)
        default:
            break
        }
        
        return headerView
    }
}



