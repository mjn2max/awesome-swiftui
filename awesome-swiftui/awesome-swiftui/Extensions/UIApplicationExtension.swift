//
// UIApplicationExtension.swift
// awesome-swiftui
//
// Created by Huy D. on 11/4/23
// mjn2max.github.io 😜
// 
// Copyright © 2023. All rights reserved.
// mjn2max.com
//

import UIKit

extension UIApplication {
    var rootViewController: UIViewController {
        guard let window = connectedScenes.first as? UIWindowScene,
              let rootViewController = window.windows.last?.rootViewController else {
            return .init()
        }
        return rootViewController
    }
    
    // Use: UIApplication.shared.closeKeyboard()
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
