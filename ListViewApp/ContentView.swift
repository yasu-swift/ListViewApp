//
//  ContentView.swift
//  ListViewApp
//
//  Created by 高橋康之 on 2020/09/06.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import SwiftUI
import Combine


struct ContentView: View {
    
    
    @ObservedObject var nList = namesList()
    
    @ObservedObject var tList = TaskList()
    
    @State var newTask : String = ""
    
    
    
    func addNewTask() {
          print(newTask)
        tList.tasks.append(Task(id: String(tList.tasks.count + 1), taskItem: newTask))
        self.newTask = ""
        print(newTask)
    }
    
    var addTaskBar : some View{
    HStack{
        TextField("追加してください",text: self.$newTask)
        Button(action: self.addNewTask, label: {Text("add")})
        }
    }
    
    
    func rowRemove(offsets: IndexSet) {
        self.tList.tasks.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                addTaskBar.padding()
                List {
                    ForEach(self.tList.tasks) { Index in
                    Text(Index.taskItem)
                    }
                    //delete追加
                    .onDelete(perform: rowRemove)
                   
                }
                //editButton追加
               
                .navigationBarTitle("Taskリスト")
                .navigationBarItems(trailing: EditButton())
                
            }
            
        }
        
        
    }
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
    
    
}
}
