//
//  ObjectConverter.swift
//  Runner
//
//  Created by Krishna Keshan on 08/03/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import Foundation
import Parse

class ObjectConverter {
    //method to convert any parse object to a compatible representation
    func parseObjectToMap(parseObject: PFObject) -> [String : Any] {
        var result: [String : Any] = [:]
        
        //first put objectId and createdAt
        result["objectId"] = parseObject.objectId!
        result["createdAt"] = parseObject.createdAt!.description
        
        //convert all keys to compatible representations
        for key in parseObject.allKeys {
            //skip ACL it's not supported across channels
            if key == "ACL" {
                continue
            }
            
            result[key] = parseObject.value(forKey: key)
        }
        
        //return result
        return result
    }
}
