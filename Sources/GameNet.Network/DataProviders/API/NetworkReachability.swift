//
//  NetworkReachability.swift
//
//  Created by Alliston Aleixo on 18/05/22.
//

import Foundation
import Alamofire

public protocol NetworkReachabilityDelegate: AnyObject {
    func showOfflineAlert()
    func dismissOfflineAlert()
}

public class NetworkReachability {
    public static let shared = NetworkReachability()
    public var delegate: NetworkReachabilityDelegate?

    let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")

    public func startNetworkMonitoring() {
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
