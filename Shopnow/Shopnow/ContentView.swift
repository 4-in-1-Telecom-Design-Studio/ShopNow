//
//  ContentView.swift
//  Shopnow
//
//  Created by Charlithia Palmer on 8/22/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    @State var show = false
    var body: some View {
        ZStack(alignment: .top, content: {
            ScrollView(.vertical, showsIndicators: false, content: {
                        VStack {
                            GeometryReader { g in
                                Image("poster")
                                    .resizable()
                                    .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY: 0)
                                    .frame(height: g.frame(in: .global).minY > 0 ?
                                        UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY:
                                        UIScreen.main.bounds.height / 2.2)
                                    .onReceive(self.time)
                                    { (_) in
                                        
                                        let y = g.frame(in: .global).minY
                                        if -y > (UIScreen.main.bounds.height / 2.2) - 50{
                                            self.show = true
                                    }
                                        else{
                                            self.show = false
                                        }
                                }
                            }
                            .frame(height: UIScreen.main.bounds.height / 2.2)
                            VStack {
                                HStack {
                                    Text("Top Artists")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    Spacer()
                                    Button(action: {
                                        
                                    }) {
                                        
                                        Text("See All")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    }
                                }
                                
                                VStack(spacing: 20) {
                                    ForEach(data){ i in
                                        CardView(data: i)
                                        
                                    }
                                    
                                }
                                .padding(.top)
                            }
                            .padding()
                            Spacer()
                        }
            })
        })
        .edgesIgnoringSafeArea(.top)
    }
}

// CardView
struct CardView: View {
    var data: Card
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(self.data.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipped()
            
            VStack(alignment: .leading, spacing: 6) {
                Text(self.data.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(self.data.subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack(spacing: 12) {
                    Button(action: {
                        
                    }) {
                        Text("GET")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            // For Adapting to Dark Mode
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())
                    }
                        Text("In App\nPurchases")
                            .font(.caption)
                            .foregroundColor(.gray)
                }
            }
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Sample Data for Cards
struct Card: Identifiable {
    var id: Int
    var image: String
    var title: String
    var subTitle: String
}

var data = [
    Card(id: 0, image: "g1", title: "2 Chainz", subTitle: "Download 2 Chainz Music"),
    Card(id: 1, image: "g2", title: "21 Savage", subTitle: "Download 21 Savage Music"),
    Card(id: 2, image: "g3", title: "Ann Marie", subTitle: "Download Ann Marie Music"),
    Card(id: 3, image: "g4", title: "Asap Rocky", subTitle: "Download Asap Rocky Music"),
    Card(id: 4, image: "g5", title: "Big Sean", subTitle: "Download Big Sean Music"),
    Card(id: 5, image: "g6", title: "Cardi B", subTitle: "Download Cardi B Music"),
    Card(id: 6, image: "g7", title: "Chance the Rapper", subTitle: "Download Chane the Rapper Music"),
    Card(id: 7, image: "g8", title: "Chris Brown", subTitle: "Download Chris Brown Music"),
    Card(id: 8, image: "g9", title: "DJ Khaled", subTitle: "Download DJ Khaled Music"),
    Card(id: 9, image: "g10", title: "Ella Mai", subTitle: "Download Ella Mai Music"),
    Card(id: 10, image: "g11", title: "Fetty Wap", subTitle: "Download Fetty Wap Music"),
    Card(id: 11, image: "g12", title: "Future", subTitle: "Download Future Music"),
    Card(id: 12, image: "g13", title: "Gucci Mane", subTitle: "Download Gucci Mane Music"),
    Card(id: 13, image: "g14", title: "J. Cole", subTitle: "Download J. Cole Music"),
    Card(id: 14, image: "g15", title: "Kendrick Lamar", subTitle: "Download Kendrick Lamar Music"),
    Card(id: 15, image: "g16", title: "Khalid", subTitle: "Download Khalid Music"),
    Card(id: 16, image: "g17", title: "Lil Baby", subTitle: "Download Lil Baby Music"),
    Card(id: 17, image: "g18", title: "Migos", subTitle: "Download Migos Music"),
    Card(id: 18, image: "g19", title: "Nicki Minaj", subTitle: "Download Nicki Mainaj Music"),
    Card(id: 19, image: "g20", title: "Pusha T", subTitle: "Download Pusha T Music"),
    Card(id: 20, image: "g21", title: "Rae Sremmurd", subTitle: "Download Rae Sremmurd Music"),
    Card(id: 21, image: "g22", title: "Rick Ross", subTitle: "Download Rick Ross Music"),
    Card(id: 22, image: "g23", title: "Russ", subTitle: "Download Russ Music"),
    Card(id: 23, image: "g24", title: "Snoop Dogg", subTitle: "Download Snoop Dogg Music"),
    Card(id: 24, image: "g25", title: "The Weeknd", subTitle: "Download The Weeknd Music"),
    Card(id: 25, image: "g26", title: "Tory Lanez", subTitle: "Download Tory Lanez Music"),
    Card(id: 26, image: "g27", title: "Trey Songz", subTitle: "Download Trey Songz Music"),
    Card(id: 27, image: "g28", title: "TY Dolla Sign", subTitle: "Download TY Dolla Sign Music"),
    Card(id: 28, image: "g29", title: "Tyga", subTitle: "Download Tyga Music"),
    Card(id: 29, image: "g30", title: "Usher", subTitle: "Download Usher Music"),
    Card(id: 30, image: "g31", title: "Wiz Khalifa", subTitle: "Download Wiz Khalifa Music"),
    Card(id: 31, image: "g32", title: "Young Thug", subTitle: "Download Young Thug Music"),
    Card(id: 32, image: "g33", title: "Young NBA Boy", subTitle: "Download Young NBA Boy Music"),
]
