//
//  EditText.swift
//  SceneBasedStateRestoration-Article
//
//  Created by Vadym Bulavin on 10/31/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import SwiftUI

struct EditText: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Enter some text here", text: $text)
            .multilineTextAlignment(.center)
    }
}
