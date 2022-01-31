//
//  NotificationTableViewCell.swift
//  SettingApp
//
//  Created by Леся Акимова on 31.01.2022.
//

import UIKit
class NotificationTableViewCell: UITableViewCell {
  static let identifire = "NotificationTableViewCel"
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
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private let notificationLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = UIFont.systemFont(ofSize: Metric.labelFontSize)
    label.textColor = .systemGray
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - Settings
  private func setupHierarchy() {
    iconContainer.addSubview(iconImageView)
    contentView.addSubview(iconContainer)
    contentView.addSubview(label)
    contentView.addSubview(notificationLabel)
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
    label.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: Metric.labelLeftOffset).isActive = true
    notificationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    notificationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Metric.labelRightOffset).isActive = true
  }
  // MARK: - Configure
  func configure(with settings: NotificationSettingOptions) {
    label.text = settings.title
    iconImageView.image = settings.icon
    iconContainer.backgroundColor = settings.iconBackgroundColor
    notificationLabel.text = settings.notification
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
    notificationLabel.text = nil
  }
}
// MARK: - Constants
extension NotificationTableViewCell {
  enum Metric {
    static let containerCornerRadius: CGFloat = 8
    static let containerSize: CGFloat = 30
    static let containerOffset: CGFloat = 15
    static let imageSize: CGFloat = 24
    static let imageOffset: CGFloat = 3
    static let labelFontSize: CGFloat = 17
    static let labelLeftOffset: CGFloat = 10
    static let labelRightOffset: CGFloat = -10
  }
}
