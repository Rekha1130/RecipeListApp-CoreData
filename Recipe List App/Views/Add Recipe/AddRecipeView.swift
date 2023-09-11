//
//  AddRecipeView.swift
//  Recipe List App
//
//  Created by Rekha Aldas on 10/09/23.
//

import SwiftUI

struct AddRecipeView: View {
    
    // Properties for meta data
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    // List type meta data
    @State private var highlights = [String]()
    @State private var directions = [String]()
    
    // Ingredients data
    @State private var ingredients = [IngredientJSON]()
    
    var body: some View {
        
        VStack {
            
            // HStack with the form controls
            HStack {
                Button("Clear") {
                    // Clear the form
                    clear()
                }
                
                Spacer()
                
                Button("Add") {
                    // Add the recipe to core data
                    addRecipe()
                    
                    // Clear the form
                    clear()
                }
            }
            
            // ScrollView
            ScrollView(showsIndicators: false) {
                
                VStack {
                    
                    // The recipe meta data
                    
                    AddMetaData(name: $name,
                                summary: $summary,
                                prepTime: $prepTime,
                                cookTime: $cookTime,
                                totalTime: $totalTime,
                                servings: $servings)
                    
                    // List data
                    AddListData(list: $highlights, title: "Highlights", placeholderText: "Vegetarian")
                    
                    AddListData(list: $directions, title: "Directions", placeholderText: "Add oil to the pan.")
                    
                    // Ingredient Data
                    AddIngredientData(ingredients: $ingredients)
                }
            }
        }
        .padding(.horizontal)
    }
    
    func clear() {
        
        // Clear all the form fields
        name = ""
        summary = ""
        prepTime = ""
        cookTime = ""
        totalTime = ""
        servings = ""
        
        highlights = [String]()
        directions = [String]()
        
        ingredients = [IngredientJSON]()
    }
    
    func addRecipe() {
        
        // Add the recipe into core data
        
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
