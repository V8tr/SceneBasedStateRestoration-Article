//
//  SceneDelegate.swift
//  SceneBasedStateRestoration-Article
//
//  Created by Vadym Bulavin on 10/29/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if window == nil {
            self.window = (scene as? UIWindowScene)?.makeKeyWindow(makeInitialViewController())
        } else if let activity = connectionOptions.userActivities.first ?? session.stateRestorationActivity {
            restoreState(activity)
        }
    }
    
    private func restoreState(_ activity: NSUserActivity) {
        var view = ContentView()
        
        if let textInput = TextInput.restored(from: activity) {
            
        }
//        if let detailViewController = DetailViewController.loadFromStoryboard() {
//            if let navigationController = window?.rootViewController as? UINavigationController {
//                navigationController.pushViewController(detailViewController, animated: false)
//                detailViewController.restoreUserActivityState(activity)
//                return true
//            }
//        }
    }
    
    private func makeInitialViewController() -> UIViewController {
        return UIHostingController(rootView: ContentView())
    }
}

private extension UIWindowScene {
    func makeKeyWindow(_ root: UIViewController) -> UIWindow {
        let window = UIWindow(windowScene: self)
        window.rootViewController = root
        window.makeKeyAndVisible()
        return window
    }
}
