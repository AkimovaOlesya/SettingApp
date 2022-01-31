//
//  SettingModel.swift
//  SettingApp
//
//  Created by Леся Акимова on 31.01.2022.
//

import UIKit
final class SettingsModel {
    
  func createModels() -> [Section] {
      
    return [
      Section(title: "First", options: [
        .switchCell(type: SettingSwitchOptions(
          title: "Авиарежим",
          icon: UIImage(systemName: "airplane"),
          iconBackgroundColor: .systemOrange, isOn: true)),
        .notificationCell(type:NotificationSettingOptions(
          title: "Wi-Fi",
          icon: UIImage(systemName: "wifi"),
          iconBackgroundColor: .systemBlue,
          notification: "Выкл.")),
        .notificationCell(type:NotificationSettingOptions(
          title: "Bluetooth", icon: UIImage(named: "bluetooth"),
          iconBackgroundColor: .systemBlue,
          notification: "Вкл.")),
        .staticCell(type:SettingOptions(
          title: "Сотовая связь",
          icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
          iconBackgroundColor: .systemGreen)),
        .staticCell(type:SettingOptions(
          title: "Режим модема",
          icon: UIImage(systemName: "personalhotspot"),
          iconBackgroundColor: .systemGreen))
      ]),
      Section(title: "Second", options: [
        .staticCell(type:SettingOptions(
          title: "Уведомления",
          icon: UIImage(systemName: "dot.square"),
          iconBackgroundColor: .systemRed)),
        .staticCell(type:SettingOptions(
          title: "Звуки, тактильные сигналы",
          icon: UIImage(systemName: "speaker.wave.3.fill"),
          iconBackgroundColor: .systemRed)),
        .staticCell(type:SettingOptions(
          title: "Не беспокоить",
          icon: UIImage(systemName: "moon.fill"),
          iconBackgroundColor: .systemPurple)),
        .staticCell(type:SettingOptions(
          title: "Экранное время",
          icon: UIImage(systemName: "hourglass"),
          iconBackgroundColor: .systemPurple))
      ]),
    ]
  }
}
