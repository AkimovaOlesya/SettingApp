//
//  SwitchTableViewCell.swift
//  SettingApp
//
//  Created by Леся Акимова on 17.01.2022.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    static let identifier = "SwitchTableViewCell"

    private let iconContainer: UIView = {
        let iconContainer = UIView()
        iconContainer.clipsToBounds = true
        iconContainer.layer.cornerRadius = 8
        iconContainer.layer.masksToBounds = true

        return iconContainer
    }()

    private let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.backgroundColor = .white
        iconImageView.contentMode = .scaleAspectFit

        return iconImageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1

        return label
    }()
    
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemBlue
        
        return mySwitch
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(mySwitch)
        iconContainer.addSubview(iconImageView)

        contentView.clipsToBounds = true
        accessoryType = .none
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

        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(
            x: contentView.frame.size.width - mySwitch.frame.size.height - 20,
            y: (contentView.frame.size.height - mySwitch.frame.size.height) / 2,
            width: mySwitch.frame.size.width,
            height: mySwitch.frame.size.height)
        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
            height: contentView.frame.size.height)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        mySwitch.isOn = false
    }

    public func configure(with model: SettingsSwitchOption) {
        label.text = model.text
        iconImageView.image = model.image
        iconContainer.backgroundColor = model.imageBackgroundColor
        mySwitch.isOn = model.isOn
    }

}

