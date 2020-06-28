//
//  NYTViewModel.swift
//  NYTimes
//
//  Created by Abdul on 22/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import UIKit

 class NYTViewModel {
    
    var viewModelTableData : NYTResponse? = nil
    
    
    func fetchNYTApiResults(request: URLRequest, taskCallback: @escaping (Bool,
        AnyObject?) -> ()) {

            let session = URLSession(configuration: URLSessionConfiguration.default)
            print("THIS LINE IS PRINTED")
            let task = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
                if let data = data {
                    print("THIS ONE IS PRINTED, TOO")
                    let json = try? JSONSerialization.jsonObject(with: data, options: [])
                    if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                        
                       // if let data = data {
                            if let decodedResponse = try? JSONDecoder().decode(NYTResponse?.self, from: data) {
                                // we have good data – go back to the main thread
                                DispatchQueue.main.async {
                                    // update our UI
                                    self.viewModelTableData = decodedResponse
                                }
                             

                            }
                       // }
                        
                        taskCallback(true, json as AnyObject?)
                    } else {
                        taskCallback(false, json as AnyObject?)
                    }
                }
            })
            task.resume()
        }

}
