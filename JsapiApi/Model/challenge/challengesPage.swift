//
//	Result.swift
//
//	Create by Youssef on 22/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class ChallengesPage:NSObject{

	open var content : [Challenge]!
	open var first : Bool!
	open var last : Bool!
	open var number : NSNumber!
	open var numberOfElements : NSNumber!
	open var size : NSNumber!
	open var sort : AnyObject!
	open var totalElements : NSNumber!
	open var totalPages : NSNumber!

    public override init(){
    
        content = [Challenge]()
    }
    

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		content = [Challenge]()
		if let contentArray = dictionary["content"] as? [NSDictionary]{
			for dic in contentArray{
				let value = Challenge(fromDictionary: dic)
				content.append(value)
			}
		}
		first = dictionary["first"] as? Bool
		last = dictionary["last"] as? Bool
		number = dictionary["number"] as? NSNumber
		numberOfElements = dictionary["number_of_elements"] as? NSNumber
		size = dictionary["size"] as? NSNumber
		totalElements = dictionary["total_elements"] as? NSNumber
		totalPages = dictionary["total_pages"] as? NSNumber
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if content != nil{
			var dictionaryElements = [NSDictionary]()
			for contentElement in content {
				dictionaryElements.append(contentElement.toDictionary())
			}
			dictionary["content"] = dictionaryElements
		}
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
			dictionary["number_of_elements"] = numberOfElements
		}
		if size != nil{
			dictionary["size"] = size
		}
		if sort != nil{
			dictionary["sort"] = sort
		}
		if totalElements != nil{
			dictionary["total_elements"] = totalElements
		}
		if totalPages != nil{
			dictionary["total_pages"] = totalPages
		}
		return dictionary
	}

}
