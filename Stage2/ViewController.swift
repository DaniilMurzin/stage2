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

    //MARK: - Properties
    private var tableView: UITableView
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    //MARK: - Init
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

