//
//  ViewController.swift
//  Resten Glow
//
//  Created by bilal on 26/10/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
import FSPagerView
class   WelcomeController: BaseController {

    let images = ["MakeUp","Hair-Cut-1","manikur"]
    let descTexts = ["Ünlü yıldızlar kahvenin hangi tonlarını kullanıyor? Saçlarında değişim olsun ama bu değişim son derece doğal görünsün istiyorsan kahve saç renkleri senin için ideal! Hatta kahve saçlar ünlü yıldızların da favori saç renklerinden. Şimdi, onların görünümlerinden ilham almaya ne dersin?","DOĞAL MAKYAJ Makyajınızın günlük hayatta doğal ve sade görünmesi çok önemli! Doğru renk tonlarında yokmuş gibi makyaj uygulaması için hemen tıklayın!","TIRNAKLAR Daha sağlıklı görünen, kırılmadan istediğiniz gibi uzayan gösterişli tırnaklara sahip olmanın ipuçları ve tırnak konusunda tüm öneriler makyaj.com'da"]
    @IBOutlet var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(UINib(nibName: "PagerViewCell", bundle: nil), forCellWithReuseIdentifier: "pagerViewCell")
            pagerView.dataSource = self
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if (navigationController?.topViewController != self) {
            navigationController?.navigationBar.isHidden = false
            navigationController?.navigationBar.tintColor = UIColor.black
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        }
        super.viewWillDisappear(animated)
    }


}

extension WelcomeController : FSPagerViewDataSource {
    
public func numberOfItems(in pagerView: FSPagerView) -> Int {
    return images.count
}

public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
    let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "pagerViewCell", at: index) as! PagerViewCell
    cell.imageView?.contentMode = .scaleAspectFill
    cell.imageView?.clipsToBounds = true
   cell.backImageView?.image = UIImage(named: images[index])
   cell.label.text = descTexts[index]
    return cell
}
}
