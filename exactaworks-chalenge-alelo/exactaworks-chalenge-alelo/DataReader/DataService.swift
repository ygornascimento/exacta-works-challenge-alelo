//
//  DataService.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 07/12/23.
//

import UIKit

final class DataService {

    private static let sessionConfiguration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.allowsCellularAccess = true
        config.allowsConstrainedNetworkAccess = true
        config.allowsExpensiveNetworkAccess = true
        config.timeoutIntervalForRequest = 5

        return config
    }()

    private static let session = URLSession(configuration: sessionConfiguration)

    class func loadData(fromUrl: String? = nil, onComplete: @escaping (AllProducts) -> Void, onError: @escaping (DataErros) -> Void) {
        guard let requestURL = fromUrl else { return }

        guard let url = URL(string: requestURL) else {
            onError(.incorrectURL)
            return
        }

        let dataTask = session.dataTask(with: url) { data, response, error in

            if error == nil {
                guard let statusCodeResponse = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }

                if statusCodeResponse.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let decodedData = try JSONDecoder().decode(AllProducts.self, from: data)
                        onComplete(decodedData)
                    } catch {
                        onError(.noData)
                    }

                } else {
                    onError(.responseStatusCode(code: statusCodeResponse.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
                print("Erro do App ao tentar fazer a requisição de rede.")
            }
        }
        dataTask.resume()
    }

    class func loadImage(fromUrl: String? = nil, onComplete: @escaping (UIImage) -> Void, onError: @escaping (DataErros) -> Void) {

        guard let requestURL = fromUrl else { return }
        
        guard let url = URL(string: requestURL) else {
            onError(.incorrectURL)
            return
        }

        let dataTask = session.dataTask(with: url) { data, response, error in

            if error == nil {
                guard let statusCodeResponse = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }

                if statusCodeResponse.statusCode == 200 {
                    guard let data = data,
                          let image = UIImage(data: data) else { return }
                    onComplete(image)
                } else { onError(.responseStatusCode(code: statusCodeResponse.statusCode)) }
            } else {
                onError(.taskError(error: error!))
                print("Erro ao tentar fazer requisição da imagem...")
            }
        }
        dataTask.resume()
    }
    
    class func loadJson(filename fileName: String) -> ProductsList? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ProductsList.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
