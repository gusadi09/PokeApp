//
//  PokeAppApp.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import FirebaseCore
import GoogleSignIn
import SwiftUI
import SwiftData

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct PokeAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var navigation = NavigationRoutes.shared
    @StateObject var reachability = ReachabilityManager.shared
    @State var showNoConnection = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigation.path) {
                LoginView()
                    .navigationDestination(for: String.self) { route in
                        switch route {
                        case Route.home.rawValue:
                            PokemonListView()
                        default:
                            PokemonDetailView(viewModel: PokemonDetailViewModel(for: route))
                        }
                    }
            }
            .onAppear(perform: {
                reachability.startNetworkMonitoring()
            })
            .onReceive(reachability.isNotConnected, perform: { val in
                showNoConnection = val
            })
            .alert("Attention", isPresented: $showNoConnection) {
                Button("OK") { }
            } message: {
                Text("You're not connect to active network, please reconnect")
            }
        }
    }
}
