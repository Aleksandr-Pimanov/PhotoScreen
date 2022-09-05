//
//  Model.swift
//  PhotoScreen
//
//  Created by Aleksandr Pimanov on 02.09.2022.
//

import UIKit

struct ItemCell {
    var image: String?
    var title: String?
    var subtitle: String?
    var additionalImage: String?
    var additionalElements: String?
}

struct Section {
    var item: [ItemCell]
    
    static func configure() -> [Section] {
        return [
            Section(item: [ItemCell(image: "Image", title: "Недавние", subtitle: "127"),
                           ItemCell(image: "Image", title: "Недавние", subtitle: "400"),
                           ItemCell(image: "Image", title: "Недавние", subtitle: "342"),
                           ItemCell(image: "Image", title: "Недавние", subtitle: "342"),
                           ItemCell(image: "Image", title: "Недавние", subtitle: "342"),
                           ItemCell(image: "Image", title: "Недавние", subtitle: "342"),
                           ItemCell(image: "Image", title: "Недавние", subtitle: "342")]),
            
            Section(item: [ItemCell(image: "Image", title: "Недавние", subtitle: "127"),
                           ItemCell(image: "Image", title: "Недавние", subtitle: "342")]),

            Section(item: [ItemCell(image: "video", title: "Видео", subtitle: "127",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "400",                       additionalElements:"chevron.forward"),
                           ItemCell(image: "livephoto", title: "Лайф-фото", subtitle: "342",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "400",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "400",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "400",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "400",
                                    additionalElements: "chevron.forward")])
        ]
    }
}
