//
//  AddIngredientData.swift
//  Recipe List App
//
//  Created by Rekha Aldas on 11/09/23.
//

import SwiftUI

struct AddIngredientData: View {
    
    @Binding var ingredients: [IngredientJSON]
    
    @State private var name = ""
    @State private var unit = ""
    @State private var num = ""
    @State private var denom = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Ingredients:")
                .bold()
                .padding(.top, 5)
            
            HStack {
                TextField("Sugar", text: $name)
                
                TextField("1", text: $num)
                    .frame(width: 20)
                
                Text("/")
                
                TextField("2", text: $denom)
                    .frame(width: 20)
                
                TextField("cups", text: $unit)
                
                Button("Add") {
                    
                    // Create an IngredientJSON object and set its properties
                    let i = IngredientJSON()
                    i.name = name
                    i.num = Int(num) ?? 1
                    i.denom = Int(denom) ?? 1
                    i.unit = unit
                    
                    // Add this ingredient to the list
                    ingredients.append(i)
                    
                    // Clear text fields
                    name = ""
                    num = ""
                    denom = ""
                    unit = ""
                }
            }
            
            ForEach(ingredients) { ingredient in
                Text("\(ingredient.name), \(ingredient.num ?? 1)/\(ingredient.denom ?? 1) \(ingredient.unit ?? "")")
            }
        }
    }
}

