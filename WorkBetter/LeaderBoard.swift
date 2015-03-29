//
//  LeaderBoard.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 29.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

class LeaderBoard: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var workers:[Worker] = [Worker(Name:"Denis", Surname: "Karpenko",Job:"Senior IOS Developer", Organization :"LuckyASS",Lvl:1,Rating:2),Worker(Name:"Maxim", Surname: "Danilchenko",Job:"Backend",Organization :"LuckyASS",Lvl:1,Rating:2),Worker(Name:"Samat", Surname: "Davletshin",Job:"General Worker",Organization :"LuckyASS",Lvl:1,Rating:2)]
    
    @IBOutlet weak var MainTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        workers = LoadData()

        // Do any additional setup after loading the view.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.workers.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    func LoadData() ->[Worker] {
        var Base:[Worker] = []
        let url = NSURL(string: "http://workbetter.mybluemix.net/TakeAllSortObj")
        var request = NSURLRequest(URL: url!)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        if data != nil {
            var hoge = JSON(data: data!)
            if(hoge != nil){
                for element in hoge {
                    var Wor = Worker(Name: element.1["name"].string!, Surname: element.1["surname"].string!, Job: element.1["job"].string!, Organization: element.1["org"].string!, Lvl: element.1["lvl"].int!, Rating: element.1["raiting"].int!)
                    Base.append(Wor)
                }
                
            }
        }
        // Download inforamtion from server
        return Base
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
            let cellIdentifier = "LeadCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:
                indexPath) as LeaderCell
            // Configure the cell...
            cell.FullName.text = workers[indexPath.row].name + " " + workers[indexPath.row].surname
            cell.Place.text = "\(indexPath.row + 1)"
            cell.Rating.text = "\(workers[indexPath.row].rating)"
            return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Start(Input:[String]){
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
