//
//  QRViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 05/08/22.
//

import UIKit

class QRViewController: SwipeViewController {

  @IBOutlet weak var notNear: UIButton!
  @IBOutlet weak var caustomAlertView: UIView!
  
  override func viewDidLoad() {
        super.viewDidLoad()

   initialSetup()
   
    }

  
  func initialSetup(){
    self.notNear.setTitle(ConstantText.shared.Device_Away, for: .normal)
    swipeGesture()
    caustomAlertView.isHidden = true
    tapGestureAdd()
  }
  
  @IBAction func awayConection(_ sender: Any) {
    
    if self.caustomAlertView.isHidden == true{
      self.caustomAlertView.isHidden = false
    }else{
      self.caustomAlertView.isHidden = true
    }
    
  }
  
  //MARK: Gesture aadded here
  func tapGestureAdd(){
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    caustomAlertView.addGestureRecognizer(tap)
    caustomAlertView.isUserInteractionEnabled = true
  }

  //MARK: tap gesture
  @objc func handleTap(_ sender: UITapGestureRecognizer) {
    self.caustomAlertView.isHidden = true
    }
  
  @objc func childBtnTag(_ sender : UIButton){
  
    if self.caustomAlertView.isHidden == true{
      self.caustomAlertView.isHidden = false
    }else{
      self.caustomAlertView.isHidden = true
    }
  }
 
}
