//
//  ViewController.swift
//  SampleAlamofire
//
//  Created by 三浦　登哉 on 2021/03/04.
//

import UIKit

final class ViewController: UIViewController {
    
    private var repository: [Repository] = []
    @IBOutlet private weak var searchText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    @IBAction private func search(_ sender: Any) {
        guard  let keyWord = searchText.text else { return }
        API.call(with: keyWord) { result in
            guard let result = result else {return}
            self.repository = result.items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
    
        }
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else { return UITableViewCell() }
        cell.configure(with: repository, indexpath: indexPath)
        return cell
    }
    
    
}
