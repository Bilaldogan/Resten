//
//  ProductClass.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation


struct ProductProperties {
    var title : String = ""
    var desc : String = ""
}


struct HairStruct {
    var hairList : [ProductProperties] = []
    let productDictionary : [String : String] = ["Fön ₺50": "Düz, dalgalı fön veya maşa, saçlarınızın hangisiyle daha güzel olacağını düşüyorsanız (45 dk.).", "Topuz ₺85" : "Klasikliğin vazgeçilmezliği mi yoksa dağınık topuzun kendinden eminliği mi, karar sizin (60dk.)."]
    
    init() {
        var productProperties : ProductProperties = ProductProperties()
        for product in productDictionary {
            productProperties.title = product.key
            productProperties.desc = product.value
            hairList.append(productProperties)
        }
        
    }
    
}

struct MakeUpStruct {
    var makeUpList : [ProductProperties] = []
    let productDictionary : [String : String] = ["Makyaj ₺75": "Doğal, seksi veya hüzünlü. Sana ve moduna en uygun olanı yaratalım. (60dk.)"]
    
    init() {
        var productProperties : ProductProperties = ProductProperties()
        for product in productDictionary {
            productProperties.title = product.key
            productProperties.desc = product.value
            makeUpList.append(productProperties)
        }
        
    }
    
}

struct NailStruct {
    var nailList : [ProductProperties] = []
    let productDictionary : [String : String] = ["Manikür ₺35" : "Kusursuz ve hijyenik. İstersen hizmetlere kalıcı oje ekleyebilirsin. (45 dk.)", "Pedikür ₺50" : "Tecrübeli uzmanlarımızdan kusursuz ve hijyenik hizmet. İstersen hizmetlere kalıcı oje ekleyebilirsin.(60 dk.)", "Manikür ve Pedikür ₺75" : "Kusursuz ve hijyenik hizmet. İstersen hizmetlere kalıcı oje ekleyebilirsin.(90 dk.)"]
    
    init() {
        var productProperties : ProductProperties = ProductProperties()
        for product in productDictionary {
            productProperties.title = product.key
            productProperties.desc = product.value
            nailList.append(productProperties)
        }
        
    }

}

struct BrowStruct {
    var browUpList : [ProductProperties] = []
     let productDictionary : [String : String] = ["Kaş alma-şekillendirme ₺30": "Tecrübeli uzmanlarımızdan kaş alımı, dudak üstü alımını da ekleyebilirsin. (20 dk.)"]
    
    init() {
        var productProperties : ProductProperties = ProductProperties()
        for product in productDictionary {
            productProperties.title = product.key
            productProperties.desc = product.value
            browUpList.append(productProperties)
        }
        
    }
    
}

struct WeddingStruct {
    var weddingList : [ProductProperties] = []
    let productDictionary : [String : String] = ["Düğün": "Bu özel gününde hiç yerinden kımıldamayıp prensesler gibi geceye hazırlanmaya ne dersin? Sen ne istediğini söyle, birbirinden tecrübeli uzmanlarımız halletsin☺️"]
    
    init() {
        var productProperties : ProductProperties = ProductProperties()
        for product in productDictionary {
            productProperties.title = product.key
            productProperties.desc = product.value
            weddingList.append(productProperties)
        }
        
    }
    
}



