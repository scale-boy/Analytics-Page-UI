//
//  Home.swift
//  Analytics-Page-UI
//
//  Created by Nguyen Van Thuan on 13/09/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        // Home View
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 18) {
                
                // Bar View ...
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Weakly icons")
                            .font(.title.bold())
                            
                        
                        Text("reports is avaiable!")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 10)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .overlay {
                                Text("2")
                                    .font(.caption2.bold())
                                    .foregroundColor(Color.white)
                                    .padding(8)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -10)
                            }
                            .padding(15)
                            .background(Color.white)
                            .clipShape(Circle())
                            .offset(x: -10)
                    }

                }
                
                // Graph View ...
                BarGraph(downloads: downloads)
                
                // User View ...
                HStack(spacing: 0) {
                    // Progress View ...
                    UserProgress(title: "New Users",
                                 color: Color("LightBlue"),
                                 image: "person",
                                 progress: 68)
                    
                    UserProgress(title: "Old Users",
                                 color: Color("Pink"),
                                 image: "person",
                                 progress: 72)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(18)
                
                // Most Downloads ...
                VStack {
                    HStack {
                        Text("Most downloaded icons")
                            .font(.callout.bold())
                        
                        Spacer()
                        
                        Menu {
                            Button("More") { }
                            Button("Extra") { }
                        } label: {
                            Image("more")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 18, height: 18)
                                .foregroundColor(.primary)
                        }
                    }
                    
                    HStack(spacing: 15) {
                        Image(systemName: "flame.fill")
                            .font(.title2)
                            .foregroundColor(Color.red)
                        
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(18)
            }
        }
        .padding()
    }
    
    @ViewBuilder
    func UserProgress(title: String,
                      color: Color,
                      image: String,
                      progress: CGFloat) -> some View
    {
        HStack {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(color)
                .padding(10)
                .background(
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3),
                                    lineWidth: 2)
                        
                        Circle()
                            .trim(from: 0, to: progress / 100)
                            .stroke(color,
                                    lineWidth: 2)
                    }
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(Int(progress))%")
                    .fontWeight(.bold)
                
                Text(title)
                    .font(.caption2.bold())
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
