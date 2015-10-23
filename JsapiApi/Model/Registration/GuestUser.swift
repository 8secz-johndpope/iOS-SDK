//
//	GuestUser.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class GuestUser:NSObject{

	var password : String!
	var username : String!
    override public init(){super.init()}
    public func getPassword ()->String{return password}
    public func getUsername ()->String{return username}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		password = dictionary["password"] as? String
		username = dictionary["username"] as? String
	}

}