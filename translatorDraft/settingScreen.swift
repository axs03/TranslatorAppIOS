import SwiftUI

struct SettingScreen: View {
    
    @State private var selectedPlan: String? = nil
    let plans = ["Free Plan", "Premium Plan"]
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            List {
                // Plan Section
                Section(header: Text("Plan")) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(plans, id: \.self) { plan in
                            CardView(plan: plan, isSelected: plan == selectedPlan)
                                .onTapGesture {
                                    selectedPlan = plan
                                }
                        }
                    }
//                    .padding()
                }
                
                // General Section
                Section(header: Text("General")) {
                    NavigationLink(destination: AboutScreen()) {
                        Text("How To Use")
                    }
                    NavigationLink(destination: underConstructionScreen()) {
                        Text("Account")
                    }
                    NavigationLink(destination: underConstructionScreen()) {
                        Text("Themes")
                    }
                }
                
                // Legal Section
                Section(header: Text("Legal")) {
                    NavigationLink(destination: underConstructionScreen()) {
                        Text("Licensing")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationTitle("Settings")
    }
}

struct CardView: View {
    let plan: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Text(plan)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.txtColors)
                .padding()
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.highlighting)
                    .font(.title)
                    .padding(.bottom, 5)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.txtColors)
                    .font(.title)
                    .padding(.bottom, 5)
            }
        }
        .background(Color.background)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
//        .padding([.top])
        .frame(width: 200, height: 150)
    }
}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingScreen()
        }
    }
}
