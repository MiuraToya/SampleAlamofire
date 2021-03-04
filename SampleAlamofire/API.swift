//
//  API.swift
//  SampleAlamofire
//
//  Created by 三浦　登哉 on 2021/03/04.
//

import Foundation
import Alamofire



class API {
    let shared = API()
    
    
    private init() {}
    
    // デコード
    static func from(by data: Data) -> SearchModel<Repository>? {
        
        let decoder = JSONDecoder()
        do {
            print("DEBUG_PRINT: \(data)")
            let result = try decoder.decode(SearchModel<Repository>.self, from: data)
            print("DEBUG_PRINT: \(result)")
            return result
        } catch {
            print("DEBUG_PRINT: \(error.localizedDescription)")
            return nil
        }
    }
    
    // Alamofireを使ったAPI通信
    static func call(with keyword: String, block: @escaping(SearchModel<Repository>?) -> Void) -> Void {
        print("DEBUG_PRINT: よばれてるよー")
        let urlStr = "https://api.github.com/search/repositories"
        let param: [String : Any] = [
            "q": keyword
        ]
        Alamofire.AF.request(urlStr, method: .get, parameters: param).responseJSON { response in
            
            guard let data = response.data else {
                print("DEBUG_PRINT: nilです")
                block(nil)
                return
            }
          
            let albums = self.from(by: data)
         
            block(albums)
        }
    }
    
    
}
