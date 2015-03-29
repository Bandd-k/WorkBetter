//
//  Idea.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 28.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//
// Class for ideas in IdeaControler
import Foundation
class Idea {
    var text: String = ""
    var likes: Int = 0
    var id: Int = 0
    init(Text: String, Likes: Int,Id: Int){
        self.text = Text
        self.likes = Likes
        self.id = Id
    }
    
}