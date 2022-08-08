//
//  UserLoginViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 28/07/22.
//

import UIKit

class LetsStartViewController: UIViewController , ParentProtocol{

  override var prefersStatusBarHidden: Bool {
      return true
  }

  @IBOutlet weak var parentView: Parent!
  @IBOutlet weak var childView: Child!
  @IBOutlet weak var caustomAlertView: UIView!
  @IBOutlet weak var alert: CaustomAlert!
  
  @IBOutlet weak var openappText: UILabel!
  @IBOutlet weak var chosseText: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()
   
    initialSetup()
    self.tabBarController?.tabBar.isHidden = true
    navHidden = 0

    }
  
  override func viewWillAppear(_ animated: Bool) {
    if navHidden != 0{
      self.tabBarController?.tabBar.isHidden = true
    }else{
      self.tabBarController?.tabBar.isHidden = false
    }
  }

  //MARK: inital setup

  func initialSetup(){
    openappText.text = ConstantText.shared.Pick_Role_Text
    chosseText.text = ConstantText.shared.Chosse_Type
    tapGestureAdd()
       
    setcorrnerRadius(vEw: parentView, curveValue: 6)
    setcorrnerRadius(vEw: childView, curveValue: 6)
    setcorrnerRadius(vEw: alert, curveValue: 12)
    childView.child_Button.addTarget(self, action: #selector(childBtnTag(_:)), for: .touchUpInside)
    parentView.delegate = self
    self.caustomAlertView.isHidden = true
   
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
  
//    if self.caustomAlertView.isHidden == true{
//      self.caustomAlertView.isHidden = false
//    }else{
//      self.caustomAlertView.isHidden = true
//    }
    
    
    
    let secondView = QRViewController(nibName: "QRViewController", bundle: nil)
    self.navigationController?.pushViewController(secondView, animated: true)
    
  }
  
  func ParentBtnClicked() {
    print("p")
    print("parent is clicked")
    
    let secondView = ScanerViewController(nibName: "ScanerViewController", bundle: nil)
    self.navigationController?.pushViewController(secondView, animated: true)
   
    
//
  }
  
  override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
}
