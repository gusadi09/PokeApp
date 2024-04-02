//
//  UIApplication+Ext.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import SwiftUI
import UIKit

extension UIApplication {
    var rootViewController: UIViewController {
        guard let screen = connectedScenes.first as? UIWindowScene,
              let root = screen.windows.first?.rootViewController
        else { return .init() }
        return root
    }
}
