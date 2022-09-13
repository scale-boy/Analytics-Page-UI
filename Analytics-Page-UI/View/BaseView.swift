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
            HStack(spacing: 40) {
                
                // Tab Buttons ...
                
            }
        }
        
    }
    
    @ViewBuilder
    func 
    
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
