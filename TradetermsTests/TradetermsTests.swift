//
//  TradetermsTests.swift
//  TradetermsTests
//
//  Created by Jose Manuel Mendoza Marín on 28/04/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import XCTest
@testable import Tradeterms

class TradetermsTests: XCTestCase {

    //MARK: Articulo Class Tests
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealInitializationSucceeds() {
        // Zero rating
        let zeroRatingMeal = Articulo.init(name: "Zero",descriptionI: "foto con rating 0",zone: "Jaen", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest positive rating
        let positiveRatingMeal = Articulo.init(name: "Positive",descriptionI: "foto con rating 5",zone: "Jaen", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    // Confirm that the Meal initialier returns nil when passed a negative rating or an empty name.
    func testMealInitializationFails() {
        // Negative rating
        let negativeRatingMeal = Articulo.init(name: "Negative",descriptionI: "foto con rating -1",zone: "Jaen", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // Empty String
        let emptyStringMeal = Articulo.init(name: "",descriptionI: "foto con rating 0",zone: "Jaen", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
        // Rating exceeds maximum
        let largeRatingMeal = Articulo.init(name: "Large",descriptionI: "foto con rating 6",zone: "Jaen", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
    }

}
