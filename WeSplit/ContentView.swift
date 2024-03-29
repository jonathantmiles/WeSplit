//
//  ContentView.swift
//  WeSplit
//
//  Created by Jonathan T. Miles on 10/22/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage]) // gets the value out of the array using the indexing
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let numberOfPeopleAsADouble = Double(numberOfPeople) ?? 0
//        let peopleCount = Double(numberOfPeopleAsADouble + 2) // the @State stored var, plus the offset
        let amountPerPerson = grandTotal / numberOfPeopleAsADouble // peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
//                    Picker("Number of People", selection: $numberOfPeople) {
//                        ForEach (2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                }
                Section(header: Text("How mch tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total including tip")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
