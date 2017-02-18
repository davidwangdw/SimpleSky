//
//  SunriseViewController.swift
//  SimpleSky
//
//  Created by David Wang on 2/17/17.
//  Copyright © 2017 Seven Even. All rights reserved.
//

import UIKit

class SunriseImageCell: UITableViewCell {
    @IBOutlet weak var sunriseCellImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
}

class SunriseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var locations = ["Kalaw, Myanmar", "Washington, DC", "Bar Harbor, Maine"]
    var sunrisePhotoArray = ["sunrise1", "sunrise2", "sunrise3"]
    
    @IBOutlet weak var sunriseTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sunriseTable.delegate = self
        sunriseTable.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SunriseCell", for: indexPath) as! SunriseImageCell
        
        cell.sunriseCellImage.image = UIImage(named: sunrisePhotoArray[indexPath.row])
        cell.cityLabel.text = locations[indexPath.row]
        
        return cell
    }
    
    @IBAction func done() {
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
