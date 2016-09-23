//
//	PageRequest.swift
//
//	Create by Youssef on 22/12/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class PageRequest :NSObject{

	open var first : NSNumber!
	open var last : NSNumber!
	open var number : NSNumber!
	open var numberOfElements : NSNumber!
	open var size : NSNumber!
	open var totalElements : NSNumber!
	open var totalPages : NSNumber!
    open var count : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		first = dictionary["first"] as? NSNumber
		last = dictionary["last"] as? NSNumber
		number = dictionary["number"] as? NSNumber
		numberOfElements = dictionary["numberOfElements"] as? NSNumber
		size = dictionary["size"] as? NSNumber
		totalElements = dictionary["totalElements"] as? NSNumber
		totalPages = dictionary["totalPages"] as? NSNumber
        count = dictionary["count"] as? NSNumber

	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if first != nil{
			dictionary["first"] = first
		}
		if last != nil{
			dictionary["last"] = last
		}
		if number != nil{
			dictionary["number"] = number
		}
		if numberOfElements != nil{
			dictionary["numberOfElements"] = numberOfElements
		}
		if size != nil{
			dictionary["size"] = size
		}
		if totalElements != nil{
			dictionary["totalElements"] = totalElements
		}
		if totalPages != nil{
			dictionary["totalPages"] = totalPages
		}
		return dictionary
	}

}
