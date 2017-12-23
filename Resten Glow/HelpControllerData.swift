//
//  ExampleData.swift
//  Examples
//
//  Created by Yong Su on 7/30/17.
//  Copyright © 2017 jeantimex. All rights reserved.
//

import Foundation

//
// MARK: - Section Data Structure
//
public enum HelpCategory {
    case rezervation
    case payment
    case products
    case services
    case def
}
public var category = HelpCategory.def {
    didSet {
    getSections()
    }
}
public struct Item {
    public var name: String
    public init(name: String) {
        self.name = name
    }
}

public struct Section {
    public var name: String
    public var items: [Item]
    
    public init(name: String, items: [Item]) {
        self.name = name
        self.items = items
    }
}


public  var sectionsData: [Section] =  [ Section(name: "", items: [
    Item(name: ""),
    ])]

func getSections()  {
    switch category {
    case .rezervation:
        sectionsData = rezervationData
    case .payment:
        sectionsData =  paymentData
    case .products:
        sectionsData =  productsData
    case .services:
        sectionsData = servicesData
    case .def:
        sectionsData = [ Section(name: "", items: [
            Item(name: ""),
            ])]
    }
}

var rezervationData = [
  
    Section(name: "-Nasıl rezervasyon yapabilirim?", items: [
        Item(name: "Düşündüğün rezervasyon saatinden en az iki saat, en fazla 8 hafta öncesinde IOS aplikasyonundan rezervasyonunuzu yapabilirsin."),
        ]),
    Section(name: "-İşlem ne kadar sürecek?", items: [
        Item(name: "Hizmet süreleri işlem tipine göre değişmektedir. Kaş alımı 20 dk iken fön ve manikür 45 dk, topuz, makyaj ve pedikür 60 dk, manikür ve pedikür beraber alınırsa 90 dk yı bulabilmektedir."),
        ]),
    Section(name: "- Nasıl hazırlanırım?", items: [
        Item( name: "Fön işlemi için çok yeni yıkanmış saçı önerirken topuzda en iyi sonucu almak için bir gün öncesinde yıkanmış saç çok daha iyi olacaktır.\nMakyaj artistimiz gelmeden önce yüzünü makyajdan arındırman ve temizlemeni öneriyoruz.\nGüzellik uzmanlarımız ekipmanlarıyla ve ürünleriyle gelecekler ama lütfen bir alerjin varsa önceden bildir.\nSaç stilistlerimizin sıcak ekipmanlarını kullanabilmesi için oturacağın yere yakın bir yerde prizin olması gerekiyor. Makyaj artistlerimiz için ise ekipmanlarını koyabilecekleri bir alan yaratman yeterli olacak. Bu çok önemli çünkü saatinde işleme başlayıp bitirebilmek istiyoruz.\nRest&Glow olarak hayvanları çok seviyoruz ama bazı güzellik uzmanlarımızın alerjileri veya korkuları olabiliyor. Eğer evcil hayvanın varsa güzellik uzmanımız gelmeden önce hizmet verilen odadan uzaklaştırmanı istiyoruz."),
        ]),
    Section(name: "-Aplikasyonda istediğim saatte rezervasyon yapamıyorsam ne yapmalıyım?", items: [
        Item(name: "Tüm randevularımız güzellik uzmanlarımız uygun olduğu saatlere göre ayarlanır, eğer yapamıyorsan muhtemelen müsait bir uzmanımız yoktur. Ama sen yine de böyle bir durumda kalırsan  bizi ara, elimizden gelen birşey var mı bakalım."),
        ]),
    Section(name: "Rezervasyonumu iptal etmek istersem nasıl yaparım?", items: [
        Item(name: "-Rezervasyon iptallerini veya rezervasyon saati değişikliklerini rezervasyon saatinden 1 gün öncesinde öncesinde aplikasyon üzerinden veya rezervasyon@restandglow.com adresine mail atarak ücretsiz olarak yapabilirsin. Rezervasyon saatine 4 saatten az bir zaman kalmışsa ve hizmeti iptal etmek istiyorsan hizmet bedelinin %50 si, 1 saat ve daha az zaman kaldıysa hepsi kredi kartından çekilir.")
        ])
]
var paymentData = [
    Section(name: "-Nasıl ödeme yapabilirim?", items: [
        Item(name: "- Ödemeleri kredi kartı ile kabul ediyoruz.")
        ])
]

var productsData = [
    Section(name: "Güzellik uzmanı hangi ürünleri yanında getiriyor?", items: [
        Item(name: "-Saç stilistlerimizin her biri fön makinesi,fön fırçaları, düzleştirici, maşa ve Loreal ürünlerini, makyaj artistlerimiz bir çok çeşitte yüksek kalite markayı barındıran bir makyaj kiti, maniküristlerimiz ise manikür ve pedikür kabı, aseton, tek kullanımlık havlu, yumuşatıcı losyon, sterilizatör, standart ve kalıcı oje taşırlar.")
        ]),
    Section(name: "Makyajıma takma kirpik ekleyebilir miyim?", items: [
        Item(name: "-Evet! Makyajı satın alırken ek hizmet olarak takma kirpiği de sepetine atabilirsin.")
        ]),
    
]
var servicesData = [
    Section(name: "Hangi şehirlerde hizmet alabilirim?", items: [
        Item(name: "-Şuan sadece İstanbul' da hizmet veriyoruz.")
        ]),
    Section(name: "Saç. makyaj, manikür/pedikür dışında bir hizmet veriyor musunuz?", items: [
        Item(name: "- Bu hizmetlere ekleyebileceğiniz kaş ve dudak üstü alımı hizmetimiz de var.")
        ]),
    Section(name: "Hediye bir hizmet satın alabiliyor muyum?", items: [
        Item(name: "- Evet, hediye kart satın alabilir ve bunu hediye edebilirsin.")
        ]),
    Section(name: "Evime/ ofisime gelecek olan uzmanlar kim?", items: [
        Item(name: "- Güzellik uzmanlarımızın hepsi geçmişlerine, karakterlerine ve yeteneklerine bakılarak teker teker seçilmiş kabiliyetli uzmanlardır.")
        ])
]


