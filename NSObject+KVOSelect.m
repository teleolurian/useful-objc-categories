#import "NSObject+KVOSelect.h"

@implementation NSObject (KVOSelect)
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    id oldObject = [change objectForKey:NSKeyValueChangeOldKey];
    id newObject = [change objectForKey:NSKeyValueChangeNewKey];
    if (oldObject == newObject) return;
    NSString *i;
    NSMutableString *selectorString = [NSMutableString string];
    for (i in [keyPath componentsSeparatedByString:@"."]){
        [selectorString appendString:[keyPath capitalizedString]];
    }
    if ([[NSNull null] isEqual:oldObject]) oldObject = nil;
    if ([[NSNull null] isEqual:newObject]) newObject = nil;

    [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"observeChangeFrom%@:to%@:", selectorString, selectorString]) withObject:oldObject withObject:newObject];
}

@end
