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

    @IBOutlet weak var pageControl: UIPageControl!
    let images = ["MakeUp","Hair-Cut-1","manikur"]
    let descTexts = ["Yetenekli güzellik uzmanlarımız istediğin güzellik hizmetini sana getirecek.","Hizmet almak istediğin saati, yeri ve ödeme tipini seç, biz detaylarla ilgili mailini gönderelim.","Yetenekli güzellik uzmanlarımız, kaliteli ürünlerle kapında belirsin ve seni istediğin bakıma ulaştırsın."]
    let headerTexts = ["Hayal et!","Rezervasyon yap!","Gerçekleştir!"]
    @IBOutlet var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(UINib(nibName: "PagerViewCell", bundle: nil), forCellWithReuseIdentifier: "pagerViewCell")
            pagerView.dataSource = self
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    cell.headerLabel.text = headerTexts[index]
    self.pageControl.currentPage = index
    return cell
}
}
