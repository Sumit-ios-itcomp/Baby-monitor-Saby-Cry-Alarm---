//
//  Child.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 27/07/22.
//

import UIKit

class Child: UIView {

  @IBOutlet weak var child_Button: UIButton!
   
  required init?(coder aDecoder: NSCoder) {  // storyboard initializer
    super.init(coder: aDecoder)
    fromNib()   // 5.
  //  commonInit()
  }

  private func commonInit() {
  
  }
  
  @IBAction func childButtonisClicked(_ sender : UIButton){
    
    print("child is clicked")
  }
  
  
  
  
}
