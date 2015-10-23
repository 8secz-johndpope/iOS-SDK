//
//  JsapiApi.swift
//  JsapiApi
//
//  Created by youssef on 3/3/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class JsapiAPi:NSObject
{
    
    private var jsapiurl:String=""
    private var client_id:String=""
    private var username:String=""
    private var password:String=""
    private var secrect_key:String=""
    private var token=""
    private var token_type=""
    /**
    return a Singleton for JsapiApi class
    
    */
   public class var sharedInstance:JsapiAPi
    {
        struct Statics
        {
            static var instance:JsapiAPi?
            static var token:dispatch_once_t=0
            
        }
        dispatch_once(&Statics.token)
        {
            Statics.instance=JsapiAPi()
         
        }
        return Statics.instance!
    }
    
    /**
    Jsapi Init function should be called in App Delegate in function (didFinishLaunchingWithOptions).
    jsapiurl jsapi url it should be like http://www.knetik.com
    client_id first username in Client Table
    secrect_key optional paramter
    */
    
    public class func jsapiInit(jsapiurl:String,client_id:String,secrect_key:String)
    {
        if(jsapiurl.isEmpty){
            print("JSAPI Init failed please check jsapiurl");
            return;
        }
        if(client_id.isEmpty){
            print("JSAPI Init failed please check client_id");
              return;
        }
        print("JSAPI init Success");

        JsapiAPi.sharedInstance.jsapiurl=jsapiurl
        JsapiAPi.sharedInstance.client_id=client_id
        JsapiAPi.sharedInstance.secrect_key=secrect_key
        
    }
    /**
    reset function
    */
    public func reset()
    {
        JsapiAPi.sharedInstance.jsapiurl=""
        JsapiAPi.sharedInstance.client_id=""
        JsapiAPi.sharedInstance.username=""
        JsapiAPi.sharedInstance.password=""
        JsapiAPi.sharedInstance.secrect_key=""
        JsapiAPi.sharedInstance.token="";
    }
   
    
    /**
    do User Registration
    */
    public func doUserRegistration(registerationDetails:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        let methodurl:String=jsapiurl+JSAPIConstant.REGISTER
        print(methodurl)
        JsapiRest.postrequest(methodurl,postParams: jsonRequestFromDictionary(registerationDetails),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    print(result["error"])
                    print(result["error_description"])
                }else
                {
                    print(result)
                }
                callback(result,issuccess)
        }
    }

    
    /**
    do User Login
    */
    public func doUserLogin(loginDetails:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        let methodurl:String=jsapiurl+JSAPIConstant.OAUTH_TOKEN
        print(methodurl)
        JsapiRest.postrequest(methodurl,postParams: authenticateRequestFromDictionary(loginDetails),isJson:false)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    print(result["error"])
                    print(result["error_description"])
                }else
                {
                    self.token=result.valueForKey("access_token") as! String!
                    self.token_type=result.valueForKey("token_type") as! String!

                    print("token is : "+self.token)
                }
                callback(result,issuccess)
        }
    }
    
    /**
    do User Login
    */
    public func doFacebookLogin(loginDetails:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        let methodurl:String=jsapiurl+JSAPIConstant.OAUTH_TOKEN
        print(methodurl)
        JsapiRest.postrequest(methodurl,postParams: authenticateFacebookRequestFromDictionary(loginDetails),isJson:false)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    print(result["error"])
                    print(result["error_description"])
                }else
                {
                    self.token=result.valueForKey("access_token") as! String!
                    self.token_type=result.valueForKey("token_type") as! String!
                    
                    print("token is : "+self.token)
                }
                callback(result,issuccess)
        }
    }


    /**
    do User Logout
    */
    public func doUserLogout()
    {
    self.token_type="";
    self.token="";
    }

    /*
    generate auth request token from Dictionary
    */
    func authenticateRequestFromDictionary(requestparamters:Dictionary<String,String>)->String
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        commonParamtersDictionry["client_id"]=JsapiAPi.sharedInstance.client_id
        commonParamtersDictionry["grant_type"]="password"
        if(!JsapiAPi.sharedInstance.secrect_key.isEmpty){
        commonParamtersDictionry["client_secret"]=JsapiAPi.sharedInstance.secrect_key
        }
       for key in requestparamters.keys
       {
        commonParamtersDictionry[key]=requestparamters[key]
       }
        var postString:String=""
        for key in commonParamtersDictionry.keys
        {
           postString+=key+"="+commonParamtersDictionry[key]!
            postString+="&"
//           if(commonParamtersDictionry.keys.last != key)
//           {
//            postString+="&"
//           }
        }
        print(postString)
        return postString
    }
    
    /*
    generate facebook auth request token from Dictionary
    */
    func authenticateFacebookRequestFromDictionary(requestparamters:Dictionary<String,String>)->String
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        commonParamtersDictionry["client_id"]=JsapiAPi.sharedInstance.client_id
        commonParamtersDictionry["grant_type"]="facebook"
        if(!JsapiAPi.sharedInstance.secrect_key.isEmpty){
            
            commonParamtersDictionry["client_secret"]=JsapiAPi.sharedInstance.secrect_key
            
        }
        for key in requestparamters.keys
        {
            commonParamtersDictionry[key]=requestparamters[key]
        }
        var postString:String=""
        for key in commonParamtersDictionry.keys
        {
            postString+=key+"="+commonParamtersDictionry[key]!
            postString+="&"
      }
        print(postString)
        return postString
    }
    
    
    
    /*
    generate Json Request from Dictionary
    */
    func jsonRequestFromDictionary(requestparamters:Dictionary<String,String>)->String
    {
        let body = try! NSJSONSerialization.dataWithJSONObject(requestparamters, options: [] )
        let datastring: String = NSString(data:body, encoding:NSUTF8StringEncoding)! as String
        print(datastring)
        return datastring
    }


    public func getJsapiUrl()->String
    {
    return jsapiurl;
    }

    public func getJsapiToken()->String
    {
        return self.token_type+" "+self.token;
    }

}