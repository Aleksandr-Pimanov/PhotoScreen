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
            Section(item: [ItemCell(image: "1", title: "Недавние", subtitle: "127"),
                           ItemCell(image: "2", title: "Недавние", subtitle: "400"),
                           ItemCell(image: "3", title: "Недавние", subtitle: "32"),
                           ItemCell(image: "4", title: "Недавние", subtitle: "442"),
                           ItemCell(image: "5", title: "Недавние", subtitle: "142"),
                           ItemCell(image: "6", title: "Недавние", subtitle: "345"),
                           ItemCell(image: "7", title: "Недавние", subtitle: "24")]),
            
            Section(item: [ItemCell(image: "8", title: "Недавние", subtitle: "31"),
                           ItemCell(image: "11", title: "Недавние", subtitle: "65")]),

            Section(item: [ItemCell(image: "video", title: "Видео", subtitle: "44",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "62",                                  additionalElements:"chevron.forward"),
                           ItemCell(image: "livephoto", title: "Лайф-фото", subtitle: "3",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "643",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "13",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "56",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "6",
                                    additionalElements: "chevron.forward")]),
            
            Section(item: [ItemCell(image: "video", title: "Видео", subtitle: "127",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "23",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "52",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "0",
                                    additionalElements: "chevron.forward")])
        ]
    }
}
