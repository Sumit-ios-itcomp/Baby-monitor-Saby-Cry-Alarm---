//
//  CaustomAlert.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 29/07/22.
//

import UIKit

class CaustomAlert: UIView {

  @IBOutlet weak var alertLabel: UILabel!
  @IBOutlet weak var alertMessage: UILabel!
  @IBOutlet weak var sendLinkButton: UIButton!
  
  required init?(coder aDecoder: NSCoder) {  // storyboard initializer
    super.init(coder: aDecoder)
    fromNib()   // 5.
    commonInit()
  }

  private func commonInit() {
    self.alertLabel.text = ConstantText.shared.Not_Installed_Text
    setcorrnerRadius(vEw: sendLinkButton, curveValue: 6)
    
    self.alertMessage.text = ConstantText.shared.Help_Appstore_Text
  }
  
  
  @IBAction func shareLink(_ sender: Any) {
    let data = ["https://apps.apple.com/us/app/k-desk/id1588234756"] as [Any]
    UIApplication.share(data)
  }
  

}
