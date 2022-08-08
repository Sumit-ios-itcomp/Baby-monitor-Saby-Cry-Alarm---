//
//  Helper.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 27/07/22.
//

import Foundation
import UIKit
extension UIView {

    @discardableResult   // 1
  func fromNib<T : UIView>() -> T? {   // 2
    guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {    // 3
      // xib not loaded, or its top view is of the wrong type
      return nil
    }
    self.addSubview(contentView)     // 4
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    return contentView   // 7
  }
  
}
