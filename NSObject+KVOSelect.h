//  NSObject+KVOSelect.h

#import <Foundation/Foundation.h>

@interface NSObject (KVOSelect)
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;

@end
