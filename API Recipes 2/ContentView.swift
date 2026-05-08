//
//  ContentView.swift
//  API Recipes 2
//
//  Created by Maya Krishnan on 5/8/26.
//

import SwiftUI

struct ContentView: View {
    @State private var recipes = [Recipe]()
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            List(recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                HStack {
                    AsyncImage(url: URL(string: recipe.image)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                        } else if phase.error != nil {
                            Color.red // shows if image fails
                        } else {
                            ProgressView() // loaing spinner
                        }
                    }
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                }
            }
            }
                .navigationTitle("Recipes")
            //.navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await loadRecipes()
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Loading Error"),
                message: Text("Could not load recipes."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func loadRecipes() async {
        let link = "https://dummyjson.com/recipes"
        if let url = URL(string: link) {
            if let (data, _) = try? await URLSession.shared.data(from: url) {
                if let decodedResponse = try? JSONDecoder().decode(RecipeResponse.self, from: data) {
                    recipes = decodedResponse.recipes
                }
            }
        }
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
