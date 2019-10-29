//
//  State.swift
//  SceneBasedStateRestoration-Article
//
//  Created by Vadym Bulavin on 10/30/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import Foundation

var appState = AppState()

class AppState: ObservableObject  {
    @Published var text = ""
    @Published var isEditing = false
}

// MARK: - State restoration

extension AppState {
    
    func restore(from activity: NSUserActivity) {
        guard activity.activityType == Bundle.main.activityType,
            let text = activity.userInfo?[Key.text] as? String,
            let isEditing = activity.userInfo?[Key.isEditing] as? Bool
            else { return }
        
        self.text = text
        self.isEditing = isEditing
    }
    
    func store(in activity: NSUserActivity) {
        activity.addUserInfoEntries(from: [Key.text: text, Key.isEditing: isEditing])
    }
    
    private enum Key {
        static let text = "text"
        static let isEditing = "isEditing"
    }
}
