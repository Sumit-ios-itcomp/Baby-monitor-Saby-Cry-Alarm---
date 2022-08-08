//
//  Constant.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 29/07/22.
//

import Foundation

class ConstantText : NSString{
  
  static let shared = ConstantText()
  
  //MARK: Scanner Screen Constants
  let Scan_Not_Suppot_Text = "Scanning not supported"
  let Scan_Not_Suppot_Message_Text = "Your device does not support scanning a code from an item. Please use a device with a camera."
  let OK = "Ok"
  let  Scan_From_Parents_Text = "Scan QR code from Parents device"
  
  
  //MARK: Lets Start Screen Constants
  let Not_Installed_Text = "The app is not installed on the \n second device"
  let Help_Appstore_Text = "This link will help you install the app from Play \n Store or AppStore and pair your devices"
  let Pick_Role_Text = "Open the app on both your devices and \n pick a different role"
  let Chosse_Type = "Which phone are you \n using now?"
  
  
  //MARK: Connectivity Screen
  let Device_Paired_Text = "Two devices are paired"
  
  //MARK: Device Screen
  let Chosse_Way = "Choose the right way"
  let AppStore_Link = "https://apps.apple.com/us/app/k-desk/id1588234756"
  
  //MARK: QR Screen
  let Device_Away = "The baby’s device is away from you?"
 
}


