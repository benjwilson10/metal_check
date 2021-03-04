#import "MetalCheckPlugin.h"
#if __has_include(<metal_check/metal_check-Swift.h>)
#import <metal_check/metal_check-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "metal_check-Swift.h"
#endif

@implementation MetalCheckPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMetalCheckPlugin registerWithRegistrar:registrar];
}
@end
