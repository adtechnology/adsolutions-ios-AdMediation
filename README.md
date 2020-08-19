# adsolutions-ios-AdMediation

Sample Project to showcase Media Impacts optimized multi adserver mediation. This basically uses different features/methods, which could also be implemented modular: Amazon Prebidding, and Google Facebook Mediation Appnexus -Google Mediation

## Appnexus -Integration
Documentation on basic appnexus integration could be found here. https://wiki.xandr.com/display/sdk/iOS+v6.0+SDK+Migration+and+Integration
Information on additional keywords, sizes, parameters and inventoryCodes (Placements) will be provided by Media Impact.

## Appnexus-Google Mediation
1. the AppNexusSDK GoogleAdapter has to be loaded. https://wiki.xandr.com/display/sdk/Mediate+with+iOS+SDK+v6.0
2. this also loads the google ads sdk, to use this as  „third party“ insert into info.plist the Flag GADIsAdManagerApp = true (otherwise google will ask for an google admob Id)
3. additional keyword "content_url", which contains a desktop url corresponding the app view
-there is no additional code needed, the appnexus adapter controls everything else

## Amazon Prebidding



To monetize demand from Amazon, we use prebidding. So basically making an adcall to Amazon to get a bid price and then pass the bid to appnexcus. Media Impact only uses 300x250 demand right now. The SDK is provided by amazon, it is now available via Cocoapods (AmazonPublisherServicesSDK). 
To implement it you'll get a "App Key" and an "Amazon uuid" from Media Impact.
1. implement DTB sdk downloaded fro this repository
2. during app initialization init amazon sdk with app key: DTBAds.sharedInstance().setAppKey("6d292e101d3741e6adfab413ae50d57d"))
3. So this is how an actual implementation could look like, also have a look in the repository:
azsize = DTBAdSize.init(bannerAdSizeWithWidth: 300, height: 250, andSlotUUID: andSlotUUID)
azloader = DTBAdLoader()
azloader.setAdSizes([azsize])
azloader.loadAd(DTBCallback{
func onFailure(_ error: DTBAdError) {
AppnexusBanner.loadAd()
}  
func onSuccess(_ adResponse: DTBAdResponse!) {
response.customTargetting()?.forEach({ (key, value) in
if let key = key as? String, let value = value as? String {
self.addCustomKeyword(withKey: key, value: value)
}})
AppNexusBanner.loadAd()
}
)
## Criteo Prebidding

You can find Criteo Wiki here: https://publisherdocs.criteotilt.com/app/ios/app-bidding/other-ad-servers/
Please use at least SDK >3.6.1 (pod 'CriteoPublisherSdk','~> 3.6.1')
Parameters like Criteo PublisherID, Sizes and Placementnames (adunitId) will be provided by Adtechnology or Media Impact. Basically we will provide 3-4 adunits which should be used depending on postition of the ad on a page. 

Criteo SDK must be initialized initally with all the adunits that will be used in the app. When needed, the sdk will instantly provide bids for a Placement (no waiting for response; bid contains crt_cpm, crt_displayUrl, crt_size) The bid must then be passed as custom Keywords to Appnexus.

## Google-Facebook Mediation
This Feature has to be retested, instructions on implementing will follow


# Glossary
### Prebdding - using custom code to use an external advertising sdk to get their "bid" in real time, to than pass this "bid" as keywords to our Adserver Appnexus. This is usually an asynchronous task which has to be implemented manually when an ad should be callt.
### Mediation - Advertising SDKs initialising and controlling other Advertising SDKs, triggered via serverside setting. Functionality completely provided from Adserver sdks. Usually only needs the mediated sdk and a "Bridge Sdk" and sometimes a global variable has to be set.






