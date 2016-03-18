//
//	Result.swift
//
//	Create by Youssef on 18/3/2016
//	Copyright © 2016. All rights reserved.
import Foundation

public class ArticlePage :NSObject{

	var content : [Article]!
	var first : Bool!
	var last : Bool!
	var number : NSNumber!
	var numberOfElements : NSNumber!
	var size : NSNumber!
	var totalElements : NSNumber!
	var totalPages : NSNumber!


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
		numberOfElements = dictionary["numberOfElements"] as? NSNumber
		size = dictionary["size"] as? NSNumber
		totalElements = dictionary["totalElements"] as? NSNumber
		totalPages = dictionary["totalPages"] as? NSNumber
	}


}