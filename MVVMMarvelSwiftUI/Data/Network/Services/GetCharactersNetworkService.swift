//
//  GetCharactersNetworkService.swift
//  MVVMMarvelSwiftUI
//
//  Created by Nacho on 05/03/2024.
//

import Foundation

protocol GetCharactersNetworkService {
    func execute(completion: @escaping (Result<ResponseListDTO, GetCharactersError>) -> Void)
    func execute() async throws -> ResponseListDTO
}

class DefaultGetCharactersNetworkService: GetCharactersNetworkService {
    func execute(completion: @escaping (Result<ResponseListDTO, GetCharactersError>) -> Void) {
        var components = URLComponents(string: Constants.baseURL + Constants.versionPath + Constants.charactersPath)!
        let hash = Encryptor.MD5(string: "1" + MarverDBManager.publicKey  + MarverDBManager.privateKey)
        components.queryItems = [
            URLQueryItem(name: Constants.ts, value: "1"),
            URLQueryItem(name: Constants.apikey, value: MarverDBManager.publicKey),
            URLQueryItem(name: Constants.hash, value: hash)
        ]

        let urlSession = URLSession.shared
        urlSession.dataTask(with: components.url!) { data, response, error in
            guard let data else {
                completion(.failure(.generic(message: "")))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                completion(.failure(.generic(message: "")))
                return
            }
            do {
                let products = try JSONDecoder().decode(ResponseListDTO.self, from: data)
                completion(.success(products))
            }
            catch {
                completion(.failure(.generic(message: "")))
            }
        }.resume()
    }

    func execute() async throws -> ResponseListDTO {
        var components = URLComponents(string: Constants.baseURL + Constants.versionPath + Constants.charactersPath)!
        let timestamp = String(Int(NSDate().timeIntervalSince1970))
        let hash = Encryptor.MD5(string: timestamp + MarverDBManager.privateKey + MarverDBManager.publicKey)
        components.queryItems = [
            URLQueryItem(name: Constants.ts, value: timestamp),
            URLQueryItem(name: Constants.apikey, value: MarverDBManager.publicKey),
            URLQueryItem(name: Constants.hash, value: hash)
        ]

        let urlSession = URLSession.shared
        let request = URLRequest(url: components.url!)
        let (data, response) = try await urlSession.data(for: request)
        let products = try JSONDecoder().decode(ResponseListDTO.self, from: data)
        return products
    }

    struct Constants {
        static let apikey = "apikey"
        static let ts = "ts"
        static let hash = "hash"
        static let baseURL = "http://gateway.marvel.com"
        static let versionPath = "/v1"
        static let charactersPath = "/public/characters"
    }
}
