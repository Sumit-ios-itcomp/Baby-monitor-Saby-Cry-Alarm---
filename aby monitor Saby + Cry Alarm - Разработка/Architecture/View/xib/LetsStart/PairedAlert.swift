//
//  PairedAlert.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 01/08/22.
//

import Foundation
import UIKit


class PairedAlert: UIView {
  
  @IBOutlet weak var connectedLabel: UILabel!
  
  required init?(coder aDecoder: NSCoder) {  // storyboard initializer
    super.init(coder: aDecoder)
    fromNib()   // 5.
    commonInit()
  }

  private func commonInit() {
    self.connectedLabel.text = ConstantText.shared.Device_Paired_Text
  
  }
  
  
  
}
