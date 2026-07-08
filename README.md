# objc-libphonenumber-spm

A fork of [iziz/libPhoneNumber-iOS](https://github.com/iziz/libPhoneNumber-iOS) updated to work flawlessly as the Swift Package library. Includes `PhoneNumberUtil`, `ShortNumberUtil`, `AsYouTypeFormatter` but does not include a Geocoder. The package is not extensively tested yet, and test targets are not ported from the original repo.

Whenever needed, pass the metadataHelper explicitly during initialization, otherwise the instance won't initialize propoerly.

```swift
final class PhoneUtils {

  private let phoneUtil: NBPhoneNumberUtil
  private let asYouType: NBAsYouTypeFormatter
  private let shortNumberUtil: NBShortNumberUtil
  
  init() {
    let metadataHelper = NBMetadataHelper()!
    let shortNumberMetaDataHelper = NBShortNumberMetadataHelper()
    let phoneUtil = NBPhoneNumberUtil(metadataHelper: metadataHelper)!
    
    self.phoneUtil = phoneUtil
    self.asYouType = .init(regionCode: Locale.current.regionCode)
    self.shortNumberUtil = .init(metadataHelper: shortNumberMetaDataHelper, phoneNumberUtil: phoneUtil)
    }
    
    // wrap the methods you need for your usecases
    //
    //
}
```

For `NBPhoneNumberUtil` a shared instance is available that does seem to work properly despite marked as depricated:

```swift
private static let phoneLib: NBPhoneNumberUtil! = NBPhoneNumberUtil.sharedInstance()
```

<!-- relux-ecosystem:start -->

## About Relux Works

This project is part of the open-source ecosystem of
[Relux Works](https://relux.works), an AI-native software development studio.
We build fixed-price MVPs, rescue vibe-coded apps, run local AI inference, and
train teams to work with coding agents — and we open-source much of the
infrastructure behind it.

- Full catalog: [relux.works/en/open-source](https://relux.works/en/open-source/)
- Agentic enablement: [agent harnesses & team training](https://relux.works/en/agentic-enablement/)
- Hire us the agent-native way — point your assistant at `https://api.relux.works/mcp`
- Contact: ivan@relux.works

<!-- relux-ecosystem:end -->
