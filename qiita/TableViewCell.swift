//
//  TableViewCell.swift
//  qiita
//
//  Created by 住田雅隆 on 2022/02/19.
//

import UIKit

protocol TableViewCellDelegate {
    func deleteButton()
}

class TableViewCell: UITableViewCell {
    
    var delegate: TableViewCellDelegate?

    @IBAction func deleteButton(_ sender: Any) {
        delegate?.deleteButton()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
