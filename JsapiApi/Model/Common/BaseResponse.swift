//
//	UserResponse.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class BaseResponse:NSObject{

	private var cached : Bool!
	private var error : Error!
	var errormessage : String!
	private var requestId : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		cached = dictionary["cached"] as? Bool
		if let errorData = dictionary["error"] as? NSDictionary{
			error = Error(fromDictionary: errorData)
		}
		errormessage = dictionary["message"] as? String
		requestId = dictionary["requestId"] as? String
        if(errormessage == nil)
        {
            errormessage=""
        }
	}

}