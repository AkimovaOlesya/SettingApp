//
//  SwitchTableViewCell.swift
//  SettingApp
//
//  Created by Леся Акимова on 17.01.2022.
//

import UIKit
class SwitchTableViewCell: UITableViewCell {
  static let identifire = "SwitchTableViewCell"
  // MARK: - Views
  private let iconContainer: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.clipsToBounds = true
    view.layer.cornerRadius = Metric.containerCornerRadius
    return view
  }()
  private let iconImageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFit
    image.translatesAutoresizingMaskIntoConstraints = false
    image.clipsToBounds = true
    image.tintColor = .white
    return image
  }()
  private let label: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = UIFont.systemFont(ofSize: Metric.labelFontSize)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private let mySwitch: UISwitch = {
    let mySwitch = UISwitch()
    mySwitch.onTintColor = .systemGreen
    mySwitch.translatesAutoresizingMaskIntoConstraints = false
    mySwitch.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
    return mySwitch
  }()
  @objc func toggle(_ sender: UISwitch) {
      if mySwitch.isOn {
        print("Нажата кнопка \(label.text ?? "").")
      }
    }
  // MARK: - Settings
  private func setupHierarchy() {
    contentView.addSubview(iconContainer)
    iconContainer.addSubview(iconImageView)
    contentView.addSubview(label)
    contentView.addSubview(mySwitch)
  }
  private func setupLayout() {
    iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.containerOffset).isActive = true
    iconContainer.widthAnchor.constraint(equalToConstant: Metric.containerSize).isActive = true
    iconContainer.heightAnchor.constraint(equalToConstant: Metric.containerSize).isActive = true
    iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor).isActive = true
    iconImageView.leadingAnchor.constraint(equalTo: iconContainer.leadingAnchor, constant: Metric.imageOffset).isActive = true
    iconImageView.heightAnchor.constraint(equalToConstant: Metric.imageSize).isActive = true
    iconImageView.widthAnchor.constraint(equalToConstant: Metric.imageSize).isActive = true
    label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    label.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: Metric.labelOffset).isActive = true
    mySwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    mySwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Metric.switchRightOffset).isActive = true
  }
  // MARK: - Configure
  func configure(with settings: SettingSwitchOptions) {
    label.text = settings.title
    iconImageView.image = settings.icon
    iconContainer.backgroundColor = settings.iconBackgroundColor
    mySwitch.isOn = settings.isOn
  }
  // MARK: - Initial
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupHierarchy()
    setupLayout()
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    iconImageView.image = nil
    label.text = nil
    iconContainer.backgroundColor = nil
    mySwitch.isOn = false
  }
}
// MARK: - Constants
extension SwitchTableViewCell {
  enum Metric {
    static let containerCornerRadius: CGFloat = 8
    static let containerSize: CGFloat = 30
    static let containerOffset: CGFloat = 15
    static let imageSize: CGFloat = 24
    static let imageOffset: CGFloat = 3
    static let labelFontSize: CGFloat = 17
    static let labelOffset: CGFloat = 10
    static let switchRightOffset: CGFloat = -15
  }
}
