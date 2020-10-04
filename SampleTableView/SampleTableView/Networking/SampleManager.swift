//
//  SampleManager.swift
//  SampleTableView
//
//  Created by Vijay Vikram Singh on 04/10/20.
//  Copyright © 2020 Vijay Vikram Singh. All rights reserved.
//

import Foundation
protocol SampleManagerDelegate{
    func DidUpdateUi(finalData:SampleModel)
    func didFailWithError(error:Error)
}

struct SampleManager {
    
  
    var delegate:SampleManagerDelegate?
    
    func getData(){
        
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: SampleUrlData.url) { (data, response, error) in
        if error != nil {
            self.delegate?.didFailWithError(error: error!)
        }
        
        if let safeData = data{
            //let final = String(data: safeData, encoding: .utf8)
            //print(final!)
            let data = self.parseJSON(data: safeData)!
            self.delegate?.DidUpdateUi(finalData: data)
            }
        }
        task.resume()
    }
    
//Mark:- JSON Parsing Function
    
 
    
    func parseJSON (data:Data) -> SampleModel?{
        
        let decoder = JSONDecoder()

        do{
            let decodedData = try decoder.decode([SampleData].self, from: data)
            var nameArray:[String]=[]
            var emailArray:[String]=[]
            var messageArray:[String]=[]
            for savedData in decodedData{
                let name:String = savedData.first_name + " " + savedData.last_name
                nameArray.append(name)
                let email:String = savedData.email
                emailArray.append(email)
                if let message = (savedData.message) {
                messageArray.append(message)
                }else{
                    messageArray.append("No Comments")
                }
            }
            
            let sampleModelData = SampleModel(name: nameArray, email: emailArray, message: messageArray)
            
                return sampleModelData
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
