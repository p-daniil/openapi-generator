//
// Swift5TestAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class Swift5TestAPI {
    /**
     Get all of the models
     
     - parameter clientId: (query) id that represent the Api client 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAllModels(clientId: String, apiResponseQueue: DispatchQueue = TestClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetAllModelsResult?, _ error: Error?) -> Void)) {
        getAllModelsWithRequestBuilder(clientId: clientId).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get all of the models
     - GET /allModels
     - This endpoint tests get a dictionary which contains examples of all of the models.
     - parameter clientId: (query) id that represent the Api client 
     - returns: RequestBuilder<GetAllModelsResult> 
     */
    open class func getAllModelsWithRequestBuilder(clientId: String) -> RequestBuilder<GetAllModelsResult> {
        let path = "/allModels"
        let URLString = TestClientAPI.basePath + path
        let parameters: [String: Any]? = nil

        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "client_id": clientId.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<GetAllModelsResult>.Type = TestClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}