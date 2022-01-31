//
//  SettingsView.swift
//  SettingApp
//
//  Created by Леся Акимова on 31.01.2022.
//

import UIKit

class SettingsView: UIView {
    
  // MARK: - Privat properties
  private var models = [Section]()
    
  // MARK: - Views
  private lazy var tableView: UITableView = {
      
    let view = UITableView(frame: .zero, style: .grouped)
      
    view.translatesAutoresizingMaskIntoConstraints = false
    view.delegate = self
    view.dataSource = self
    view.register(SettingTableViewCell.self,
              forCellReuseIdentifier: SettingTableViewCell.identifire)
    view.register(SwitchTableViewCell.self,
              forCellReuseIdentifier: SwitchTableViewCell.identifire)
    view.register(NotificationTableViewCell.self,
              forCellReuseIdentifier: NotificationTableViewCell.identifire)
    return view
  }()
    
  // MARK: - Initial
  init() {
    super.init(frame: .zero)
    commonInit()
  }
    
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
    
  private func commonInit() {
    backgroundColor = .white
    setupHierarchy()
    setupLayout()
  }
    
  // MARK: - Settings
  private func setupHierarchy() {
    addSubview(tableView)
  }
    
  private func setupLayout() {
    tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
    
  // MARK: - Configuration
  func configureView(with models: [Section]) {
    self.models = models
    tableView.reloadData()
  }
}

// MARK: - Data Source
extension SettingsView: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return models.count
  }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models[section].options.count
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
    let model = models[indexPath.section].options[indexPath.row]
    switch model.self {
    case .staticCell(let setting):
        
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: SettingTableViewCell.identifire,
        for: indexPath) as? SettingTableViewCell else {
          return UITableViewCell()
      }
        
      cell.accessoryType = .disclosureIndicator
      cell.configure(with: setting)
        
      return cell
        
    case .switchCell(let setting):
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: SwitchTableViewCell.identifire,
        for: indexPath) as? SwitchTableViewCell else {
            
          return UITableViewCell()
      }
        
      cell.accessoryType = .none
      cell.selectionStyle = .none
      cell.configure(with: setting)
        
      return cell
    case .notificationCell(let setting):
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: NotificationTableViewCell.identifire,
        for: indexPath) as? NotificationTableViewCell else {
            
          return UITableViewCell()
        }
      cell.accessoryType = .disclosureIndicator
      cell.configure(with: setting)
        
      return cell
    }
  }
}

// MARK: - Delegate
extension SettingsView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    let model = models[indexPath.section].options[indexPath.row]
    switch model.self {
    case .staticCell(let setting):
      tableView.deselectRow(at: indexPath, animated: true)
      print("Нажата кнопка \(setting.title).")
    case .notificationCell(let setting):
      tableView.deselectRow(at: indexPath, animated: true)
      print("Нажата кнопка \(setting.title).")
    case .switchCell:
        
      return
    }
  }
}
