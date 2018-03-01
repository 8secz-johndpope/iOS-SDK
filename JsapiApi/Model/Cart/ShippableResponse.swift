//
//	ShippableResponse.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class ShippableResponse:BaseResponse{

	var shippable : Shippable!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary)
    {
        super.init(fromDictionary: dictionary)
			if let shippableData = dictionary as? NSDictionary{
			shippable = Shippable(fromDictionary: shippableData)
	}
    }
}
