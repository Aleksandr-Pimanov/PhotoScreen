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
                           ItemCell(image: "2", title: "Места", subtitle: "400"),
                           ItemCell(image: "3", title: "WhatsApp", subtitle: "32"),
                           ItemCell(image: "4", title: "Избранное", subtitle: "442"),
                           ItemCell(image: "5", title: "Instagram", subtitle: "142"),
                           ItemCell(image: "6", title: "Lightroom", subtitle: "345"),
                           ItemCell(image: "7", title: "Snapsees", subtitle: "24")]),
            
            Section(item: [ItemCell(image: "8", title: "Люди", subtitle: "31"),
                           ItemCell(image: "11", title: "Места", subtitle: "65")]),

            Section(item: [ItemCell(image: "video", title: "Видео", subtitle: "44",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "person.crop.square", title: "Селфи", subtitle: "62",                                  additionalElements:"chevron.forward"),
                           ItemCell(image: "livephoto", title: "Лайф-фото", subtitle: "3",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "cube", title: "Портреты", subtitle: "643",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "slowmo", title: "Замедленно", subtitle: "13",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "square.stack.3d.down.right", title: "Серии", subtitle: "56",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "camera.viewfinder", title: "Снимки экрана", subtitle: "6",
                                    additionalElements: "chevron.forward")]),
            
            Section(item: [ItemCell(image: "square.and.arrow.down", title: "Импортированные", subtitle: "23",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "eye.slash", title: "Скрытые", subtitle: "52",
                                    additionalElements: "chevron.forward"),
                           ItemCell(image: "trash", title: "Недавно удаленные", subtitle: "0",
                                    additionalElements: "chevron.forward")])
        ]
    }
}
