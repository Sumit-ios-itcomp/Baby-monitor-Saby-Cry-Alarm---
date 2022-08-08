//
//  ReportProblemViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 03/08/22.
//

import UIKit

class ReportProblemViewController: SwipeViewController {

  //MARK: outlets
  @IBOutlet weak var reportTextView: UITextView!
  @IBOutlet weak var reportSent : UIButton!
  @IBOutlet weak var emailTextfield: UITextField!
  
  //MARK: variable
  var problemDescribed = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()
      swipeGesture()
      initialSetup()
      reportTextView.delegate = self

    }
  
  func initialSetup(){
    if reportTextView.text.isEmpty {
      reportTextView.text = "Describe your problem."
      reportTextView.textColor = UIColor.lightGray
      
     // text ""
    }

    
    setcorrnerRadius(vEw: reportSent, curveValue: 6)
    
    reportTextView.layer.masksToBounds = true
    reportTextView.layer.borderWidth = 2.0
    reportTextView.layer.borderColor =  #colorLiteral(red: 0.5921568627, green: 0.7058823529, blue: 0.7176470588, alpha: 1)
    
    emailTextfield.layer.masksToBounds = true
    emailTextfield.layer.borderWidth = 2.0
    emailTextfield.layer.borderColor =  #colorLiteral(red: 0.5921568627, green: 0.7058823529, blue: 0.7176470588, alpha: 1)
  }
}


extension ReportProblemViewController : UITextViewDelegate{
  func textViewDidBeginEditing(_ textView: UITextView) {
  if reportTextView.textColor == .lightGray {
    reportTextView.text = ""
    reportTextView.textColor = .black
  }
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
  if reportTextView.text.isEmpty {
    reportTextView.text = "Describe your problem."
    reportTextView.textColor = UIColor.lightGray
    
    self.problemDescribed = ""
    
   } else {
    
     self.problemDescribed = self.reportTextView.text
  }
  }
  
}
