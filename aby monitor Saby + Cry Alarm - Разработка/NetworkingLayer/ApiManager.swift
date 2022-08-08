//
//  ApiManager.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 26/07/22.

import Foundation
import Alamofire
import UIKit
//import AlamofireNetworkActivityLogger
class ApiManager:NSObject{
    
    static let shared = ApiManager()
    private override init() {
    }
    
    func parametrs()->Parameters{
        return ["userid”:”xnmtyrdx”,”bcode":"HDF"] as Parameters
    }
    
    
    //    func headersBearer()->HTTPHeaders{
    //        return [ "Authorization": "Bearer \("S09CRUxDTw== :S09CRUxDT0FQSQ==")",
    //                 "Accept": "application/json"] as HTTPHeaders
    //    }
    func headersBearer()->HTTPHeaders{
        return [ "Authorization":"S09CRUxDTw== :S09CRUxDT0FQSQ==",
                 "Accept": "application/json"] as HTTPHeaders
    }
    func headersWith_ContentType()->HTTPHeaders{
        return ["Content-Type": "application/json"] as HTTPHeaders
    }
    
    static var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    
    
    // post
    func post<T:Codable>(url:String,params:[String:Any], heaader: HTTPHeaders? = nil,encoding:JSONEncoding = .default, completion: @escaping (T?, _ error:String?) -> ()){
        
        if ApiManager.isConnectedToInternet == false {
            completion(nil,ErrorMessages.no_internet)
            showNetworkAlert()
            return
        }
        DispatchQueue.main.async{
            //  CommonLoader.shared.active_with(value: true)
            AF.request(url, method: .post, parameters: params, encoding: encoding, headers: heaader).responseData { (response) in
                print("🌎 URL====>",url)
                print("🌎 method====> POST")
                print("🌎 params====>",params)
                print("🌎 encoding====>",encoding)
                print("🌎 heaader====>",heaader!)
                print("🌎 response====>",response)
                //                LOADER  {{Base URL}}/api/KBLCustomerApp/CustomerLogin
                
                // CommonLoader.shared.active_with(value: false)
                switch response.result {
                case .success(let data):
                    do {
                        //  let str = String(decoding: data, as: UTF8.self)
                        // print(str)
                        let model = try JSONDecoder().decode(T.self, from: data)
                        completion(model,nil)
                    } catch let jsonErr {
                        completion(nil,jsonErr.localizedDescription)
                    }
                case .failure(let err):
                    completion(nil,err.localizedDescription)
                }
            }
        }
    }
    
    // get
    func get<T:Codable>(url:String,params:[String:Any]?, heaader:HTTPHeaders? = nil ,encoding :URLEncoding = .default,completion: @escaping (T?, _ error:String?) -> ()) {
        
        if ApiManager.isConnectedToInternet == false {
            completion(nil,ErrorMessages.no_internet)
            showNetworkAlert()
            return
        }
        DispatchQueue.main.async{
            
            // CommonLoader.shared.active_with(value: true)
            AF.request(url, method: .get, parameters: params, encoding:encoding, headers: heaader)
                .responseData { (response) in
                    print("🌎 URL====>",url)
                    print("🌎 method====> .GET")
                    print("🌎 params====>",params!)
                    print("🌎 encoding====>",encoding)
                    print("🌎 heaader====>",heaader!)
                    print("🌎 response====>",response)
                    //    CommonLoader.shared.active_with(value: false)
                    switch response.result {
                    case .success(let data):
                        do {
                            let model = try JSONDecoder().decode(T.self, from: data)
                            
                            
                            completion(model,nil)
                        } catch let jsonErr {
                            completion(nil,jsonErr.localizedDescription)
                        }
                    case .failure(let err):
                        completion(nil,err.localizedDescription)
                    }
                }
        }
    }
    // MARK:- PUT
    func put<T:Codable>(url:String,params:[String:Any]?, heaader:HTTPHeaders? = nil ,encoding :URLEncoding = .default,completion: @escaping (T?, _ error:String?) -> ()) {
        
        
        if ApiManager.isConnectedToInternet == false {
            completion(nil,ErrorMessages.no_internet)
            showNetworkAlert()
            return
        }
        DispatchQueue.main.async{
            //    CommonLoader.shared.active_with(value: true)
            AF.request(url, method: .put, parameters: params, encoding:encoding, headers: heaader)
                .responseData { (response) in
                    print("🌎 URL====>",url)
                    print("🌎 method====> .PUT")
                    print("🌎 params====>",params!)
                    print("🌎 encoding====>",encoding)
                    print("🌎 heaader====>",heaader!)
                    print("🌎 response====>",response)
                    //      CommonLoader.shared.active_with(value: false)
                    switch response.result {
                    case .success(let data):
                        do {
                            let model = try JSONDecoder().decode(T.self, from: data)
                            completion(model,nil)
                        } catch let jsonErr {
                            completion(nil,jsonErr.localizedDescription)
                        }
                    case .failure(let err):
                        completion(nil,err.localizedDescription)
                    }
                }
        }
    }
    
    // MARK:- DELETE
    func delete<T:Codable>(url:String,params:[String:Any]?, heaader:HTTPHeaders? = nil ,encoding :URLEncoding = .default,completion: @escaping (T?, _ error:String?) -> ()) {
        if ApiManager.isConnectedToInternet == false {
            completion(nil,ErrorMessages.no_internet)
            showNetworkAlert()
            return
        }
        DispatchQueue.main.async{
            
            //    CommonLoader.shared.active_with(value: true)
            AF.request(url, method: .delete, parameters: params, encoding:encoding, headers: heaader)
                .responseData { (response) in
                    print("🌎 URL====>",url)
                    print("🌎 method====> .DELET")
                    print("🌎 params====>",params!)
                    print("🌎 encoding====>",encoding)
                    print("🌎 heaader====>",heaader!)
                    print("🌎 response====>",response)
                    //     CommonLoader.shared.active_with(value: false)
                    switch response.result {
                    case .success(let data):
                        do {
                            let model = try JSONDecoder().decode(T.self, from: data)
                            completion(model,nil)
                        } catch let jsonErr {
                            completion(nil,jsonErr.localizedDescription)
                        }
                    case .failure(let err):
                        completion(nil,err.localizedDescription)
                    }
                }
        }
    }
    
    // cancel pending requests
    func cancelPendingRequests(){
        DispatchQueue.main.async{
            
            Alamofire.Session.default.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
                sessionDataTask.forEach { $0.cancel() }
                uploadData.forEach { $0.cancel() }
                downloadData.forEach { $0.cancel() }
            }
        }
    }
    func showNetworkAlert(){
        DispatchQueue.main.async {
            print("NETWORK ISSUE")
            //let topVC = UIApplication.getTopViewController()
            
            //  topVC?.native_Alert(title: AppNotification.appName, message:AppNotification.netWorkIssue, actionTitles: ["Ok"], actions: [nil])
        }
    }
}

struct ErrorMessages {
    static let serverError = "We're having trouble with our server.\nPlease check back after some time."
    static let commonError = "Something went wrong.\nPlease check back after some time."
    static let no_data = "no_data"
    static let no_tags = "no_tags"
    static let no_internet = "You are not connected to the internet."
}
extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint(self)
        #endif
        return self
    }
}
