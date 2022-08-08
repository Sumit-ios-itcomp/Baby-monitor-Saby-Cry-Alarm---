//
//  ParentViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 03/08/22.
//

import UIKit

class ParentViewController: SwipeViewController {

  @IBOutlet weak var videoQuality: UILabel!
  override func viewDidLoad() {
        super.viewDidLoad()
    swipeGesture()
        // Do any additional setup after loading the view.
    }

}
