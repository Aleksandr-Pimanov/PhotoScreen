//
//  PhotoTabBarController.swift
//  PhotoScreen
//
//  Created by Aleksandr Pimanov on 04.09.2022.
//

import UIKit

class PhotoTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        setupBar()
    }
    
    func setupTabBarController() {
        tabBar.tintColor = .systemGray
        tabBar.backgroundColor = .white
    }
    
    func setupBar() {
            let media = createNavigationContoller(viewContoller: MediaViewController(), itemName: "Медиа", itemImage: "photo.on.rectangle.fill")
            let memories = createNavigationContoller(viewContoller: MemoriesViewController(), itemName: "Для Вас", itemImage: "heart.text.square.fill")
            let albums = createNavigationContoller(viewContoller: AlbumsViewController(), itemName: "Альбомы", itemImage: "rectangle.stack.fill")
            let search = createNavigationContoller(viewContoller: SearchViewController(), itemName: "Поиск", itemImage: "magnifyingglass")

            viewControllers = [media, memories, albums, search]
        }

        func createNavigationContoller(viewContoller: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
            let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), selectedImage: UIImage(systemName: itemImage))
            let navigationContoller = UINavigationController(rootViewController: viewContoller)
            navigationContoller.tabBarItem = item
            return navigationContoller
    }
}
