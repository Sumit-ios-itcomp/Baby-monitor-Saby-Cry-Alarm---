//
//  QRView.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 05/08/22.
//

import UIKit

class QRView: UIView {

  @IBOutlet weak var QRView: UIImageView!
  
  required init?(coder aDecoder: NSCoder) {  // storyboard initializer
    super.init(coder: aDecoder)
    fromNib()   // 5.
    commonInit()
  }

  private func commonInit() {
    corrnerradius(value: 12, outlet: self.QRView)
  }
  

}
