//
//  DeviceViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 02/08/22.
//

import UIKit

class DeviceViewController: UIViewController {

  let Devices : Array = ["IPhone Father","IPhone Mother","Grand Parent"]
  
  @IBOutlet weak var devicelCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

      self.devicelCollection.delegate = self
      self.devicelCollection.dataSource = self
      
     // view.backgroundColor = .blue
      
      UIDevice.current.isBatteryMonitoringEnabled = true
      print(UIDevice.current.batteryLevel)
      initialSetup()
    }
  
  func initialSetup(){
    devicelCollection.register(UINib(nibName: "DeviceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Device_cell")
    
    
  }
}

extension DeviceViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return Devices.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = devicelCollection.dequeueReusableCell(withReuseIdentifier: "Device_cell", for: indexPath) as? DeviceCollectionViewCell
    cell?.deviceName.text = Devices[indexPath.item]
    return cell!
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.view.frame.width/5, height: 120)
  }
  
  
}

