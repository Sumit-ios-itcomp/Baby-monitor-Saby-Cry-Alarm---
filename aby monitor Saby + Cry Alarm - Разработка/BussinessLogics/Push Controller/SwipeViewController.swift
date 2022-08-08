//
//  SwipeViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 03/08/22.
//

import Foundation
import UIKit

class SwipeViewController : UIViewController{
  
  
  //MARK: Swipe screen left to right for pop view to last
  
  func swipeGesture(){
         
          let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))

          rightSwipe.direction = .right

          view.addGestureRecognizer(rightSwipe)
      }
  
  @objc func handleSwipes(_ sender:UISwipeGestureRecognizer)
      {
          
          if (sender.direction == .right)
          {
             print("Swipe Right")
            self.navigationController?.popViewController(animated: true)

          }
      }
}
