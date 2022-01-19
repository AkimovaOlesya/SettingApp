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
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)

        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size - imageSize)/2, y: (size - imageSize)/2, width: imageSize, height: imageSize)
     //   iconImageView.center = iconContainer.center

        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
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
