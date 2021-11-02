//
//  AddMed.swift
//  catmed_f2
//
//  Created by Eli Grealish on 23/07/2021.
//

import SwiftUI
//import NavigationStack

struct AddMedView: View {
    
    
    
    @EnvironmentObject var viewModel : MainViewModel
//    @StateObject var viewModel = MainViewModel()
    
    @Environment(\.presentationMode) private var presentationMode : Binding<PresentationMode>
    
    @State var selectedDate = Date()
    
    @State var selectedMinuets = 0
    
    @State var kittyIsActive = false
    
    var body: some View {
        ZStack{
            Image("BlankMedBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(x: 0, y: -53)
        VStack{
           
            
            
            
           
            DatePicker("",selection : $selectedDate,in : ...Date())
                .datePickerStyle(CompactDatePickerStyle())
                .clipped()
                .labelsHidden()
                .offset(x: 0, y: -22.5)
                .accentColor(.white)
            
           
            VStack{
            Text("Minuets : \(selectedMinuets)")
                .font(.system(size: 32, weight: .regular))
                .foregroundColor(.white)
                .accentColor(.white)
            Stepper("", onIncrement: {
                selectedMinuets += 1
            }, onDecrement: {
                selectedMinuets -= 1
                if (selectedMinuets == -1){
                    selectedMinuets = 0
                }
                
            })
            .offset(x:-162.6,y:2)
            }.offset(x: 0, y: 182.5)
            
            
            
               
            
            Button(action: {
                
                
                
                let med = Medication(date: selectedDate, late: selectedMinuets)
                viewModel.medicationList.append(med)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image("SaveButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x: 0, y: -48)
            }).offset(x: 0, y: 240)
            
            
           
           
            
    
            
            
            
        }
    }
    }
}






//struct AddMed_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMed()
//    }
//}


struct AddMedView_Previews: PreviewProvider {
    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
        AddMedView()
    }
}
