//
//  MainViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 01/08/22.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
      
      super.viewDidLoad()
      
      self.tabBarController?.tabBar.isHidden = true
      tabBarSetup()
    }
  
  func tabBarSetup(){
    let Main = LetsStartViewController()
    let Device = AddNewDeviceVC()
    let Setting = SettingViewController()
    
    Main.title = "Main"
    Device.title = "Devices"
    Setting.title = "Settings"
    
    self.setViewControllers([Main,Device,Setting], animated: false)
    
    guard let item = self.tabBar.items else { return }
    
    let image = ["main","iphone","selected-green"]
    
    for x in 0...2{
      item[x].image = UIImage(named : image[x])
    }
    self.tabBar.tintColor = .black
  }
}
