//
//  IdeaController.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 28.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

class IdeaController: UIViewController,UITableViewDataSource, UITableViewDelegate, UITextViewDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var MainIdea: UITableView!
    var ideas: [Idea] = [Idea(Text: "Хорошо бы купить еще один кулер", Likes: 5, Id: 0),Idea(Text: "Пора начать использовать BLuemix", Likes: 999,Id: 1),Idea(Text: "В компанию надо больше девушек. Больше девушек!!", Likes: 998,Id: 2)]
    var add = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        ideas = LoadData()
        MainIdea.contentInset = UIEdgeInsetsMake(64,0,64,0) // размер навигейшен бара ( задается смещение)44+20!!!!!!!
        MainIdea.canCancelContentTouches=true
        let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
        // 4
        recognizer.delegate = self
        view.addGestureRecognizer(recognizer)
        // Do any additional setup after loading the view.
    }
    func handleTap(recognizer: UITapGestureRecognizer) {
        println("Push")
        //Сюда надо вставить отключение клавиатуры !!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ideas.count+1
    }
    
    func LoadData() ->[Idea] {
        var Base:[Idea] = []
        let url = NSURL(string: "http://workbetter.mybluemix.net/AllIdeas")
        var request = NSURLRequest(URL: url!)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        if data != nil {
            var hoge = JSON(data: data!)
            if(hoge != nil){
                for element in hoge {
                    var idea = Idea(Text: element.1["text"].string!, Likes: element.1["likes"].int!,Id: element.1["idea_id"].int!)
                    Base.append(idea)
                }
                
            }
        }
        // Download inforamtion from server
        return Base
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
            let cellIdentifier = "IdeaCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:
                indexPath) as IdeaCell
            // Configure the cell...
            cell.LikeLabel.tintColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
                102.0/255.0, alpha: 1.0)
            cell.tintColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
                    102.0/255.0, alpha: 1.0)
            if(indexPath.row < self.ideas.count){
                cell.TextBackground.image = UIImage(named: "MessageBack.png")
                cell.TextHolder.editable = false
            cell.TextHolder.text = ideas[indexPath.row].text
            cell.LikeLabel.text = "\(ideas[indexPath.row].likes)"
            cell.id = ideas[indexPath.row].id
                cell.lks = ideas[indexPath.row].likes
            cell.LikeLabel.hidden = false
            cell.LikeButton.hidden = false
                cell.TextHolder.textColor = UIColor.whiteColor()
            }
            else{
                cell.TextHolder.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
                102.0/255.0, alpha: 1.0)
                cell.TextBackground.image = UIImage(named: "msg2.png")
                cell.TextHolder.editable = true
                cell.TextHolder.text = "Место для твоей идеи!"
                cell.LikeLabel.hidden = true
                cell.LikeButton.hidden = true
                cell.TextHolder.delegate = self
            }
            
            return cell
    }
    
    
    func textView(textView: UITextView!, shouldChangeTextInRange: NSRange, replacementText: NSString!) -> Bool {
                if(replacementText == "\n") {
        textView.resignFirstResponder()
                    println(textView.text)
                let url = NSURL(string: "http://workbetter.mybluemix.net/NewIdea?name=Denis&surname=Karpenko&text=\(textView.text!.urlEncode())")
                    println("http://workbetter.mybluemix.net/NewIdea?name=Denis&surname=Karpenko&text=\(textView.text!.urlEncode())")
                var request = NSURLRequest(URL: url!)
                var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        self.ideas = LoadData()
        MainIdea.reloadData()
        return false
                }
                return true
    }
    func tappedView(){
        println("tap")
        resignFirstResponder()

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
