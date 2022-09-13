//
//  BarGraph.swift
//  Analytics-Page-UI
//
//  Created by Nguyen Van Thuan on 13/09/2022.
//

import SwiftUI

struct BarGraph: View {
    var downloads: [Download]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Icons dowloaded")
                    .fontWeight(.bold)
                
                Spacer()
                
                Menu {
                    Button("Month") { }
                    Button("Year") { }
                    Button("Day") { }
                } label: {
                    
                    HStack(spacing: 4) {
                        Text("this week")
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .scaleEffect(0.7)
                    }
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color.gray)
                }

            }
            
            HStack(spacing: 10) {
                Capsule()
                    .fill(Color("LightBlue"))
                    .frame(width: 30, height: 8)
                
                Text("Downloads")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Graph View ...
            GraphView()
                .padding(.top, 20)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.top, 25)
    }
    
    @ViewBuilder
    func GraphView() -> some View {
        GeometryReader { proxy in
            
            ZStack {
                VStack(spacing: 0) {
                    ForEach(getGraphLines(), id: \.self) { line in
                        HStack(spacing: 8) {
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                                .frame(height: 20)
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                            
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: -15)
                    }
                }
                
                HStack() {
                    ForEach(downloads) { download in
                        VStack(spacing: 0) {
                            VStack(spacing: 5) {
                                Capsule()
                                    .fill(Color("LightBlue"))
                                
                                Capsule()
                                    .fill(Color("DarkBlue"))
                            }
                            .frame(
                                width: 8,
                                height: getBarHeight(point: download.download,
                                                     size: proxy.size)
                            )
                            
                            Text(download.weekDay)
                                .font(.caption)
                                .frame(height: 25, alignment: .bottom)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                }
                .padding(.leading, 30)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 190)
    }
    
    // Handle Logic Data
    func getBarHeight(point: CGFloat, size: CGSize) -> CGFloat {
        let max = getMax()
        let height = (point / max) * (size.height - 37)
        return height
    }
    
    func getGraphLines() -> [CGFloat] {
        let max = getMax()
        var lines: [CGFloat] = []
        lines.append(max)
        
        for index in 1...4 {
            let progress = max / 4
            let result = max - (progress * CGFloat(index))
            lines.append(result)
        }
        
        return lines
    }
    
    func getMax() -> CGFloat {
        let max = downloads.max { first, scnd in
            return scnd.download > first.download
        }?.download ?? 0
        
        return max
    }
}


struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
