//
//  TableViewCell.swift
//  qiita
//
//  Created by 住田雅隆 on 2022/02/19.
//

import UIKit

protocol TableViewCellDelegate {
    func deleteButton(indexPathRow: Int)
}

class TableViewCell: UITableViewCell {
    
    var delegate: TableViewCellDelegate?
    var indexPathRow = 0
    
    @IBOutlet weak var content: UILabel!
    @IBAction func deleteButton(_ sender: Any) {
        delegate?.deleteButton(indexPathRow: indexPathRow)
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
