//
//  ViewController.swift
//  Stage2
//
//  Created by Daniil Murzin on 24.11.2024.
//

/*
 Реализовать класс, который позволяет конструировать таблицу из кода в декларативном стиле.
 **Пример использования**: есть экран, на котором имеется **UITableView**. Создаем инстанс класса, например:


 self.tableViewBuilder = TableViewBuilder(tableView: self.tableView)


Далее создаем и устанавливаем ему секции, которые заполнены, соответственно моделями ячеек. Должна быть возможность настраивать ячейки через closure.

  let cellModel = TableViewCellModel(identifier: “customIdentifier”)cellModel.onFill = { ... }***

Также возможность обработать тап по ячейке – также вызывать соответствующую closure (например onSelect).


  cellModel.*onSelect *= { ... }

Пример секции:


let sectionModel = TableViewSectionModel(cells: [cellModel])
sectionModel.header = TableViewHeaderModel(...)
self.tableViewBuilder.sections = [sectionModel]**
 // в этот момент можно вызвать например **reloadData**.*


Т.е. пусть таблица обновляет представление тогда, когда мы переустанавливаем модели секций. Создать какой-нибудь тестовый экран с разными ячейками и любым наполнением, используя декларативный подход и наш новый класс. При выполнении задания нужно построить работу с помощью **gitFlow**.
*/

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private var tableViewBuilder: TableViewBuilder!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        setupTableView()
        setupTableViewBuilder()
    }
    
    // MARK: - Private Methods
    private func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableViewBuilder() {
        tableViewBuilder = TableViewBuilder(tableView: tableView)
        
        let cellModel1 = TableViewCellModel(identifier: "defaultCell")
        cellModel1.onFill = { cell in
            cell.textLabel?.text = "First Cell"
            cell.backgroundColor = .cyan
        }
        cellModel1.onSelect = {
            print("First cell selected!")
        }
        
        let cellModel2 = TableViewCellModel(identifier: "defaultCell")
        cellModel2.onFill = { cell in
            cell.textLabel?.text = "Second Cell"
            cell.backgroundColor = .yellow
        }
        cellModel2.onSelect = {
            print("Second cell selected!")
        }
        
        let section1 = TableViewSectionModel(cells: [cellModel1, cellModel2])
        section1.header = TableViewHeaderModel(title: "Section 1")
        
        let cellModel3 = TableViewCellModel(identifier: "defaultCell")
        cellModel3.onFill = { cell in
            cell.textLabel?.text = "Another Cell in Section 2"
            cell.backgroundColor = .green
        }
        cellModel3.onSelect = {
            print("Cell in Section 2 selected!")
        }
        
        let section2 = TableViewSectionModel(cells: [cellModel3])
        section2.header = TableViewHeaderModel(title: "Section 2")
        
        tableViewBuilder.sections = [section1, section2]
    }
}

