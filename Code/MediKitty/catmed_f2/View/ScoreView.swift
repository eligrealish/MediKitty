//
//  ScoreView.swift
//  catmed_fs
//
//  Created by Eli Grealish on 23/07/2021.
//

import SwiftUI
import Foundation

struct ScoreView: View {
    
    let color1: UIColor = UIColor(named: "Color1") ?? .white
    @State private var minuets = 100
    
    
    @EnvironmentObject var viewModel : MainViewModel
    
//    @State var score = 0
    
//    For debugging score
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    func calculateScore() -> Int{
       
        
        var lateSum = 0
        
        for m in viewModel.GetMedicationList{
            lateSum += m.late
        }
        let lateMean = Double(lateSum/viewModel.GetMedicationList.count)
        
        let zeroMin = Double(minuets)
        let zeroMax = Double(zeroMin)*0.87
        let oneMax = Double(zeroMax)*0.84
        let twoMax = Double(oneMax)*0.8
        let threeMax = Double(twoMax)*0.9
        let fourMax = Double(threeMax)*0.9
        let fiveMax = Double(fourMax)*0.55
        let sixMax = Double(fiveMax)*0.15
        let sevenMax = 0.0
        
        var score = 0
        
        if (zeroMin > lateMean)  && (zeroMax <= lateMean){
            score = 0
            
        }
        else if (zeroMax > lateMean)  && (oneMax <= lateMean){
            score = 1
        }
        else if (oneMax > lateMean)  && (twoMax <= lateMean){
            score = 2
        }
        else if (twoMax > lateMean)  && (threeMax <= lateMean){
            score = 3
        }
        else if (threeMax > lateMean)  && (fourMax <= lateMean){
            score = 4
        }
        else if (fourMax > lateMean)  && (fiveMax <= lateMean){
            score = 5
        }
        else if (fiveMax > lateMean)  && (sixMax <= lateMean){
            score = 6
        }
        else if (sixMax > lateMean)  && (sevenMax <= lateMean){
            score = 7
        }
        
        
       
        
        
        return score
    }
    
    var body: some View {
        ZStack{
                    Image("ScoreBackground")
                        .offset(x: 0, y: -55)
                
        VStack{
           
            Image("Kitty\(calculateScore())")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 467, height: 460
                       , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(x: 8 , y: 0)
            let medications = viewModel.GetMedicationList
            ForEach(medications,id: \.id){med in
                
            }
          
            
           
        
        Text("Kitty will be 😭 if your average")
            .font(.system(size: 27, weight: .regular))
            .foregroundColor(.white)
        Text("lateness is \(minuets) minuets").font(.system(size: 27, weight: .regular))
            .foregroundColor(.white)
            
            
        Stepper("", onIncrement: {
            minuets += 1
        }, onDecrement: {
            minuets -= 1
            if (minuets == -1){
                minuets = 0
            }
            
            
        }).offset(x:-184)
        .foregroundColor(Color(color1))
        
        }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
