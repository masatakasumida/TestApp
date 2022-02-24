//
//  ViewController.swift
//  qiita
//
//  Created by 住田雅隆 on 2022/02/19.
//

import UIKit

class ViewController: UIViewController {
    
    var itemArray = ["cell 1","cell 2","cell 3"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
//tableViewの設定を記述
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
       }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//tableViewの内容を指定
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell",for: indexPath) as! TableViewCell
//忘れやすいので注意
        cell.delegate = self
        return cell
    }
}
extension ViewController: TableViewCellDelegate {
    
    func deleteButton() {
    let alert: UIAlertController = UIAlertController(title: "注意", message: "削除してもいいですか？", preferredStyle: .alert)
    let canselAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel) { (UIAlertAction) in
        print("キャンセル")
    }
    let okAction: UIAlertAction = UIAlertAction(title: "削除", style: .destructive) { (UIAlertAction) in
        self.tableView.beginUpdates()
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell",for: indexPath) as! TableViewCell
            self.itemArray.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            self.tableView.reloadData()
            self.tableView.endUpdates()
            return cell
        }
        print(self.itemArray)
}
    alert.addAction(okAction)
    alert.addAction(canselAction)
    present(alert, animated: true, completion: nil)
    }
}
