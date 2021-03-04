//
//  TableViewCell.swift
//  SampleAlamofire
//
//  Created by 三浦　登哉 on 2021/03/04.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var fullName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with items: [Repository], indexpath: IndexPath) {
        name.text = items[indexpath.row].name
        fullName.text = items[indexpath.row].fullName
    }
}
