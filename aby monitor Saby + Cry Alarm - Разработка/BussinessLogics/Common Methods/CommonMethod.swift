//
//  CommonMethod.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 29/07/22.
//

import Foundation

import Foundation
import UIKit
import SafariServices

var navHidden : Int = 1

//MARK: - Validation for email
func isValidEmail(emailID:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: emailID)
}

//MARK: - Validation for PHONE
func isValidPhone(phone: String) -> Bool {
    let phoneNumberRegex = "^[6-9]\\d{9}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
    return phoneTest.evaluate(with: phone)
}

//MARK: - Cornners round of all Sides
func corrnerradius(value : Int, outlet : UIView)  {
    outlet.layer.cornerRadius = CGFloat(value)
    outlet.clipsToBounds = true
}



//MARK: - UnderLine Text
var attrs = [
    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16.0),
    NSAttributedString.Key.foregroundColor : hexStringToUIColor(hex: "#FFFFFF"),
    NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]

//onlyfor newUSer
var attrsNuser = [
    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0),
    NSAttributedString.Key.foregroundColor : hexStringToUIColor(hex: "#FFFFFF"),
    NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]

func underline_Txt(fontText : String, outlet : UIButton) {
    let attributedString = NSMutableAttributedString(string:"")
    let buttonTitleStr = NSMutableAttributedString(string: fontText, attributes:attrs)
    attributedString.append(buttonTitleStr)
    outlet.setAttributedTitle(attributedString, for: .normal)
}

func underline_TxtwithSize(fontText : String, outlet : UIButton, fontSize : CGFloat) {
    let attributedString = NSMutableAttributedString(string:"")
    let buttonTitleStr = NSMutableAttributedString(string: fontText, attributes:attrsNuser)
    attributedString.append(buttonTitleStr)
    outlet.setAttributedTitle(attributedString, for: .normal)
   
    
}



func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
func windowRootViewController() -> UIViewController {
    return (UIApplication.shared.delegate?.window??.rootViewController)!
}

//MARK: - TextField  MAX length Set
private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let t = textField.text?.prefix(maxLength)
        textField.text = String(t ?? "")
    }
}

//MARK: - Underline textfields for OTPs Screen
func textfield_underline(outlet : UITextField, width : Int)  {
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0.0, y: 60 - 1, width: Double(width - 2), height: 2.0)
    bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.6557607651, blue: 0.6785590053, alpha: 1)
    outlet.borderStyle = UITextField.BorderStyle.none
    outlet.layer.addSublayer(bottomLine)
}


//MARK: - IMAGE PICKER
func imagePickerType(on VC:UIViewController,completion:@escaping(UIImagePickerController.SourceType)->Void){
    
    let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
    actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
        return completion(UIImagePickerController.SourceType.camera)
    }))
    actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
        return completion(UIImagePickerController.SourceType.photoLibrary)
    }))
    
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
    VC.present(actionSheet, animated: true, completion: nil)
}

func pj_Alertbox(title : String, message : String,  selfClass : UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        switch action.style{
        case .default:
            print("default")
            
        case .cancel:
            print("cancel")
            
        case .destructive:
            print("destructive")
            
        @unknown default:
            fatalError()
        }
    }))
    selfClass.present(alert, animated: true, completion: nil)
}

//MARK: - AlertBOX
public func alertbox (title : String ,message : String ,actionTitle : String ,controller : UIViewController){
    
    let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
        UIAlertAction in
        //back to last view
        controller.navigationController?.popViewController(animated: false)
    }
    alertController.addAction(okAction)
    controller.present(alertController, animated: false, completion: nil)
}

//MARK: - borderColor with border width
func borderWithcolor(outlet : UIView , color : CGColor){
    outlet.layer.borderWidth = 1
    outlet.layer.borderColor = color
}

//MARK: -  dialer Caustomercare
func calltoCaustomercare(phoneNumber : String){
    guard let number = URL(string: "tel://" + phoneNumber) else { return }
    UIApplication.shared.open(number)
}

//MARK: - Email Box
func emailviewOpen(emailTo : String){
       let modifiedStr =  emailTo.replacingOccurrences(of: "\u{fffc}", with: "", options: NSString.CompareOptions.literal, range: nil).trimmingCharacters(in: .whitespaces)
       let url = NSURL(string: "mailto:\(modifiedStr)")
       UIApplication.shared.openURL(url! as URL)
}

//MARK: - Webview
func webviewOpen(urlString : String, controler : UIViewController){
    let freedSpaceString = urlString
    let url = freedSpaceString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let web = SFSafariViewController(url: URL(string: url)!)
    controler.present(web, animated: false, completion: nil)
}

//MARK:  Corrner radius
func setcorrnerRadius(vEw : UIView , curveValue : CGFloat){
  vEw.layer.cornerRadius = curveValue
  vEw.clipsToBounds = true

}


//MARK: - Gif file run

func GIF(gifView : UIImageView , appendedString : String){
  var imagesListArray = [UIImage]()

  for imageName in 1...5
  {
      imagesListArray.append(UIImage(named: "\(imageName)\(appendedString).png")!)
  }
  gifView.animationImages = imagesListArray
  gifView.animationDuration = 1.7
  gifView.startAnimating()
  
}

