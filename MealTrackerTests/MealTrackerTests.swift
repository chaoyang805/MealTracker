//
//  MealTrackerTests.swift
//  MealTrackerTests
//
//  Created by chaoyang805 on 16/1/21.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import XCTest
import UIKit
@testable import MealTracker

class MealTrackerTests: XCTestCase {
    
    // MARK: MealTrackerTests
    func testMealInitialization(){
        // Success case
        let potentialItem = Meal(name: "Newest Meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure case
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName,"Empty name is valid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -5)
        XCTAssertNil(badRating,"Negative ratings are invalid be positive")
        
    }
    
}
