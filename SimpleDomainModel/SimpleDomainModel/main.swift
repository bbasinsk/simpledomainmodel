//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
    let exchangeRates = [
        "USD": ["USD": 1.0/1.0, "GBP": 1.0/2.0, "EUR": 3.0/2.0, "CAN": 5.0/4.0],
        "GBP": ["GBP": 1.0/1.0, "USD": 2.0/1.0, "EUR": 3.0/1.0, "CAN": 5.0/2.0],
        "CAN": ["CAN": 1.0/1.0, "USD": 4.0/5.0, "GBP": 4.0/5.0, "EUR": 6.0/5.0],
        "EUR": ["EUR": 1.0/1.0, "USD": 2.0/3.0, "GBP": 1.0/3.0, "CAN": 5.0/6.0]
    ]
    
    public var amount : Int
    public var currency : String
    
    public func convert(_ to: String) -> Money {
        // should probably be adding some currency validation here but 🤷‍♂️
        let rate: Double = exchangeRates[self.currency]![to]!
        let amount = Int(Double(self.amount) * rate)
        return Money(amount: amount, currency: to)
    }
    
    public func add(_ to: Money) -> Money {
        let selfInGiven = self.convert(to.currency)
        let totAmount = to.amount + selfInGiven.amount
        return Money(amount: totAmount, currency: to.currency)
    }
    
    public func subtract(_ from: Money) -> Money {
        let selfInGiven = self.convert(from.currency)
        let totAmount = from.amount - selfInGiven.amount
        return Money(amount: totAmount, currency: from.currency)
    }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
    return 0
  }
  
  open func raise(_ amt : Double) {
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { return self._job }
    set(value) {
        self._job = value
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { return self._spouse }
    set(value) {
        self._spouse = value
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
    return ""
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
    return false
  }
  
  open func householdIncome() -> Int {
    return 0
  }
}





