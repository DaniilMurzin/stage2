//
//  TableViewCellModel.swift
//  Stage2
//
//  Created by Daniil Murzin on 24.11.2024.
//

import UIKit

final class TableViewCellModel  {
    
    let identifier: String
    var onFill: ((UITableViewCell) -> Void)?
    var onSelect: (() -> Void)?
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
}


