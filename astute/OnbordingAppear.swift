//
//  OnbordingAppear.swift
//  astute
//
//  Created by Aldanah Alqbbani on 20/06/1444 AH.
//

import SwiftUI

extension UserDefaults {
    
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
        }
    }
    
}
struct OnbordingAppear: View {
   
    var body: some View {
        if UserDefaults.standard.welcomeScreenShown{
            ContentView()
        } else {
            Onbording()
        }
    }
}

struct OnbordingAppear_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingAppear()
    }
}
