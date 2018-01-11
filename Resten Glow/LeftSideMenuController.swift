//
//  RightSideMenuController.swift
//  App To Rich
//
//  Created by Baran on 7.10.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class LeftSideMenuController: BaseController,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var mailLabel: UILabel!
    var tableView: UITableView?
    var window: UIWindow?

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            self.tableView = UITableView.init(frame: CGRect(x: 0, y: (self.view.frame.size.height - 100 * menuItemCount) / 2.0, width: self.view.frame.size.width, height: 100 * menuItemCount), style: UITableViewStyle.plain)
            
        case .phone:
            self.tableView = UITableView.init(frame: CGRect(x: 0, y: (self.view.frame.size.height - 54 * menuItemCount) / 2.0, width: self.view.frame.size.width, height: 54 * menuItemCount), style: UITableViewStyle.plain)
        default:
            break
        }
        
        
        tableView?.autoresizingMask = [UIViewAutoresizing.flexibleTopMargin, UIViewAutoresizing.flexibleBottomMargin, UIViewAutoresizing.flexibleWidth]
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.isOpaque = false
        tableView?.backgroundColor = UIColor.clear
        tableView?.backgroundView = nil
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView?.bounces = false
        tableView?.scrollsToTop = false
        self.view.backgroundColor = UIColor.clear
        
        
        self.view.addSubview(self.tableView!)
        self.mailLabel.text = UserPrefence.getUserMail()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
   
    @IBAction func exitAppButtonAct(_ sender: Any) {
        let alert = UIAlertController(title: "Rest & Glow", message: "Çıkış yapmak istediğinize emin misiniz?", preferredStyle: UIAlertControllerStyle.alert)
        DispatchQueue.main.async {
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Evet", style: UIAlertActionStyle.default, handler: { action in
                print("Click Yes")
                UserPrefence.setUserLoginStatus(isLogin: false)
                UserPrefence.removeUserId()
                UserPrefence.removeUserMail()
                UserPrefence.removeoneSignalUserId()
                UserPrefence.removeGSM()
                UserPrefence.removeUserName()
                CoreDataSupporter.removeAllData()
                self.window = UIWindow(frame: UIScreen.main.bounds)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "WelcomeControllerID")
                self.window?.rootViewController = initialViewController
                self.window?.makeKeyAndVisible()
            }))
            alert.addAction(UIAlertAction(title: "Hayır", style: UIAlertActionStyle.cancel, handler: nil))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(menuItemCount)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("MenuCustomCell", owner: self, options: nil)?.first as! MenuCustomCell
        cell.customLabel.text = labelTextArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            return 100
        case .phone:
            return 54
        default:
            return 54
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        switch  indexPath.row {
        case 0:
            self.goToAllProductController()
        case 1:
            goToAccountDetailController()
        case 2:
            goToAllOrderController()
        case 3:
            goToWeddingController()
        case 4:
            goToContactController()
        case 5:
            goToHelpController()
        default:
            break
        }
        
        
    }
    

    
    
    func goToAllProductController(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myProfileVC = storyboard.instantiateViewController(withIdentifier: ScrennID.ALL_PRODUCT_CONTROLLER_ID.rawValue) as! AllProductsController
        let obj : UINavigationController = self.sideMenuViewController?.contentViewController as! UINavigationController
        obj .pushViewController(myProfileVC, animated: true)
        self.sideMenuViewController!.hideMenuViewController()
        
    }
    
    func goToWeddingController(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myProfileVC = storyboard.instantiateViewController(withIdentifier: ScrennID.Wedding_CONTROLLER_ID.rawValue)
        let obj : UINavigationController = self.sideMenuViewController?.contentViewController as! UINavigationController
        obj .pushViewController(myProfileVC, animated: true)
        self.sideMenuViewController!.hideMenuViewController()
        
    }
    
    func goToAccountDetailController(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myProfileVC = storyboard.instantiateViewController(withIdentifier: "MyAcoountControllerID") as! MyAccountController
        let obj : UINavigationController = self.sideMenuViewController?.contentViewController as! UINavigationController
        obj .pushViewController(myProfileVC, animated: true)
        self.sideMenuViewController!.hideMenuViewController()
        
    }
    
    func goToContactController(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myProfileVC = storyboard.instantiateViewController(withIdentifier: "ContactControllerID")
        let obj : UINavigationController = self.sideMenuViewController?.contentViewController as! UINavigationController
        obj .pushViewController(myProfileVC, animated: true)
        self.sideMenuViewController!.hideMenuViewController()
    }
    
    func goToHelpController(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myProfileVC = storyboard.instantiateViewController(withIdentifier: ScrennID.HELP_CONTROLLER_ID.rawValue) as! HelpController
        let obj : UINavigationController = self.sideMenuViewController?.contentViewController as! UINavigationController
        obj .pushViewController(myProfileVC, animated: true)
        self.sideMenuViewController!.hideMenuViewController()
        
    }
    func goToAllOrderController(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myProfileVC = storyboard.instantiateViewController(withIdentifier: ScrennID.ALL_ORDER_LIST_CONTROLLER_ID.rawValue) as! AllOrderListController
        let obj : UINavigationController = self.sideMenuViewController?.contentViewController as! UINavigationController
        obj .pushViewController(myProfileVC, animated: true)
        self.sideMenuViewController!.hideMenuViewController()
        
    }

    

    func goToExitApp() {
        
        let alert = UIAlertController(title: "App To Rich", message: "Çıkış yapmak istediğinize emin misiniz?", preferredStyle: UIAlertControllerStyle.alert)
        DispatchQueue.main.async {
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Evet", style: UIAlertActionStyle.default, handler: { action in
                print("Click Yes")
                //UserPrefence.saveUserLoginStatus(isLogin: false)
                //UserPrefence.removeUserId()
                //UserPrefence.removeUserMail()
                //UserPrefence.removeoneSignalUserId()
                //UserPrefence.removeRefNo()
                self.window = UIWindow(frame: UIScreen.main.bounds)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "WelcomeControllerID")
                self.window?.rootViewController = initialViewController
                self.window?.makeKeyAndVisible()
            }))
            alert.addAction(UIAlertAction(title: "Hayır", style: UIAlertActionStyle.cancel, handler: nil))
        }
        self.present(alert, animated: true, completion: nil)
        
    }

    
    let imageArray : Array = ["ev","liste","kilit","question","odul","cikis"]
    let labelTextArray : Array = ["ANASAYFA","PROFİLİM","SİPARİŞLERİM","DÜĞÜN","İLETİŞİM","YARDIM","PAYLAŞ"]
    let menuItemCount : CGFloat = 6
    
    
}
