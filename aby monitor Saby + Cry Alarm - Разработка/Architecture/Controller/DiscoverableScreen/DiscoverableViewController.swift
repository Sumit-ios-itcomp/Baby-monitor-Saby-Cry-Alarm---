//
//  DiscoverableViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 01/08/22.
//

import UIKit

class DiscoverableViewController: UIViewController {

  @IBOutlet weak var gifImageView: UIImageView!
  @IBOutlet weak var closeButton: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    setupUI()
  }
  
  func setupUI(){
    GIF(gifView: gifImageView, appendedString: "-round")
    setcorrnerRadius(vEw: self.closeButton, curveValue: 8)
  }

  @IBAction func popToLastView(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    
  }
}
