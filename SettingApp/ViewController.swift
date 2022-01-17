//
//  ViewController.swift
//  SettingApp
//
//  Created by Леся Акимова on 14.01.2022.
//

import UIKit

struct Section {
    let title: String
    let options: [Settings]
}

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

    private lazy var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
            title = "Настройки"
            view.addSubview(tableView)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.frame = view.bounds
        }

        private func configure() {
            models.append(Section(title: "Связь", options: [
                
                Settings(text: "Авиарежим", image: UIImage(systemName: "airplane"), imageBackgroundColor: .systemOrange) {
                    print("Tapped first cell")
                },
                
                Settings(text: "Wi-Fi", image: UIImage(systemName: "wifi"), imageBackgroundColor: .systemPink) {
                },
                
                Settings(text: "Bluetooth", image: UIImage(systemName: "Bluetooth"), imageBackgroundColor: .link) {
                },
                
                Settings(text: "Сотовая связь", image: UIImage(systemName: "mobile data"), imageBackgroundColor: .systemGreen) {
                },
                
                Settings(text: "Режим модема", image: UIImage(systemName: "personal hotspot"), imageBackgroundColor: .systemGreen) {
                },
                
            ]))
            models.append(Section(title: "Основные", options: [
                
                Settings(text: "Основные", image: UIImage(systemName: "general"), imageBackgroundColor: .systemPink) {
                },
                
                Settings(text: "Пункт управления", image: UIImage(systemName: "control station"), imageBackgroundColor: .systemOrange) {
                },
                
                Settings(text: "Экран и яркость", image: UIImage(systemName: "screen and brightness"), imageBackgroundColor: .link) {
                },
                
                Settings(text: "Экран домой", image: UIImage(systemName: "screen house"), imageBackgroundColor: .systemGreen) {

                },
                
            ]))
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models[section].options.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = models[indexPath.section].options[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath) as? SettingTableViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }

}

