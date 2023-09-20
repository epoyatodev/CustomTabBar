//
//  CustomTabView.swift
//  CustomTabBar
//
//  Created by Enrique Poyato Ortiz on 20/9/23.
//

import SwiftUI

struct CustomTabView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    @Binding var selectedTab: Int
    @Namespace private var animationNamespace
    @State private var bounce = 0

    var body: some View {
        ZStack{
            Capsule()
                .frame(height: 80)
                .foregroundStyle(.ultraThinMaterial)
                .shadow(radius: 2)
            
            HStack{
                ForEach (0..<5, id: \.self) { index in
                    
                    if let tabBarItems = viewModel.tabBarItems {
                        Button{
                            selectedTab = index
                        }label: {
                            VStack(spacing: 8){
                                if selectedTab == index{
                                    
                                    Image(systemName: tabBarItems[index].image)
                                        .symbolEffect(.bounce.up.byLayer, value: bounce)
                                        .onAppear{
                                            bounce = bounce + 1
                                        }
                                } else {
                                    Image(systemName: tabBarItems[index].image)
                                    
                                }
                                                            
                                Text(tabBarItems[index].title)
                                    .font(.caption)
                            }
                            .padding(.top)
                            .foregroundStyle(selectedTab == index ? .blue : .gray)
                            .fontWeight(selectedTab == index ? .medium : .light)
      
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .frame(height: 80)
            .padding(.horizontal, 16)
            .clipShape(Capsule())
            .padding(.bottom)
            
        }
        .padding(.horizontal)

    }
}

#Preview {
    CustomTabView(selectedTab: .constant(0))
}
