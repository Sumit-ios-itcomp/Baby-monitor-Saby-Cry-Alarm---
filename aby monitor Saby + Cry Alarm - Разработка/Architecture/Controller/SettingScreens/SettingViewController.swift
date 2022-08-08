//
//  SettingViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 02/08/22.

import UIKit

class SettingViewController: UIViewController {

  lazy var settings: [SettingTableModel] = {
      let settingOne = SettingTableModel(title: " ", data: "Device name", "Notifications")
      let settingTwo = SettingTableModel(title: " ", data: "Parents station", "Baby station")
      let settingThree = SettingTableModel(title: " ", data: "Subscrition","Report a problem","Terms of use","Privacy policy" )
      return [settingOne, settingTwo, settingThree]
  }()
  
  @IBOutlet weak var settingTableview: UITableView!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    initialSetup()
    }
  
  func initialSetup(){
        
    settingTableview.delegate = self
    settingTableview.dataSource = self
    
    settingTableview.separatorColor = .gray
    settingTableview.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "Setting_cell")
  }
}

//MARK: - tableview delegate methods
extension SettingViewController : UITableViewDelegate,UITableViewDataSource{
  
    func numberOfSections(in tableView: UITableView) -> Int {
      return settings.count
    }
  
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return settings[section].title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return settings[section].numberOfItems
    }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = (settingTableview.dequeueReusableCell(withIdentifier: "Setting_cell", for: indexPath) as? SettingTableViewCell)!
    let cellText = settings[indexPath.section][indexPath.row]
    cell.settingLabel.text = cellText
    cell.settingIcon.image = UIImage(named: cellText)
    
    cell.selectionStyle = .none

    return cell
    
  }
  
   func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
      guard let headerView = view as? UITableViewHeaderFooterView else { return }
      headerView.tintColor = .clear //use any color you want here .red, .black etc
  }
  

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(indexPath)
    print(indexPath[0])
    print(indexPath.item)

    switch indexPath[0] {
    case 0:
        print("First Section")
      
      if indexPath.item == 0{
        print("Navigate to device Name Screen")
      }else{
        print("Navigate to Notification Screen")
        
        let notificationScreen = NotificationViewController(nibName: Notification_VC, bundle: nil)
        self.navigationController?.pushViewController(notificationScreen, animated: true)
      }

    case 1:
        print("Second Section")
      
      if indexPath.item == 0{
        print("Navigate to Parents Station Screen")
        
        let notificationScreen = ParentViewController(nibName: Parent_VC, bundle: nil)
        self.navigationController?.pushViewController(notificationScreen, animated: true)
        
      }else{
        print("Navigate to Baby Station Screen")
        
        let notificationScreen = BabyViewController(nibName: Baby_VC, bundle: nil)
        self.navigationController?.pushViewController(notificationScreen, animated: true)
      }

    default:
        print("Third Section")
      if indexPath.item == 0{
        print("Navigate to Subscrition Screen")
        
      }else if indexPath.item == 1{
        print("Navigate to Report a problem Screen")//ReportProblemViewController
        
        let notificationScreen = ReportProblemViewController(nibName: ReportProblem_VC, bundle: nil)
        self.navigationController?.pushViewController(notificationScreen, animated: true)
      }else if indexPath.item == 2{
        print("Navigate to Terms of use Screen")
        
      }else{
        print("Navigate to Privacy policy Screen")
        
      }
    }
  }
 }
