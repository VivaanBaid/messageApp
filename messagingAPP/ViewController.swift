//
//  ViewController.swift
//  messagingAPP
//
//  Created by Vivaan Baid on 17/07/21.
//

import UIKit
import MessageKit



class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var messagesTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesTable.dataSource = self
        messagesTable.delegate = self
        let nib = UINib.init(nibName: "MyTableViewCell", bundle: nil)
        messagesTable.register(nib, forCellReuseIdentifier: "cell")
        navigationItem.title = "VChat"
        
        
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueone", sender: self)
        print("Row number \(indexPath.row) was selected")
    }
}

