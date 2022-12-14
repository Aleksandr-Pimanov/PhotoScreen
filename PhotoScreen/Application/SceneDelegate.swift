//
//  SceneDelegate.swift
//  PhotoScreen
//
//  Created by новый пользователь on 02.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tabBarController = PhotoTabBarController()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
