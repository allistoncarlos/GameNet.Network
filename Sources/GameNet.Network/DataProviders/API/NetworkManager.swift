//
//  NetworkManager.swift
//
//  Created by Alliston Aleixo on 18/05/22.
//

import Alamofire
import Foundation
import Pulse

public class NetworkManager {
    public static let shared = NetworkManager()

    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad

        let responseCacher = ResponseCacher(behavior: .modify { _, response in
            let userInfo = ["date": Date()]
            return CachedURLResponse(
                response: response.response,
                data: response.data,
                userInfo: userInfo,
                storagePolicy: .allowed)
        })

        let pulseLogger = NetworkLogger()
        let pulseNetworkLoggerEventMonitor = NetworkLoggerEventMonitor(logger: pulseLogger)

        let defaultEventMonitor = DefaultEventMonitor()
        let requestsInterceptor = DefaultRequestInterceptor()

        return Session(
            configuration: configuration,
            interceptor: requestsInterceptor,
            cachedResponseHandler: responseCacher,
            eventMonitors: [defaultEventMonitor, pulseNetworkLoggerEventMonitor])
    }()

    @discardableResult
    public func performRequest<T: Decodable>(responseType: T.Type, endpoint: GameNetAPI, cache: Bool = false) async -> T? {
        do {
            let request = self.sessionManager.request(endpoint)
                .validate(statusCode: 200 ... 300)
                .cacheResponse(using: cache ? .cache : .doNotCache)

            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            let response = try await request.serializingDecodable(T.self, decoder: jsonDecoder).value

            return response
        } catch let error {
            print(error)
            return nil
        }
    }

    @discardableResult
    public func performUploadGame(data: GameEditRequest) async -> APIResult<GameEditResponse>? {
        do {
            let endpoint: GameNetAPI = .saveGame(data: data)

            let uploadClosure: (MultipartFormData) -> Void = { multipartFormData in
                multipartFormData.append(Data(data.name.utf8),
                                         withName: "Name")
                multipartFormData.append(Data(data.platformId.utf8),
                                         withName: "PlatformId")

                multipartFormData.append(data.cover, withName: "file", fileName: "file.png", mimeType: "image/jpeg")
            }

            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            let request = self.sessionManager.upload(multipartFormData: uploadClosure, with: endpoint)
            let response = try await
            request.serializingDecodable(APIResult<GameEditResponse>.self, decoder: jsonDecoder).value
            return response
        } catch let error {
            print(error)
            return nil
        }
    }
}
