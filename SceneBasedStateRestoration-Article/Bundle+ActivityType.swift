//
//  Bundle+ActivityType.swift
//  SceneBasedStateRestoration-Article
//
//  Created by Vadym Bulavin on 10/29/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import Foundation

extension Bundle {
    var activityType: String? {
        return Bundle.main.infoDictionary?["NSUserActivityTypes"].flatMap { ids in
            return (ids as? [String])?.first
        }
    }
}
