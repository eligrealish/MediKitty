//
//  HomeTabView.swift
//  catmed_f2
//
//  Created by Eli Grealish on 23/07/2021.
//

import SwiftUI

struct HomeTabView: View {
    @State private var createNewMedActive = false
    var body: some View {
        NavigationView{
            ZStack{
                
        TabView{
            ScoreView()
                .tabItem {
                    
                    Image("SmallScoreIcon")
                        .renderingMode(.original)
                    Text("Score")
                }
            PastMedView()
                .tabItem {
                    Image("SmallMedIcon")
                    .renderingMode(.original)
                    Text("Medication")
                }
         
            
        }
        
        .toolbar{
            
            Button{
                createNewMedActive = true
                
            }label :{
                Label("Add", systemImage: "plus")
                    
            }
            
        }
        
        NavigationLink(destination: AddMedView(),isActive:$createNewMedActive){
            
            EmptyView()
        }
            }
        }.background(Color("TabViewColour"))
        .accentColor(Color("TextTabViewColour"))
        
        
        
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView().environmentObject(MainViewModel())
    }
}
