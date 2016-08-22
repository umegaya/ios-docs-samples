#import "Stickynote.pbobjc.h"

#import <ProtoRPC/ProtoService.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>



NS_ASSUME_NONNULL_BEGIN

@protocol StickyNote <NSObject>

#pragma mark Get(StickyNoteRequest) returns (StickyNoteResponse)

- (void)getWithRequest:(StickyNoteRequest *)request handler:(void(^)(StickyNoteResponse *_Nullable response, NSError *_Nullable error))handler;

- (GRPCProtoCall *)RPCToGetWithRequest:(StickyNoteRequest *)request handler:(void(^)(StickyNoteResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark Update(stream StickyNoteRequest) returns (stream StickyNoteResponse)

- (void)updateWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, StickyNoteResponse *_Nullable response, NSError *_Nullable error))eventHandler;

- (GRPCProtoCall *)RPCToUpdateWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, StickyNoteResponse *_Nullable response, NSError *_Nullable error))eventHandler;


@end

/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface StickyNote : GRPCProtoService<StickyNote>
- (instancetype)initWithHost:(NSString *)host NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host;
@end

NS_ASSUME_NONNULL_END
