//
//  TableViewBuilder.swift
//  Stage2
//
//  Created by Daniil Murzin on 24.11.2024.
//

import UIKit

final class TableViewBuilder: NSObject {
    
    private weak var tableView: UITableView?
    var sections: [TableViewSectionModel] = [] {
           didSet {
               tableView?.reloadData()
           }
       }
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - TableViewBuilder + UITableViewDelegate
extension TableViewBuilder: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
           let cellModel = sections[indexPath.section].cells[indexPath.row]
           cellModel.onSelect?()
           tableView.deselectRow(at: indexPath, animated: true)
       }
       
       func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
       ) -> CGFloat {
           return sections[section].header?.height ?? 0
       }
       
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           guard let headerModel = sections[section].header else { return nil }
           let label = UILabel()
           label.text = headerModel.title
           label.textAlignment = .center
           label.backgroundColor = .lightGray
           return label
       }
}

//MARK: - TableViewBuilder + UITableViewDataSource
extension TableViewBuilder: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return sections.count
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].cells.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellModel = sections[indexPath.section].cells[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellModel.identifier,
            for: indexPath
        )
        cellModel.onFill?(cell)
        return cell
    }
}
