//
//  TableViewHeaderModel.swift
//  Stage2
//
//  Created by Daniil Murzin on 24.11.2024.
//

import UIKit

final class TableViewHeaderModel {
    var title: String
    var height: CGFloat
    
    init(title: String, height: CGFloat = 40) {
        self.title = title
        self.height = height
    }
}
