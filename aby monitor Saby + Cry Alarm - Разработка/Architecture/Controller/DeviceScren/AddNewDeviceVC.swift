//
//  AddNewDeviceVC.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 04/08/22.
//

import UIKit

class AddNewDeviceVC: UIViewController {

  @IBOutlet weak var rightWayText: UILabel!
  @IBOutlet weak var qrcodeScanerButton: UIButton!
  @IBOutlet weak var shareLInkButton: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()
       setUpUI()
    }
  
  func setUpUI(){
    qrcodeScanerButton.tag = 1
    shareLInkButton.tag = 2
    self.rightWayText.text = ConstantText.shared.Chosse_Way
    corrnerradius(value: 6, outlet: qrcodeScanerButton)
    corrnerradius(value: 6, outlet: shareLInkButton)
  }
  
  @IBAction func ONclick(_ sender: Any) {
    let senderValue = (sender as AnyObject).tag
   //MARK: 1 for QR Screen 2 for share Link
   
    if let tagVal = senderValue{
      print(tagVal)
      
      switch tagVal{
      case 1 :
        print("QR")
        
        let secondView = ScanerViewController(nibName: "ScanerViewController", bundle: nil)
        self.navigationController?.pushViewController(secondView, animated: true)
        
      default:
        print("SendLink")
        let data = [ConstantText.shared.AppStore_Link] as [Any]
        UIApplication.share(data)
      }
      
    }
  }

}
