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
                
                Home()
                    .modifier(BGModifier())
                    .tag("home")
                
                Text("Graph")
                    .modifier(BGModifier())
                    .tag("graph")
                
                Text("Chat")
                    .modifier(BGModifier())
                    .tag("chat")
                
                Text("Settings")
                    .modifier(BGModifier())
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
                                .fill(Color("Plus"))
                                .shadow(color: Color("Plus").opacity(0.15), radius: 5, x: 0, y: 8)
                            
                        )
                }
                .offset(y: -20)
                .padding(.vertical, -15)

                
                TabButton(image: "chat")
                TabButton(image: "settings")
                
                Spacer(minLength: 20)
            }
            .padding(.top, 10)
            .background(
                Color("BG")
                    .ignoresSafeArea()
            )
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

struct BGModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BG").ignoresSafeArea())
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
