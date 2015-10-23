//
//  Cart.swift
//  JsapiApi
//
//  Created by youssef on 3/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class CartService:NSObject
{

    /**"Creates a new cart from scratch
    *@params cartsparams it's emptyDictionry
    */
    public func createCart(cartsparams:Dictionary<String,String>,callback:(String,String,Bool)->Void)
    {
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.SCARTS
        print(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cartsparams),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let cartNumberResponse=CartResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback("",cartNumberResponse.errormessage,issuccess)

                }else
                {
                    callback(cartNumberResponse.cartnumber,"",issuccess)
                }
        }
    }

    /**Generates and save a new SKU based on the given prefix
    *@params skuparams {"quantity": 5,"prefix": "WHAT"}
    */
    public func createCartSku(skuparams:Dictionary<String,String>,callback:(Array<String>,String,Bool)->Void)
    {
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.CARTSSKU
        print(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(skuparams),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let skuResponse=CartSKUResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Array<String>(),skuResponse.errormessage,issuccess)
                }else
                {
                    callback(skuResponse.cartsku.skus,"",issuccess)
                }
        }
    }
    
    
    /**Returns the cart with the given GUID
    *guidID String
    *@params cart {"cartguid": "cart GUID"}
    */
    public func getCart(cart:Dictionary<String,String>,guidID:String,callback:(CartDetails,String,Bool)->Void)
    {
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.SCARTS+"/"+guidID
        print(methodurl)
        JsapiRest.getRequest(methodurl,postParams: Utilities.getGETRequestFromDictionary(cart))
            {
                (result:NSDictionary,issuccess:Bool) in
               let getCartResponse = GetCartResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(CartDetails(),getCartResponse.errormessage,issuccess)

                }else
                {
                    callback(getCartResponse.cartdetails,"",issuccess)
                }
        }
    }


    /**Closes a cart and generates an invoice
    *itemID String example /services/latest/carts/itemID/checkout
    *@params cart {"cartguid": "cart GUID"}
    */
    public func cartCheckout(cart:Dictionary<String,String>,itemID:String,callback:(Checkout,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.CARTCHECKOUT,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)
        print(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cart),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
               let checkoutResponse = CheckoutResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Checkout(),checkoutResponse.errormessage,issuccess)
                }else
                {
                    callback(checkoutResponse.checkout,"",issuccess)
                }
        }
    }

    
    /**Adds a coupon to the cart identified by GUID
    *itemID String example /services/latest/carts/itemID/discount
    *@params cart {"cartguid": "cart GUID"}
    */
    public func cartDiscount(cart:Dictionary<String,String>,itemID:String,callback:(NSDictionary,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.CARTDISCOUNT,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)
        print(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cart),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    print(result["error"])
                    print(result["error_description"])
                }else
                {
                    print(result)
                }
                callback(result,issuccess)
        }
    }
    
    
    /**Get the list of available shipping countries per vendor
    *itemID String example /services/latest/carts/itemID/countries
    *@params cart {"cartguid": "cart GUID"}
    */
    public func cartCountries(cart:Dictionary<String,String>,itemID:String,callback:(Array<Country>,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.CARTCOUNTRIES,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)
        print(methodurl)
        JsapiRest.getRequest(methodurl,postParams: Utilities.getGETRequestFromDictionary(cart))
            {
                (result:NSDictionary,issuccess:Bool) in
                let countriesResponse = CountriesResponse(fromDictionary: result)
                
                if(!issuccess)
                {
                    callback(Array<Country>(),countriesResponse.errormessage,issuccess)

                }else
                {
                    callback(countriesResponse.countries.country,"",issuccess)
                }
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
    public func changeItem(params:Dictionary<String,String>,itemID:String,callback:(AnyObject,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.CARTITEMS,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)
        print(methodurl)
        JsapiRest.putRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
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
    public func addCartItems(params:Dictionary<String,String>,itemID:String,callback:(AnyObject,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.CARTITEMS,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)
        print(methodurl)
        JsapiRest.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
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
    public func modifyShippingAddress(params:Dictionary<String,String>,itemID:String,callback:(AnyObject,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.SHIPPINGADDRESS,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)
        print(methodurl)
        JsapiRest.putRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let shippingResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(shippingResponse,shippingResponse.errormessage,issuccess)
                }else
                {
                    callback(shippingResponse,"",issuccess)
                }
        }
    }
    
    /**Returns whether a cart requires shipping
    *itemID String example services/latest/carts/5145/shippable
    *@params {
       }    */
    public func checkShippable(params:Dictionary<String,String>,itemID:String,callback:(Shippable,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.SHIPPABLE,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)
        print(methodurl)
        JsapiRest.getRequest(methodurl,postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                let shippable = ShippableResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Shippable(),shippable.errormessage,issuccess)
                }else
                {
                    callback(shippable.shippable,"",issuccess)
                }
        }
    }
    
    
}