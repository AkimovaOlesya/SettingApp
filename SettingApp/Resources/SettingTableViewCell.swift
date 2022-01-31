//
//  SettingTableViewCell.swift
//  SettingApp
//
//  Created by Леся Акимова on 17.01.2022.
//

import UIKit
class SettingTableViewCell: UITableViewCell {
  static let identifire = "SettingTableViewCell"
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
    label.font = UIFont.systemFont(ofSize: Metric.labelFont)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - Settings
  private func setupHierarchy() {
    iconContainer.addSubview(iconImageView)
    contentView.addSubview(iconContainer)
    contentView.addSubview(label)
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
  }
  // MARK: - Configure
  func configure(with settings: SettingOptions) {
    label.text = settings.title
    iconImageView.image = settings.icon
    iconContainer.backgroundColor = settings.iconBackgroundColor
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
  }
}
// MARK: - Constants
extension SettingTableViewCell {
  enum Metric {
    static let containerCornerRadius: CGFloat = 8
    static let containerSize: CGFloat = 30
    static let containerOffset: CGFloat = 15
    static let imageSize: CGFloat = 24
    static let imageOffset: CGFloat = 3
    static let labelFont: CGFloat = 17
    static let labelOffset: CGFloat = 10
  }
}
