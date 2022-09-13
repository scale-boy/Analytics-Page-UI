//
//  BaseView.swift
//  Analytics-Page-UI
//
//  Created by nguyen.van.thuanc on 13/09/2022.
//

import SwiftUI

struct BaseView: View {
    
    // Using Image Names as Tab ...
    @State var currentTab = "home"
    
    // Hiding Native One ...
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Tab View ...
            TabView(selection: $currentTab) {
                
                Text("Home")
                    .tag("home")
                
                Text("Graph")
                    .tag("graph")
                
                Text("Chat")
                    .tag("chat")
                
                Text("Settings")
                    .tag("settings")
                
            }
            
            // Custom Tab bar ...
            HStack(spacing: 30) {
                
                Spacer(minLength: 20)
                
                // Tab Buttons ...
                TabButton(image: "home")
                TabButton(image: "graph")
                
                // Center Button
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(22)
                        .background(
                            Circle()
                                .fill(Color.blue)
                                .shadow(color: Color.blue.opacity(0.15), radius: 5, x: 0, y: 8)
                            
                        )
                }
                .offset(y: -20)
                .padding(.vertical, -15)

                
                TabButton(image: "chat")
                TabButton(image: "settings")
                
                Spacer(minLength: 20)
            }
            
        }
        
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(
                    currentTab == image ? Color.black : Color.gray.opacity(0.8)
                )
        }
    }
    
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
