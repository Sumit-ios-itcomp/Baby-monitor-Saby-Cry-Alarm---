//
//  BabyViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 03/08/22.
//

import UIKit

class BabyViewController: SwipeViewController {
  @IBOutlet weak var dimingTimeScren: UILabel!
  @IBOutlet weak var cameraType: UILabel!
  override func viewDidLoad() {
        super.viewDidLoad()
    swipeGesture()
        // Do any additional setup after loading the view.
    }

}
