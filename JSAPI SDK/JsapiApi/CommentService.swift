//
//  Comment.swift
//  JsapiApi
//
//  Created by youssef on 3/24/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class CommentService
{
    public init (){}
    /**Adds a new comment to an item. Requires user authentication.
    *@param params Dictionary{"comment": "","item_id": 0}
    *@param callback
    */
    public func addComment(itemID:String,params:Dictionary<String,String>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDCOMMENT,itemID)

        JsapiRest.postrequest(methodUrl as String, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)

                }else
                {
                    println(result)
                    callback(baseResponse,"",issuccess)

                }
                
        }
    }

    /**Returns a list of all comments currently attached to a given item. Maximum of 2000 returned
    *@param params Dictionary{"item_id": 0}
    *@param callback
    */
    public func commentsList(itemID:String,params:Dictionary<String,String>,callback:(Array<Comment>,String,Bool)->Void)
    {
        let methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.COMMENTLIST,itemID)

        JsapiRest.getRequest(methodUrl as String, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var commentResponse=CommentResponse(fromDictionary: result["result"] as! NSDictionary);
                if(!issuccess)
                {
                    callback(commentResponse.comments,commentResponse.errormessage,issuccess)

                }else
                {
                    callback(commentResponse.comments,"",issuccess)
                }
        }
    }

    
    /**Deletes a comment from an item. Must have authorization as the user that originally posted the comment.
    *@param params Dictionary{"id": 0}
    *@param callback
    */
    public func deleteComment(itemID:String,commentId:String,params:Dictionary<String,String>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETECOMMENT,itemID,commentId)

        JsapiRest.deleteRequest(methodUrl as String, deleteParams:Utilities.jsonRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)

                }else
                {
                    callback(baseResponse,"",issuccess)
                }
        }
    }

}
