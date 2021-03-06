//
//  Registration.swift
//  JsapiApi
//
//  Created by youssef on 3/19/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class Registration:NSObject
{

    /*Generates/verifies a temporary secret to allow users to login without their password
    * /users/{id}/password-reset
    @param params{"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
    @param callback Interface
    */
    open func forgotPassword(_ params:Dictionary<String,String>,userID:String,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let endpoint = NSString(format: JSAPIConstant.FORGOTPASSWORD as NSString,userID)

        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl() + (endpoint as String)

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
               let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)

                }else
                {
                    callback(baseResponse,"",issuccess)

                }
        }

    
    }
    
    
    /*
     * /users/{id}/password-reset
     @param params{"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
     @param callback Interface
     */
    open func updatePassword(_ params:Dictionary<String,String>,userID:String,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let endpoint = NSString(format: JSAPIConstant.FORGOTPASSWORD as NSString,userID)
        
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl() + (endpoint as String)
        
        JsapiRest.sharedInstance.putRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
        {
            (result:NSDictionary,issuccess:Bool) in
            let baseResponse=BaseResponse(fromDictionary: result)
            if(!issuccess)
            {
                callback(baseResponse,baseResponse.errormessage,issuccess)
                
            }else
            {
                callback(baseResponse,"",issuccess)
                
            }
        }
        
        
    }
    
    /*SetPassword
     * /users/{id}/password-reset
     @param params{"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
     @param callback Interface
     */
    open func setPassword(_ params:Dictionary<String,String>,userID:String,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let endpoint = NSString(format: JSAPIConstant.SETUSERPASSWORD as NSString,userID)
        
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl() + (endpoint as String)
        
        JsapiRest.sharedInstance.putRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
        {
            (result:NSDictionary,issuccess:Bool) in
            let baseResponse=BaseResponse(fromDictionary: result)
            if(!issuccess)
            {
                callback(baseResponse,baseResponse.errormessage,issuccess)
                
            }else
            {
                callback(baseResponse,"",issuccess)
                
            }
        }
        
        
    }
    
    /*Creates a guest user and returns a random password.
    * /services/latest/registration/guests
    @param Empty Params
    @param callback Interface
    */
    open func guests(_ params:Dictionary<String,String>,callback:@escaping (GuestUser,String,Bool)->Void)
    {
        let endpoint=JSAPIConstant.GUESTS
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let guestResponse=GuestUserResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(GuestUser(),guestResponse.errormessage,issuccess)

                }else
                {
                    callback(guestResponse.guestUser,"",issuccess)
                }
        }
        
        
    }
    /*Upgrade a guest user to a regular account
    * /services/latest/registration/guestUpgrade
    @param params{"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
    @param callback Interface
    */
    open func guestUpgrade(_ params:Dictionary<String,String>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let endpoint=JSAPIConstant.GUESTUPGRADE
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)
                }else
                {
                    callback(baseResponse,"",issuccess)
                }
        }
        
        
    }
    /**Creates a user using the information provided
    * /services/latest/registration
    {"username": "","email": "","newpassword": "","secrethash": "","plaintext": false}
    */
    open func doUserRegistration(_ registerationDetails:Dictionary<String,AnyObject>,callback:@escaping (RegisteredUser,String,Bool)->Void)
    {
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.REGISTER

        JsapiRest.sharedInstance.postrequest(methodurl,postParams:  Utilities.jsonRequestFromDictionary(registerationDetails),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let registeredResponse=RegisteredUserResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(RegisteredUser(),registeredResponse.errormessage,issuccess)
                }else
                {
                    callback(registeredResponse.registeredUser,"",issuccess)
                }
        }
    }
    

    
}
