//
//  SettingTableViewCell.swift
//  SettingApp
//
//  Created by Леся Акимова on 17.01.2022.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    static let identifier = "SettingTableViewCell"

    private let iconContainer: UIView = {
        let iconContainer = UIView()
        iconContainer.clipsToBounds = true
        iconContainer.layer.cornerRadius = 8
        iconContainer.layer.masksToBounds = true

        return iconContainer
    }()

    private let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.backgroundColor = .none
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit

        return iconImageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)

        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
                iconContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -160).isActive = true
                iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
                iconContainer.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -12).isActive = true
                iconContainer.widthAnchor.constraint(equalTo: contentView.heightAnchor, constant: -12).isActive = true

                iconImageView.translatesAutoresizingMaskIntoConstraints = false
                iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -160).isActive = true
                iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
                iconImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -18).isActive = true
                iconImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor, constant: -18).isActive = true

                label.translatesAutoresizingMaskIntoConstraints = false
                label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 57).isActive = true
                label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
                label.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -20).isActive = true
                label.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
 }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }

    public func configure(with model: Settings) {
        label.text = model.text
        iconImageView.image = model.image
        iconContainer.backgroundColor = model.imageBackgroundColor
    }

}
