//
//	RegisteredUser.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class RegisteredUser:NSObject{
    
    var address : AnyObject!
    var address2 : AnyObject!
    var affiliateId : AnyObject!
    var avatarUrl : AnyObject!
    var city : AnyObject!
    var countryId : NSNumber!
    var currency : NSNumber!
    var dateOfBirth : AnyObject!
    var userDescription : AnyObject!
    var displayName : AnyObject!
    var email : String!
    var firstName : AnyObject!
    var fullname : String!
    var gender : String!
    var registerationId : NSNumber!
    var lang : AnyObject!
    var lastActivity : AnyObject!
    var lastLogin : AnyObject!
    var lastName : AnyObject!
    var lockoutAttempts : AnyObject!
    var lockoutDate : AnyObject!
    var mobileNumber : AnyObject!
    var oldId : AnyObject!
    var password : String!
    var postalCode : AnyObject!
    var state : AnyObject!
    var status : String!
    var timezoneId : AnyObject!
    var token : AnyObject!
    var username : String!
    
    open func getAddress ()->AnyObject{return address}
    open func getAddress2 ()->AnyObject{return address2}
    open func getAffiliateId ()->AnyObject{return affiliateId}
    open func getAvatarUrl ()->AnyObject{return avatarUrl}
    open func getCity ()->AnyObject{return city}
    open func getCountryId ()->NSNumber{return countryId}
    open func getCurrency ()->NSNumber{return currency}
    open func getDateOfBirth ()->AnyObject{return dateOfBirth}
    open func getDescription ()->AnyObject{return description as AnyObject}
    open func getDisplayName ()->AnyObject{return displayName}
    open func getEmail ()->String{return email}
    open func getFirstName ()->AnyObject{return firstName}
    open func getFullname ()->String{return fullname}
    open func getGender ()->String{return gender}
    open func getId ()->NSNumber{return registerationId}
    open func getLang ()->AnyObject{return lang}
    open func getLastActivity ()->AnyObject{return lastActivity}
    open func getLastLogin ()->AnyObject{return lastLogin}
    open func getLastName ()->AnyObject{return lastName}
    open func getLockoutAttempts ()->AnyObject{return lockoutAttempts}
    open func getLockoutDate ()->AnyObject{return lockoutDate}
    open func getMobileNumber ()->AnyObject{return mobileNumber}
    open func getOldId ()->AnyObject{return oldId}
    open func getPassword ()->String{return password}
    open func getPostalCode ()->AnyObject{return postalCode}
    open func getState ()->AnyObject{return state}
    open func getStatus ()->String{return status}
    open func getTimezoneId ()->AnyObject{return timezoneId}
    open func getToken ()->AnyObject{return token}
    open func getUsername ()->String{return username}

    override public init(){super.init()}
    /**
    * Instantiate the instance using the passed dictionary values to set the properties values
    */
    init(fromDictionary dictionary: NSDictionary){
        address = dictionary["address"] as AnyObject!
        address2 = dictionary["address2"] as AnyObject!
        affiliateId = dictionary["affiliate_id"] as AnyObject!
        avatarUrl = dictionary["avatar_url"] as AnyObject!
        city = dictionary["city"] as AnyObject!
        countryId = dictionary["country_id"] as? NSNumber
        currency = dictionary["currency"] as? NSNumber
        dateOfBirth = dictionary["date_of_birth"] as AnyObject!
        userDescription = dictionary["description"] as AnyObject!
        displayName = dictionary["display_name"] as AnyObject!
        email = dictionary["email"] as? String
        firstName = dictionary["first_name"] as AnyObject!
        fullname = dictionary["fullname"] as? String
        gender = dictionary["gender"] as? String
        registerationId = dictionary["id"] as? NSNumber
        lang = dictionary["lang"] as AnyObject!
        lastActivity = dictionary["last_activity"] as AnyObject!
        lastLogin = dictionary["last_login"] as AnyObject!
        lastName = dictionary["last_name"] as AnyObject!
        lockoutAttempts = dictionary["lockout_attempts"] as AnyObject!
        lockoutDate = dictionary["lockout_date"] as AnyObject!
        mobileNumber = dictionary["mobile_number"] as AnyObject!
        oldId = dictionary["old_id"] as AnyObject!
        password = dictionary["password"] as? String
        postalCode = dictionary["postal_code"] as AnyObject!
        state = dictionary["state"] as AnyObject!
        status = dictionary["status"] as? String
        timezoneId = dictionary["timezone_id"] as AnyObject!
        token = dictionary["token"] as AnyObject!
        username = dictionary["username"] as? String
    }
    
}
