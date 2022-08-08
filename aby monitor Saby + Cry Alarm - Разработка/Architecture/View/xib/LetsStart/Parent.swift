//
//  Parent.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 27/07/22.
//

import UIKit

protocol ParentProtocol : AnyObject{
  func ParentBtnClicked()
  }

class Parent: UIView{
  
  var delegate : ParentProtocol?
  
  required init?(coder aDecoder: NSCoder) {  // storyboard initializer
    super.init(coder: aDecoder)
    fromNib()   // 5.
    //loadView(VC: self)
    commonInit()
  }

  private func commonInit() {
  
  }
  
  @IBAction func parentAction(_ sender : UIButton){
    delegate?.ParentBtnClicked()
  }
  
  
}
