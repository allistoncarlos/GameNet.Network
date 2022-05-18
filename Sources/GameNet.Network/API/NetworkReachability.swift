//
//  NetworkReachability.swift
//  
//
//  Created by Alliston Aleixo on 18/05/22.
//

import Foundation
import Alamofire

protocol NetworkReachabilityDelegate: AnyObject {
    func showOfflineAlert()
    func dismissOfflineAlert()
}

final class NetworkReachability {
    static let shared = NetworkReachability()
    var delegate: NetworkReachabilityDelegate?

    let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")

    func startNetworkMonitoring() {
        reachabilityManager?.startListening { status in
            switch status {
            case .notReachable:
                self.delegate?.showOfflineAlert()
            case .reachable(.cellular):
                self.delegate?.dismissOfflineAlert()
            case .reachable(.ethernetOrWiFi):
                self.delegate?.dismissOfflineAlert()
            case .unknown:
                print("Unknown network state")
            }
        }
    }
}
