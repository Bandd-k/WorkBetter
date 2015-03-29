//
//  Achievments.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 29.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

class Achievments: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var mass:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        MainTable.contentInset = UIEdgeInsetsMake(0,0,64,0) // размер навигейшен бара ( задается смещение)44+20!!!!!!!
        


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        let url = NSURL(string: "http://workbetter.mybluemix.net/TakeOne?name=Denis&surname=Karpenko")
        var request = NSURLRequest(URL: url!)
        var Wor = Worker(Name:"Denis", Surname: "Karpenko",Job:"Senior IOS Developer", Organization :"LuckyASS",Lvl:3,Rating:3)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        if data != nil {
            var hoge = JSON(data: data!)
            if(hoge != nil){
                Wor = Worker(Name: hoge["name"].string!, Surname: hoge["surname"].string!, Job: hoge["job"].string!, Organization: hoge["org"].string!, Lvl: hoge["lvl"].int!, Rating: hoge["raiting"].int!)
                for elem in hoge["achives"]{
                    mass.append(elem.1.string!)
                    println(elem.1.string!)
                }
                //println(mass)
            }
        }

    }

    @IBOutlet weak var MainTable: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
            let cellIdentifier = "Ach"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:
                indexPath) as AchieveCell
            // Configure the cell...
            cell.Description.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
                102.0/255.0, alpha: 1.0)
            switch indexPath.row {
            case 0 :
                cell.Img.image = UIImage(named: "heart_grey.png")
                cell.Description.text = "Получи Первый лайк!"
                if(has("0")){
                    cell.Img.image = UIImage(named: "heart.png")
                }
            case 1 :
                cell.Description.text = "Стань топ-1 месяца"
                cell.Img.image = UIImage(named: "users_grey.png")
                if(has("1")){
                    cell.Img.image = UIImage(named: "users.png")
                }
            case 2 :
                cell.Description.text = "5 дней лайков"
                cell.Img.image = UIImage(named: "home_grey.png")
                if(has("2")){
                    cell.Img.image = UIImage(named: "home.png")
                }
            case 3 :
                cell.Description.text = "5 лайков за день"
                cell.Img.image = UIImage(named: "lamp_grey.png")
                if(has("3")){
                    cell.Img.image = UIImage(named: "lamp.png")
                }
            case 4 :
                cell.Description.text = "Получи второй уровень!"
                cell.Img.image = UIImage(named: "lamp2_grey.png")
                if(has("4")){
                    cell.Img.image = UIImage(named: "lamp2.png")
                }
            default :
                cell.Description.text = "to more"
            }
            
            return cell
    }
    
    func has(str: String)-> Bool {
        for element in self.mass{
            if(element == str ){
                return true
            }
        }
        return false
    }
    func Start(Input:[String]){
        mass = Input
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
