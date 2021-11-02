//
//  MainViewModel.swift
//  catmed_f2
//
//  Created by Eli Grealish on 23/07/2021.
//

import Foundation

class MainViewModel  : ObservableObject{
    
    @Published var medicationList : [Medication] = []
  
    
//    Creates dummy data
    init(){
        
        let date0 = Date.init(timeIntervalSinceNow: -86400*1)
//        let date1 = Date.init(timeIntervalSinceNow: -86400*2)
//        let date2 = Date.init(timeIntervalSinceNow: -86400*3)
//        let date3 = Date.init(timeIntervalSinceNow: -86400*4)
//        let date4 = Date.init(timeIntervalSinceNow: -86400*5)
//        let date5 = Date.init(timeIntervalSinceNow: -86400*6)
//        let date6 = Date.init(timeIntervalSinceNow: -86400*7)
        
        let med0 = Medication(date:date0,late:7)
        
        medicationList.append(med0)
       
    }
    
    func SetMedicationList(_ MedList : Array<Medication>){
        medicationList = MedList
    }
    
    var GetMedicationList : Array<Medication>{
        medicationList
    }
    
   
    
}

