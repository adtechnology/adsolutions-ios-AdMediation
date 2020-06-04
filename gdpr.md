# InApp Settings for IAB TCF 2.0 Compliance 

## Xandr
Xandr ist full TCF 2.0 compliant. Please be sure the newest Xandr SDK is installed. If the app has a lower version than 7.3 you must update the SDK. There is a global settig for the sdk, which has to be done (iOS: [ANGDPRSettings setConsentRequired:true]; Android: ANGDPRSettings.setConsentRequired(context,true);)

## Google Ad Manager (Mediation)
Currently is GAM not TCF 2.0 compliant. Until they release a TCF 2.0 SDK Compatible we should use the following workaround:

### The CMP has a Custom Vender "Google Ad Manager":

```
16:
name: "Google Ad Manager"
vendorType: "CUSTOM"
_id: "5e74df5ff443bb795772df9c"
```

### For this Vendor you should find the "grants":

```
5e74df5ff443bb795772df9c:
purposeGrants:
    5e8794bab31ef52cd96cde4a: true
    5e8794bab31ef52cd96cde4b: true
    5e8794bab31ef52cd96cde4c: true
    5e8794bab31ef52cd96cde44: true
    5e8794bab31ef52cd96cde45: true
    5e8794bab31ef52cd96cde46: true
    5e8794bab31ef52cd96cde47: true
    5e8794bab31ef52cd96cde48: true
    5e8794bab31ef52cd96cde49: true
    5e8794bab31ef52cd96cde53: true
    5ecab9b73d64c86bc9fe2b34: true
__proto__: Object
   vendorGrant: true
```

### If one of the above grants is false, you should pass a Custom Key / Value to Xandr:

```
npa:1
e.g.: BannerView.addCustomKeyword(withKey: "npa", value: "1")
```

* npa means "Non Personalized Ads"

## Amazon
Amazon isn't supporting officially TCF 2.0 but they read automatically the Consent String. That is why Amazon has to be switched off when the Amazon Vendor is switched off.

### The CMP has the "Amazon.com, Inc." custom Vendor:

```
21:
name: "Amazon.com, Inc."
vendorType: "CUSTOM"
_id: "5e7e1298b8e05c5a7d171cee"
```

Please check in the grants of Vendor "5e7e1298b8e05c5a7d171cee" if is "vendorGrant: true", if it is "false" please don't execute the Amazon Ad SDK.

## Facebook
Facebook isn't supporting  TCF 2.0

### The CMP has the "Facebook Inc." custom Vendor:

```
4:
name: "Facebook, Inc."
vendorType: "CUSTOM"
_id: "5e716fc09a0b5040d575080f"
```

Please check in the grants of Vendor "5e716fc09a0b5040d575080f" if is "vendorGrant: true" and pass it as keyword "gdprfbk" to appnexus e.g.: BannerView.addCustomKeyword(withKey: "gdprfbk", value: "1 or 0")
