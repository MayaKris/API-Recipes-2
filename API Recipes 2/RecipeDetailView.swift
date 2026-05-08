//
//  RecipeDetailView.swift
//  API Recipes 2
//
//  Created by Maya Krishnan on 5/8/26.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 220)
                .cornerRadius(12)
                
                Text(recipe.name)
                    .font(.title)
                    .bold()
                
                Text("Ingredients")
                    .font(.headline)
                
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("• \(ingredient)")
                }
                
                Text("Instructions")
                    .font(.headline)
                    .padding(.top)
                
                ForEach(recipe.instructions, id: \.self) { step in
                    Text("• \(step)")
                }
            }
            .padding()
        }
    }
}
