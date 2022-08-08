//
//  Navigation+Extention.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 01/08/22.
//

import Foundation
import UIKit

extension UINavigationController {

  //MARK: - Navaigate to Particular Viewcontroller 
  
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }



}
