//
//  Cart.swift
//  JsapiApi
//
//  Created by youssef on 3/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation

open class BREService:NSObject
{
    
   
    open func createBRE(_ params:Dictionary<String,AnyObject>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.BREEVENT
        
         JsapiRest.sharedInstance.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                
                let breevent=BaseResponse(fromDictionary: result)
                
                if(!issuccess)
                {
                    callback(breevent,breevent.errormessage,issuccess)
                }else
                {
                      callback(breevent,"",issuccess)
                }
        }
    }
    
}
