//
//  TableViewBuilder.swift
//  Stage2
//
//  Created by Daniil Murzin on 24.11.2024.
//

import UIKit

class TableViewBuilder: NSObject {
    
    private weak var tableView: UITableView?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - TableViewBuilder + UITableViewDelegate
extension TableViewBuilder: UITableViewDelegate {}

//MARK: - TableViewBuilder + UITableViewDataSource
extension TableViewBuilder: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
