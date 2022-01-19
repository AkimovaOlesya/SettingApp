//
//  ViewController.swift
//  SettingApp
//
//  Created by Леся Акимова on 14.01.2022.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: Settings)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let text: String
    let image: UIImage?
    let imageBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
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
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        
        return tableView
    }()

    private lazy var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
            title = "Настройки"
            view.addSubview(tableView)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.frame = view.bounds
        }

        private func configure() {
            models.append(Section(title: "", options: [
                
                .switchCell(model: SettingsSwitchOption(text: "Авиарежим", image: UIImage(systemName: "airplane"), imageBackgroundColor: .systemOrange, handler: {
                    print("Нажата ячейка Авиарежим")
                }, isOn: false)),
                
                .staticCell(model: Settings(text: "Wi-Fi", image: UIImage(systemName: "wifi"), imageBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Wi-Fi")
                }),
                
                .staticCell(model: Settings(text: "Bluetooth", image: UIImage(named: "bluetooth"), imageBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Bluetooth")
                }),
                
                .staticCell(model: Settings(text: "Сотовая связь", image: UIImage(systemName: "antenna.radiowaves.left.and.right"), imageBackgroundColor: .systemGreen) {
                    print("Нажата ячейка Сотовая связь")
                }),
                
                .staticCell(model: Settings(text: "Режим модема", image: UIImage(systemName: "personalhotspot"), imageBackgroundColor: .systemGreen) {
                    print("Нажата ячейка Режим модема")
                }),
                
                    .switchCell(model: SettingsSwitchOption(text: "VPN", image: UIImage(systemName: "globe"), imageBackgroundColor: .systemBlue, handler: {
                        print("Нажата ячейка VPN")
                    }, isOn: false)),
                
            ]))
            
            models.append(Section(title: "", options: [
                
                .staticCell(model: Settings(text: "Уведомления", image: UIImage(systemName: "bell.badge.fill"), imageBackgroundColor: .systemRed) {
                    print("Нажата ячейка Уведомления")

                }),
                
                    .staticCell(model: Settings(text: "Звуки, тактильные сигналы", image: UIImage(systemName: "speaker.wave.3.fill"), imageBackgroundColor: .systemPink) {
                        print("Нажата ячейка Пункт управления")

                }),
                
                    .staticCell(model: Settings(text: "Не беспокоить", image: UIImage(systemName: "moon.fill"), imageBackgroundColor: .systemPurple) {
                        print("Нажата ячейка Не беспокоить")

                }),
                
                    .staticCell(model: Settings(text: "Экранное время", image: UIImage(systemName: "hourglass"), imageBackgroundColor: .systemPurple) {
                        print("Нажата ячейка Экранное время")

                }),
                
            ]))
            
            models.append(Section(title: "", options: [
                
                .staticCell(model: Settings(text: "Основные", image: UIImage(systemName: "gear"), imageBackgroundColor: .systemGray) {
                    print("Нажата ячейка Основные")
                }),
                
                    .staticCell(model: Settings(text: "Пункт управления", image: UIImage(systemName: "switch.2"), imageBackgroundColor: .systemGray) {
                        print("Нажата ячейка Пункт управления")
                }),
                
                    .staticCell(model: Settings(text: "Экран и яркость", image: UIImage(systemName: "textformat.size"), imageBackgroundColor: .systemBlue) {
                        print("Нажата ячейка Экран и яркость")
                }),
                
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
            
            switch model.self {
            case .staticCell( let model):
                guard let cell = tableView.dequeueReusableCell(
                                withIdentifier: SettingTableViewCell.identifier,
                                for: indexPath
                            ) as? SettingTableViewCell else {
                                return UITableViewCell()
                            }
                            cell.configure(with: model)
                            return cell
            case .switchCell( let model):
                guard let cell = tableView.dequeueReusableCell(
                                withIdentifier: SwitchTableViewCell.identifier,
                                for: indexPath
                            ) as? SwitchTableViewCell else {
                                return UITableViewCell()
                            }
                            cell.configure(with: model)
                            return cell
                }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]

        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }

}

