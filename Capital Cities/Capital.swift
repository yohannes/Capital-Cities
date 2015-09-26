//
//  Capital.swift
//  Capital Cities
//
//  Created by Yohannes Wijaya on 9/26/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var info: String
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, info: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.info = info
        self.coordinate = coordinate
    }
}
