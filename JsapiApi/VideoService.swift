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
open class VideoService:NSObject
{
    
    /** Get Artist and Global Videos
    *@param params Dictionary
    *@param callback
    */
    open func getVideos(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<Video>,PageRequest,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETVIDEOS
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    let baseResponse=VideoResponse(fromDictionary: result)

                    callback(baseResponse.videos,baseResponse.page,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    let baseResponse=VideoResponse(fromDictionary: result["result"] as! NSDictionary)

                    callback(baseResponse.videos,baseResponse.page,"",issuccess)
                    
                }
                
        }
    }
    
    open func getVideosWithoutAuth(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<Video>,PageRequest,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETVIDEOS
        JsapiRest.sharedInstance.getRequestWithoutAuthorization(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    let baseResponse=VideoResponse(fromDictionary: result)
                    
                    callback(baseResponse.videos,baseResponse.page,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    let baseResponse=VideoResponse(fromDictionary: result["result"] as! NSDictionary)
                    
                    callback(baseResponse.videos,baseResponse.page,"",issuccess)
                    
                }
                
        }
    }


    /** Get Artist and Global Videos for a user
    *@param params Dictionary
    *@param callback
    */
    open func getUserVideos(_ userId:String,params:Dictionary<String,AnyObject>,callback:@escaping (Array<Video>,PageRequest,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERVIDEOS
        
        let methodUrl:String=NSString(format: url as NSString,userId) as String
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
              
                if(!issuccess)
                {
                      let baseResponse=VideoResponse(fromDictionary: result)
                    callback(baseResponse.videos,baseResponse.page,baseResponse.errormessage,issuccess)
                    
                }else
                {
                      let baseResponse=VideoResponse(fromDictionary: result["result"] as! NSDictionary)
                    callback(baseResponse.videos,baseResponse.page,"",issuccess)
                    
                }
                
        }
    }
    
    open func getUserVideosInJson(_ userId:String,params:Dictionary<String,AnyObject>,callback:@escaping (NSDictionary,PageRequest,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETUSERVIDEOS
        
        let methodUrl:String=NSString(format: url as NSString,userId) as String
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
        {
            (result:NSDictionary,issuccess:Bool) in
            
            if(!issuccess)
            {
                let baseResponse=VideoResponse(fromDictionary: result)
                callback(result,baseResponse.page,baseResponse.errormessage,issuccess)
                
            }else
            {
                let baseResponse=VideoResponse(fromDictionary: result["result"] as! NSDictionary)
                callback(result,baseResponse.page,"",issuccess)
                
            }
            
        }
    }
    
    
    /** Get Favorites Global Videos for a user
    *@param params Dictionary
    *@param callback
    */
    open func getMyFavoritesVideos(_ userId:String,params:Dictionary<String,AnyObject>,callback:@escaping (Array<Video>,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETMYFAVORITESVIDEOS
        
        let methodUrl:String=NSString(format: url as NSString ,userId) as String
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
              
                if(!issuccess)
                {
                     let baseResponse=VideoResponse(fromDictionary: result)
                    
                    callback(baseResponse.videos,baseResponse.errormessage,issuccess)
                    
                }else
                {
                     let baseResponse=VideoResponse(fromDictionary: result)
                    
                    callback(baseResponse.videos,"",issuccess)
                    
                }
                
        }
    }

    /** Get Friends Global Videos for a user
    *@param params Dictionary
    *@param callback
    */
    open func getFriendsVideos(_ userId:String,params:Dictionary<String,AnyObject>,callback:@escaping (Array<Video>,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFRIENDSVIDEO
        
        let methodUrl:String=NSString(format: url as NSString,userId) as String
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    let baseResponse=VideoResponse(fromDictionary: result)

                    callback(baseResponse.videos,baseResponse.errormessage,issuccess)
                }else
                {
                    let baseResponse=VideoResponse(fromDictionary: result["result"] as! NSDictionary)

                    callback(baseResponse.videos,"",issuccess)
                }
                
        }
    }
    
    
    /** Add User Video
    *@param params Dictionary
    *@param callback
    */
    open func addVideo(_ params:Dictionary<String,AnyObject>,callback:@escaping (Video,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDVIDEO
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=AddVideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Video(),baseResponse.errormessage,issuccess)
                }else
                {
                    callback(baseResponse.video,"",issuccess)
                }
                
        }
    }
    
    /** Add User Video
     *@param params Dictionary
     *@param callback
     */
    open func getVideoDetails(_ videoId:String ,params:Dictionary<String,AnyObject>,callback:@escaping (Video,String,Bool)->Void)
    {
        
        let url =  JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETEVIDEO
        
        let methodUrl=NSString(format: url as NSString ,videoId)
        
        JsapiRest.sharedInstance.getRequest(methodUrl as String, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=AddVideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Video(),baseResponse.errormessage,issuccess)
                }else
                {
                    callback(baseResponse.video,"",issuccess)
                }
                
        }
    }
    
    open func getKNEVideoDetails(_ videoId:String ,params:Dictionary<String,AnyObject>,callback:@escaping (Video,String,Bool)->Void)
    {
        let methodUrl=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.POPULARVIDEOS
        
        JsapiRest.sharedInstance.getRequest(methodUrl as String, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=AddVideoResponse(fromDictionary: result)
                
                if(!issuccess)
                {
                    
                    callback(Video(),baseResponse.errormessage,issuccess)
                    
                }else
                {
                    var videos = [Video]()
                    
                    if let resultData = result["data"] as? [NSDictionary]{
                        
                        for dic in resultData {
                            
                            let value = Video(fromDictionary : dic)
                            videos.append(value)
                            
                        }
                    }
                    if(videos.count > 0)
                    {
                        callback(videos[0],"",issuccess)
                    }
                    else{
                        callback(Video(),"",issuccess)

                    }
                    
                }
                
        }
    }


    
    
    /** Add User Video
     *@param params Dictionary
     *@param callback
     */
    open func addContributor(_ videoId:String , params:Dictionary<String,AnyObject> , callback:@escaping (String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDCONTRIBUTOR
        
           let methodUrl:String=NSString(format: url as NSString,videoId) as String

        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse.errormessage,issuccess)
                }else
                {
                    callback("",issuccess)
                }
                
        }
    }

    
    /** update VideoViews Count
    *@param params Dictionary
    *@param callback
    */
    open func updateVideoViewsCount(_ videoId:String,params:Dictionary<String,AnyObject>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.VIEWVIDEO
        
        let methodUrl:String=NSString(format:url as NSString,videoId) as String
        
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
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
    

    /** Add User Video
    *@param params Dictionary
    *@param callback
    */
    open func updateVideoDetails(_ videoId:String,params:Dictionary<String,AnyObject>,callback:@escaping (String,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.UPDATEVIDEODETAILS
        
        let methodUrl:String = NSString(format: url as NSString,videoId) as String
        
        JsapiRest.sharedInstance.putRequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=AddVideoResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback("",baseResponse.errormessage,issuccess)
                }else
                {
                    callback("","",issuccess)
                }
                
        }
    }
 
    
    /**Deletes a Video from an item. Must have authorization as the user that originally posted the comment.
    *@param params Dictionary{"id": 0}
    *@param callback
    */
    open func deleteVideo(_ params:Dictionary<String,String>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETEVIDEO
        
        let methodUrl=NSString(format: url as NSString ,params["id"]!)
        
        JsapiRest.sharedInstance.deleteRequest(methodUrl as String, deleteParams: "")
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

    
    /** add User Uploaded MediaItem Assests
    *@param params Dictionary
    *@param callback
    */
    open func addUserUploadedMediaItemAssests(_ params:Dictionary<String,AnyObject>,callback:@escaping (String,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDUSERUPLOADEDMEDIAITEMASSESTS
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams : Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback("",baseResponse.errormessage,issuccess)
                }else
                {
                    callback("","",issuccess)
                }
                
        }
    }
    
    /** Add Video Realtionship
     *@param params Dictionary
     *@param callback
     */
    open func addVideoRealtionShip(_ videoId:String,params:Dictionary<String,AnyObject>,callback:@escaping (String,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDRELATEDVIDEO
        
        let methodUrl:String=NSString(format: url as NSString ,videoId) as String
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback("",baseResponse.errormessage,issuccess)
                }else
                {
                    callback("","",issuccess)
                }
                
        }
    }

    
    /** Get Video Realtionship
     *@param params Dictionary
     *@param callback
     */
    open func getRelationship(_ videoId:String,params:Dictionary<String,AnyObject>,callback:@escaping (Array<RelationshipObject>,String,Bool)->Void)
    {
        
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDRELATEDVIDEO
        
        let methodUrl:String=NSString(format: url as NSString ,videoId) as String
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    let baseResponse=RelationshipdBaseResponse(fromDictionary: result)
                    
                    callback(baseResponse.content,baseResponse.errormessage,issuccess)
                }else
                {
                    let baseResponse=RelationshipdBaseResponse(fromDictionary: result["result"] as! NSDictionary)
                    
                    callback(baseResponse.content,"",issuccess)
                }
                
        }
    }


    open func getPopularVideos(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<Video>,PageRequest,String,Bool)->Void)
    {
        
        let methodUrl:String=JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.POPULARVIDEOS

        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    let baseResponse=VideoResponse(fromDictionary: result)
                    
                    callback(baseResponse.videos,baseResponse.page,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    let baseResponse=VideoResponse(fromDictionary: result )
                    
                    callback(baseResponse.videos,baseResponse.page,"",issuccess)
                    
                }
                
        }
    }
    
    
    /** Add Video Avatar
     *@param params Dictionary
     *@param callback
     */
    open func getAvatarDetails(_ videoId:String ,params:Dictionary<String,AnyObject>,callback:@escaping (BaseAvatarResponse,String,Bool)->Void)
    {
        
        let url =  JsapiAPi.sharedInstance.getNotificationUrl()+JSAPIConstant.VIDEOAVATAR
        
        let methodUrl=NSString(format: url as NSString ,videoId)
        
        JsapiRest.sharedInstance.getRequest(methodUrl as String, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseAvatarResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,"Not able to load avatar for exisiting video",issuccess)
                }else
                {
                    callback(baseResponse,"",issuccess)
                }
                
        }
    }


}
