//
//  TextInput.swift
//  SceneBasedStateRestoration-Article
//
//  Created by Vadym Bulavin on 10/29/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import SwiftUI

struct TextInput: View {
    @State var state = State()
    
    var body: some View {
        Text(state.title + "\n" + state.description)
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInput()
    }
}

extension TextInput {
    
    struct State: Codable {
        let title = ""
        let description = ""
    }
    
    enum Key {
        static let state = "State"
    }
    
    static func restored(from activity: NSUserActivity) -> TextInput? {
        guard activity.activityType == Bundle.main.activityType,
            let encodedState = activity.userInfo?[Key.state] as? Data,
            let state = try? JSONDecoder().decode(State.self, from: encodedState)
            else {
                return nil
        }
        
        return TextInput(state: state)
    }
}
