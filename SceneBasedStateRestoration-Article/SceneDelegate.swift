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
        attachKeyWindow(to: scene)

        if let activity = connectionOptions.userActivities.first ?? session.stateRestorationActivity {
            appState.restore(from: activity)
        }
    }

    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        let activity = NSUserActivity(activityType: Bundle.main.activityType)
        appState.store(in: activity)
        return activity
    }
    
    func attachKeyWindow(to scene: UIScene) {
        window = .keyWindow(scene: scene as! UIWindowScene, root: ContentView(state: appState))
    }
}

private extension UIWindow {
    static func keyWindow<View: SwiftUI.View>(scene: UIWindowScene, root: View) -> UIWindow {
        let window = UIWindow(windowScene: scene)
        window.rootViewController = UIHostingController(rootView: root)
        window.makeKeyAndVisible()
        return window
    }
}
