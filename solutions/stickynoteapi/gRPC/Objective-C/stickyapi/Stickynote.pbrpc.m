#import "Stickynote.pbrpc.h"

#import <ProtoRPC/ProtoRPC.h>
#import <RxLibrary/GRXWriter+Immediate.h>

@implementation StickyNote

// Designated initializer
- (instancetype)initWithHost:(NSString *)host {
  return (self = [super initWithHost:host packageName:@"messagepb" serviceName:@"StickyNote"]);
}

// Override superclass initializer to disallow different package and service names.
- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName {
  return [self initWithHost:host];
}

+ (instancetype)serviceWithHost:(NSString *)host {
  return [[self alloc] initWithHost:host];
}


#pragma mark Get(StickyNoteRequest) returns (StickyNoteResponse)

- (void)getWithRequest:(StickyNoteRequest *)request handler:(void(^)(StickyNoteResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToGetWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
- (GRPCProtoCall *)RPCToGetWithRequest:(StickyNoteRequest *)request handler:(void(^)(StickyNoteResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"Get"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[StickyNoteResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
#pragma mark Update(stream StickyNoteRequest) returns (stream StickyNoteResponse)

- (void)updateWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, StickyNoteResponse *_Nullable response, NSError *_Nullable error))eventHandler{
  [[self RPCToUpdateWithRequestsWriter:requestWriter eventHandler:eventHandler] start];
}
// Returns a not-yet-started RPC object.
- (GRPCProtoCall *)RPCToUpdateWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, StickyNoteResponse *_Nullable response, NSError *_Nullable error))eventHandler{
  return [self RPCToMethod:@"Update"
            requestsWriter:requestWriter
             responseClass:[StickyNoteResponse class]
        responsesWriteable:[GRXWriteable writeableWithEventHandler:eventHandler]];
}
@end
