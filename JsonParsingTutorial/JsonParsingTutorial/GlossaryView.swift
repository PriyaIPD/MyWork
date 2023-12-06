//
//  GlossaryView.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-04.
//

import SwiftUI

struct GlossaryView: View {
    var vm = UserViewModel()
    @State var glossary : GlossaryDTO?
    @State var details : [String?] = []

    var body: some View {
        VStack {
            Text("Glossary ❤️").font(.headline)
            Spacer()
            Text(self.glossary?.glossary.title.localizedCapitalized ?? "d")
                .bold()
            Spacer()
            Spacer()
            
            Text("ID is:\(self.glossary?.glossary.glossDiv.glossList.glossEntry.id ?? "")")
            Text("Term is:\(self.glossary?.glossary.glossDiv.glossList.glossEntry.Glossterm ?? "")")
            Text("Abbr is:\(self.glossary?.glossary.glossDiv.glossList.glossEntry.abbrev ?? "")")
            
            
            Spacer()
            Spacer()
            Spacer()
            
            Text("Gloss Para is:\(self.glossary?.glossary.glossDiv.glossList.glossEntry.glossDef.para ?? "")").bold()
            List {
                ForEach(self.details, id: \.self) { a in
                    Text(a!)
                    
                }
                
            }
        }
            .onAppear(perform: {
                vm.getGlossaryItems { glossObj, detailsObj in
                    glossary = glossObj
                    self.details = detailsObj
                }
            })
            .navigationBarBackButtonHidden(true)
        }
        
    
    
}
