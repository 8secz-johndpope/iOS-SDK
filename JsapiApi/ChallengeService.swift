//
//  VideoService.swift
//  JsapiApi
//
//  Created by youssef on 7/6/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//
/**

*/

import Foundation

public class ChallengeService : NSObject
{
    
    public func getChallenges(params:Dictionary<String,AnyObject>,callback:(ChallengesPage,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCHALLENGES
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                
                if(!issuccess)
                {
                    let baseResponse=BaseChallengeResponse(fromDictionary: result)

                    callback(baseResponse.result,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    
                    let baseResponse=BaseChallengeResponse(fromDictionary: result)

                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }

  
    public func getChallengeAssets(params:Dictionary<String,AnyObject>,callback:(Array<BatchAssetPage>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCHALLENGESBATCH
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                
                let baseResponse=BaseAssetBatchResponse(fromDictionary: result)
                
                if(!issuccess)
                {
                    
                    callback(baseResponse.result,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    
                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }
    
    
    public func getChallengeActivityDetails(challengeID:String,activityId:String,params:Dictionary<String,AnyObject>,callback:(ChallengeActivity,String,Bool)->Void)
    {
        
        let methodUrl:String=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCHALLENGEACTIVITYDETAILS,challengeID,activityId) as String
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                

                if(!issuccess)
                {
                    
                   let response =  BaseResponse.init(fromDictionary: result)
                    callback(ChallengeActivity(),response.errormessage,issuccess)
                    
                    
                }else
                {
                    let baseResponse=MainChallengeActiviyResponse(fromDictionary: result)

                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }
    
    public func getChallengeActivity(challengeID:String,params:Dictionary<String,AnyObject>,callback:(Activities,String,Bool)->Void)
    {
        
        let methodUrl:String=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETCHALLENGEACTIVITY,challengeID) as String
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                
                
                if(!issuccess)
                {
                    
                    let response =  BaseResponse.init(fromDictionary: result)
                    
                    callback(Activities(),response.errormessage,issuccess)
                    
                    
                }else
                {
                    let baseResponse=BaseChallengeActivity(fromDictionary: result)
                    
                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }


    
 
}