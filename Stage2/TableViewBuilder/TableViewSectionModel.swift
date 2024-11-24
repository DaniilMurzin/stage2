//
//  TableViewSectionModel.swift
//  Stage2
//
//  Created by Daniil Murzin on 24.11.2024.
//

import UIKit

final class TableViewSectionModel {
    
    var cells: [TableViewCellModel]
    var header: TableViewHeaderModel?
    var headerHight: CGFloat = 40
    
    init(cells: [TableViewCellModel]) {
        self.cells = cells
    }
}
