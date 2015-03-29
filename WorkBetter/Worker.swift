//
//  Worker.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 28.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//
// Class for workers for couple of controllers
import Foundation
class Worker {
    var name:String = ""
    var surname:String = ""
    var job:String = ""
    var organization = ""
    var lvl = 1
    var rating = 0
    init(Name: String, Surname: String, Job: String, Organization: String, Lvl: Int, Rating: Int) {
        self.name = Name
        self.surname = Surname
        self.job = Job
        self.organization = Organization
        self.lvl = Lvl
        self.rating = Rating
    }
}
