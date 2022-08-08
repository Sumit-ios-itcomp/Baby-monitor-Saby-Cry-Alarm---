//
//  SettingTableModel.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 02/08/22.
//

import Foundation

struct SettingTableModel {
    let title: String
    let data : [String]

    var numberOfItems: Int {
        return data.count
    }

    subscript(index: Int) -> String {
        return data[index]
    }
}

extension SettingTableModel {
    //  Putting a new init method here means we can
    //  keep the original, memberwise initaliser.
    init(title: String, data: String...) {
        self.title = title
        self.data  = data
    }
}
