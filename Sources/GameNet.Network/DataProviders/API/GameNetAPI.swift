//
//  GameNetAPI.swift
//
//  Created by Alliston Aleixo on 18/05/22.
//

import Foundation
import Alamofire

internal struct APIConstants {
    static let apiPath: String = (Bundle.main.infoDictionary!["API_PATH"] as? String)!
    
    static let userResource = "user"
    static let dashboardResource = "dashboard"
    static let gameResource = "usergame"
    static let gameplaySessionResource = "gameplaysession"
    static let platformResource = "platform"
    static let listResource = "list"
}

public enum GameNetAPI {
    case login(data: LoginRequest)
    case refreshToken
    case dashboard
    case platforms
    case platform(id: String)
    case savePlatform(id: String?, data: PlatformRequest)

    case lists
    case finishedByYearList(id: String)
    case boughtByYearList(id: String)
    case list(id: String)
    case saveList(id: String?, data: ListRequest)

    case games(search: String?, page: Int?, pageSize: Int?)
    case game(id: String)
    case saveGame(data: GameEditRequest)
    case saveUserGame(data: UserGameEditRequest)
    case gameplays(id: String)

    var baseURL: String {
        switch self {
        default:
            return APIConstants.apiPath
        }
    }

    var path: String {
        switch self {
        case .login:
            return "\(APIConstants.userResource)/login"
        case .refreshToken:
            return "\(APIConstants.userResource)/refresh"
        case .dashboard:
            return APIConstants.dashboardResource
        case .platforms:
            return APIConstants.platformResource
        case let .platform(id):
            return "\(APIConstants.platformResource)/\(id)"
        case let .savePlatform(id, _):
            if let id = id {
                return "\(APIConstants.platformResource)?id=\(id)"
            }

            return "\(APIConstants.platformResource)/"

        case .lists:
            return APIConstants.listResource
        case let .finishedByYearList(id):
            return "\(APIConstants.listResource)/FinishedByYear/\(id)"
        case let .boughtByYearList(id):
            return "\(APIConstants.listResource)/BoughtByYear/\(id)"
        case let .list(id):
            return "\(APIConstants.listResource)/\(id)"
        case let .saveList(id, _):
            if let id = id {
                return "\(APIConstants.listResource)?id=\(id)"
            }

            return APIConstants.listResource

        case let .games(search, page, pageSize):
            var resultUrl = "\(APIConstants.gameResource)?"

            if let search = search {
                resultUrl = "\(resultUrl)search=\(search)&"
            }

            if let page = page {
                resultUrl = "\(resultUrl)page=\(page)&"
            }

            if let pageSize = pageSize {
                resultUrl = "\(resultUrl)pageSize=\(pageSize)&"
            }

            return resultUrl
        case let .game(id):
            return "\(APIConstants.gameResource)/\(id)"
        case .saveGame:
            return "game"
        case .saveUserGame:
            return APIConstants.gameResource
        case let .gameplays(id):
            return "\(APIConstants.gameplaySessionResource)?userGameId=\(id)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .dashboard,
             .platforms,
             .platform,

             .lists,
             .finishedByYearList,
             .boughtByYearList,
             .list,

             .games,
             .game,
             .gameplays:
            return .get
        case .login,
             .refreshToken:
            return .post
        case let .savePlatform(id, _):
            if id != nil {
                return .put
            }

            return .post
        case let .saveList(id, _):
            if id != nil {
                return .put
            }

            return .post
        case .saveGame,
             .saveUserGame:
            return .post
        }
    }

    var parameterEncoder: ParameterEncoder {
        switch method {
        case .get: return URLEncodedFormParameterEncoder()
        default:
            let encoder = JSONParameterEncoder()
            encoder.encoder.dateEncodingStrategy = .iso8601
            return encoder
        }
    }

    func encodeParameters(into request: URLRequest) throws -> URLRequest {
        switch self {
        case let .login(parameters):
            return try parameterEncoder.encode(parameters, into: request)
        case let .saveList(_, model):
            return try parameterEncoder.encode(model, into: request)
        case let .savePlatform(_, model):
            return try parameterEncoder.encode(model, into: request)
        case let .saveGame(model):
            var request = request
            request.headers.update(name: "Content-Type", value: "multipart/form-data; charset=UTF-8")

            return try parameterEncoder.encode(model, into: request)
        case let .saveUserGame(model):
            return try parameterEncoder.encode(model, into: request)
        case .refreshToken:
            return request
        case .dashboard,
             .platforms,
             .platform,

             .lists,
             .finishedByYearList,
             .boughtByYearList,
             .list,

             .games,
             .game,
             .gameplays:
            return request
        }
    }

    var isRefreshToken: Bool {
        switch self {
        case .refreshToken:
            return true
        default:
            return false
        }
    }
}

extension GameNetAPI: URLRequestConvertible {
    public func asURLRequest() throws -> URLRequest {
        let resultUrl = "\(baseURL)/\(path)"

        let url = try resultUrl.asURL()
        var request = URLRequest(url: url)
        request.method = method

        return try encodeParameters(into: request)
    }
}
