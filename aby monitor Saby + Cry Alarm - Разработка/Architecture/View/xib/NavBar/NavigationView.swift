//
//  NavigationView.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 02/08/22.
//

import Foundation
import UIKit


class NavigationView : UIView {
  
  
  @IBOutlet weak var subTitle: UILabel!
  @IBInspectable var nameValue:String = "My dummy text"{
         didSet{
             subTitle.text = nameValue //----> This is not working

         }
     }
  
  
  required init?(coder aDecoder: NSCoder) {  // storyboard initializer
    super.init(coder: aDecoder)
    fromNib()   // 5.
    //loadView(VC: self)
    commonInit()
  }

  private func commonInit() {
  
  }
  
}
