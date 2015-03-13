//
//  Cart.swift
//  JsapiApi
//
//  Created by youssef on 3/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class Cart :NSObject
{
    /**"Creates a new cart from scratch
    *@params cartsparams it's emptyDictionry
    */
    public func createCart(cartsparams:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.SCARTS
        println(methodurl)
        JsapiPost.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cartsparams),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }

    /**Generates and save a new SKU based on the given prefix
    *@params skuparams {"quantity": 5,"prefix": "WHAT"}
    */
    public func createCartSku(skuparams:Dictionary<String,String>,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.CARTSSKU
        println(methodurl)
        JsapiPost.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(skuparams),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }
    
    
    /**Returns the cart with the given GUID
    *guidID String
    *@params cart {"cartguid": "cart GUID"}
    */
    public func getCart(cart:Dictionary<String,String>,guidID:String,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.SCARTS+"/"+guidID
        println(methodurl)
        JsapiRest.getRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cart))
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }


    /**Closes a cart and generates an invoice
    *itemID String example /services/latest/carts/itemID/checkout
    *@params cart {"cartguid": "cart GUID"}
    */
    public func cartCheckout(cart:Dictionary<String,String>,itemID:String,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=NSString(format: JSAPIConstant.CARTCHECKOUT,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cart),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }

    
    /**Adds a coupon to the cart identified by GUID
    *itemID String example /services/latest/carts/itemID/discount
    *@params cart {"cartguid": "cart GUID"}
    */
    public func cartDiscount(cart:Dictionary<String,String>,itemID:String,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=NSString(format: JSAPIConstant.CARTDISCOUNT,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cart),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }
    
    
    /**Get the list of available shipping countries per vendor
    *itemID String example /services/latest/carts/itemID/countries
    *@params cart {"cartguid": "cart GUID"}
    */
    public func cartCountries(cart:Dictionary<String,String>,itemID:String,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=NSString(format: JSAPIConstant.CARTCOUNTRIES,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.getRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cart))
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }
    
    
    /**Changes the quantity of an item already in the cart
    *itemID String example latest/carts/itemID/items
    *@params cart {{
    "catalog_id": 0,
    "catalog_sku_id": 0,
    "quantity": 0,
    "status": "",
    "affiliate_key": ""
    }}
    */
    public func changeItem(params:Dictionary<String,String>,itemID:String,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=NSString(format: JSAPIConstant.CARTITEMS,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.putRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }

    
    
    
    /**Add virtual currency item to cart
    *itemID String example /services/latest/carts/itemID/items
    *@params cart {{
    "catalog_id": 0,
    "catalog_sku_id": 0,
    "quantity": 0,
    "status": "",
    "affiliate_key": ""
    }}
    */
    public func addCartItems(params:Dictionary<String,String>,itemID:String,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=NSString(format: JSAPIConstant.CARTITEMS,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }
    
    
    
    /**Modifies or sets the order shipping address
    *itemID String example services/latest/carts/itemID/shipping-address
    *@params {
    "name_prefix": "",
    "first_name": "",
    "last_name": "",
    "shipping_address_line1": "",
    "shipping_address_line2": "",
    "city": "",
    "postal_state_id": 0,
    "zip": "",
    "email": "",
    "country_id": 0,
    "phone_number": "",
    "order_notes": ""
    }    */
    public func modifyShippingAddress(params:Dictionary<String,String>,itemID:String,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=NSString(format: JSAPIConstant.SHIPPINGADDRESS,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.putRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }
    
    /**Returns whether a cart requires shipping
    *itemID String example services/latest/carts/5145/shippable
    *@params {
       }    */
    public func checkShippable(params:Dictionary<String,String>,itemID:String,callback:(NSDictionary,Bool)->Void)
    {
        var commonParamtersDictionry=Dictionary<String,String>()
        var endpoint=NSString(format: JSAPIConstant.SHIPPABLE,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+endpoint
        println(methodurl)
        JsapiRest.getRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println(result["error"])
                    println(result["error_description"])
                }else
                {
                    println(result)
                }
                callback(result,issuccess)
        }
    }
    
    
}