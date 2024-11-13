//
//  ViewController.swift
//  ThreadingProject
//
//  Created by Hatice Taşdemir on 7.11.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let urlString = ["https://vastphotos.com/files/uploads/photos/10306/high-resolution-mountains-and-lakes-l.jpg?v=20220712073521","https://cdn.stocksnap.io/img-thumbs/280h/lake-mountains_VZBJUVPO25.jpg"]
    var data = Data()
    var tracker = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
  
        DispatchQueue.global().async{
            self.data = try! Data(contentsOf: URL(string: self.urlString[self.tracker])!)
            
            DispatchQueue.main.async{
                self.imageView.image = UIImage(data: self.data)
            }
        }
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(changeImage))
        
       
        DispatchQueue.global().async{
            self.data = try! Data(contentsOf: URL(string: self.urlString[self.tracker])!)
            
            DispatchQueue.main.async{
                self.imageView.image = UIImage(data: self.data)
            }
        }
        
        
    }
    @objc func changeImage(){
        
        if tracker == 0 {
            tracker += 1
        }else {
            tracker -= 1
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Threading Test"
        return cell
    }


}

