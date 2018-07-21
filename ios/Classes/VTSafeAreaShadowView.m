#import "VTSafeAreaShadowView.h"

#import <React/RCTAssert.h>
#import <React/RCTUIManager.h>
#import <React/RCTUIManagerObserverCoordinator.h>
#import <yoga/Yoga.h>

#import "VTSafeAreaHostShadowView.h"
#import "RCTShadowView+VTSafeArea.h"

static inline void VTSafeAreaSetYogaPaddings(YGNodeRef node, YGEdge edge, CGFloat nodeSize, CGFloat safeSize);

@interface VTSafeAreaShadowView () <RCTUIManagerObserver>
@end

@implementation VTSafeAreaShadowView {
    id<NSObject> _safeAreaObserver;
    __weak RCTBridge* _bridge;
}

- (instancetype)initWithBridge:(RCTBridge*)bridge {
    self = [self init];
    if (self) {
        _bridge = bridge;
        _safeAreaObserver = [[NSNotificationCenter defaultCenter] addObserverForName:VTSafeAreaHostDidUpdateNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            [self handleSafeAreaUpdateInHost:note.object];
        }];
        [_bridge.uiManager.observerCoordinator addObserver:self];
    }
    return self;
}

- (void)handleSafeAreaUpdateInHost:(VTSafeAreaHostShadowView*)potentialHostView {
    VTSafeAreaHostShadowView* hostView = [self findHostView];
    if (hostView == potentialHostView) {
        [self updatePaddingsWithHost:hostView];
    }
}

- (void)uiManagerWillPerformLayout:(RCTUIManager *)manager {
    VTSafeAreaHostShadowView* hostView = [self findHostView];
    if (hostView) {
        [self updatePaddingsWithHost:hostView];
    }
}

- (void)updatePaddingsWithHost:(VTSafeAreaHostShadowView*)hostView {
    CGRect rect = self.layoutMetrics.frame;
    CGRect safeRect = hostView.safeRect;
    YGNodeRef node = self.yogaNode;
    VTSafeAreaSetYogaPaddings(node, YGEdgeLeft, CGRectGetMinX(rect), CGRectGetMinX(safeRect));
    VTSafeAreaSetYogaPaddings(node, YGEdgeRight, CGRectGetMaxX(rect), CGRectGetMaxX(safeRect));
    VTSafeAreaSetYogaPaddings(node, YGEdgeTop, CGRectGetMinY(rect), CGRectGetMinY(safeRect));
    VTSafeAreaSetYogaPaddings(node, YGEdgeBottom, CGRectGetMaxY(rect), CGRectGetMaxY(safeRect));
}

- (VTSafeAreaHostShadowView*)findHostView {
    RCTShadowView *shadowView = self.superview;
    while (shadowView && ![shadowView isKindOfClass:VTSafeAreaHostShadowView.class]) {
        shadowView = shadowView.superview;
    }
    return (VTSafeAreaHostShadowView*)shadowView;
}

- (void)dealloc {
    if (_safeAreaObserver) {
        [[NSNotificationCenter defaultCenter] removeObserver:_safeAreaObserver];
    }
    if (_bridge) {
        [_bridge.uiManager.observerCoordinator removeObserver:self];
    }
}

@end

static inline void VTSafeAreaSetYogaPaddings(YGNodeRef node, YGEdge edge, CGFloat nodeSize, CGFloat safeSize) {
    CGFloat padding;
    if (edge == YGEdgeTop || edge == YGEdgeLeft) {
        padding = nodeSize < safeSize ? safeSize - nodeSize : 0;
    }
    else {
        padding = nodeSize > safeSize ? nodeSize - safeSize : 0;
    }

    YGNodeStyleSetPadding(node, edge, padding);
}
