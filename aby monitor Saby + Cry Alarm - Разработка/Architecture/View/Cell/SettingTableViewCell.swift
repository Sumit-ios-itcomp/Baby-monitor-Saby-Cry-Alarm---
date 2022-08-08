//
//  SettingTableViewCell.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 02/08/22.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

  @IBOutlet weak var settingLabel: UILabel!
  @IBOutlet weak var settingIcon: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
        
