//
//  MedView.swift
//  catmed_fs
//
//  Created by Eli Grealish on 23/07/2021.
//

import SwiftUI

struct PastMedView: View {
    
    
    @EnvironmentObject var viewModel : MainViewModel
//    @StateObject var viewModel = MainViewModel()
    
    
    var body: some View {
       
            ZStack{
                Image("PastMedBackground")
                    .offset(x: 0, y: -55)

            VStack{
                ScrollView{
                    
                    //            Where the list of past medicaions goes
                    let medications = viewModel.GetMedicationList
                    VStack{
                        ForEach(medications,id: \.id){med in
                            
                            SinglePastMedView(med: med)
                        }
                       
                        
                        
                        
                    }
                    .padding(.top, 95)
                }
            }
            }
        }
        
        
        
        
        
    
    
    
    
    
    
}


struct MedView_Previews: PreviewProvider {
    static var previews: some View {
        PastMedView()
    }
}

struct SinglePastMedView: View {
    
    var med : Medication
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    
    
    var body: some View {
        ZStack{
            Image("MedTableIcons")
                .opacity(0.8)
        VStack{
            HStack{
            NavigationLink(
                destination: EditMedView(selectedDate: med.date, selectedMinuets: med.late,medication : med), label: {Text("Edit").font(.system(size: 19, weight: .light))
                })
                .padding(.top, -10)
            }
            .padding(.leading,340.0)
            .foregroundColor(.white)
            
            HStack{
            
            
            VStack{
                HStack{
            Text("\(med.date, formatter: Self.taskDateFormat)")
                .font(.system(size: 32, weight: .light)).foregroundColor(.white)
                    Spacer()
                    
                }
                HStack{
            Text("\(med.late) Minuets Late")
                .font(.system(size: 32, weight: .light)).foregroundColor(.white)
                    Spacer()
                }.offset(x: 0, y: 7)
                
            }
            }
            .padding(.leading, 99)
            
            
           
            
            
        }
        .padding(.bottom)
        
        
       
        }
    }
}
