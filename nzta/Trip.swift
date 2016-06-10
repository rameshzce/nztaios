//
//  Trip.swift
//  TripCard
//
//  Created by Simon Ng on 22/10/2015.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import Foundation
import UIKit

class Trip {
    var city = ""
    var featuredImage:UIImage?
    
    init(city: String, featuredImage: UIImage!) {
        self.city = city
        self.featuredImage = featuredImage
    }
}