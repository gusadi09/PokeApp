//
//  ReachabilityManager.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Alamofire
import Combine
import Foundation
import Network

final class ReachabilityManager: ObservableObject {
    
    var isNotConnected = PassthroughSubject<Bool, Never>()
    static let shared = ReachabilityManager()
    let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
    private let monitor = NWPathMonitor()
    
    func startNetworkMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                if path.status == .unsatisfied {
                    isNotConnected.send(true)
                } else if path.status == .satisfied {
                    isNotConnected.send(false)
                }
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}
