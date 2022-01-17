//
//  ViewController.swift
//  SettingApp
//
//  Created by Леся Акимова on 14.01.2022.
//

import UIKit

struct Settings {
    let text: String
    let image: UIImage?
    let imageBackgroundColor: UIColor
    let handler: (() -> Void)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        return tableView
    }()

    private lazy var cells = [Settings]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
            title = "Settings"
            view.addSubview(tableView)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.frame = view.bounds
        }

        private func configure() {
            self.cells = Array(0...100).compactMap({
                Settings(text: "Item \($0)", image: UIImage(systemName: "house"), imageBackgroundColor: .systemPink) {

                }
            })
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cells.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = cells[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath) as? SettingTableViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        }

}

