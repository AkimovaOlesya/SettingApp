//
//  SectionModel.swift
//  SettingApp
//
//  Created by Леся Акимова on 31.01.2022.
//

import UIKit
struct Section {
  let title: String
  let options: [SettingType]
}

enum SettingType {
  case staticCell(type: SettingOptions)
  case switchCell(type: SettingSwitchOptions)
  case notificationCell(type: NotificationSettingOptions)
}
