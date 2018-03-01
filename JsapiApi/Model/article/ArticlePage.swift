//
//	Result.swift
//
//	Create by Youssef on 18/3/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class ArticlePage :NSObject{

	open var content : [Article]!
	open var first : Bool!
	open var last : Bool!
	open var number : NSNumber!
	open var numberOfElements : NSNumber!
	open var size : NSNumber!
	open var totalElements : NSNumber!
	open var totalPages : NSNumber!

    override public init()
    {
        super.init()
        content = [Article]()

    }

    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		content = [Article]()
		if let contentArray = dictionary["content"] as? [NSDictionary]{
			for dic in contentArray{
				let value = Article(fromDictionary: dic)
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


}
