//
//  PublicQuestions.swift
//  4_pics_1_word
//
//  Created by Minh Pham on 11/5/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import Foundation
import UIKit

struct questionStruct {
    var images = [UIImage]()
    var answer = String()
    
}

func loadQuestion() -> questionStruct {
    return questionStruct(images: [#imageLiteral(resourceName: "dog"),#imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "dog"),#imageLiteral(resourceName: "dog")], answer: "Hello")
}
