//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Ugowe on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents{
    NSInteger totalPriceInCents = 0;
    for (FISItem *item in self.items){
        totalPriceInCents += item.priceInCents;
    }
    
    return totalPriceInCents;
}
- (void)addItem:(FISItem *)item{
    [self.items addObject:item];

}

- (void)removeItem:(FISItem *)item{
    NSUInteger index = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:index];
}

- (void)removeAllItemsLikeItem:(FISItem *)item{
    [self.items removeObject:item];
    
}

- (void)sortItemsByNameAsc{
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    NSArray *sortedItems = [self.items sortedArrayUsingDescriptors:@[sortByNameAsc]];
    self.items = [NSMutableArray arrayWithArray:sortedItems];
    
}

- (void)sortItemsByNameDesc{
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO selector:@selector(caseInsensitiveCompare:)];
    NSArray *sortedItems = [self.items sortedArrayUsingDescriptors:@[sortByNameDesc]];
    self.items = [NSMutableArray arrayWithArray:sortedItems];
    
}

- (void)sortItemsByPriceInCentsAsc{
    NSSortDescriptor *sortByPriceAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    NSArray *sortedItems = [self.items sortedArrayUsingDescriptors:@[sortByPriceAsc]];
    self.items = [NSMutableArray arrayWithArray:sortedItems];
    
}

- (void)sortItemsByPriceInCentsDesc{
    NSSortDescriptor *sortByPriceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    NSArray *sortedItems = [self.items sortedArrayUsingDescriptors:@[sortByPriceDesc]];
    self.items = [NSMutableArray arrayWithArray:sortedItems];
}

- (NSArray *)allItemsWithName:(NSString *)name {
        NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
        NSArray *filteredArray = [self.items filteredArrayUsingPredicate:namePredicate];
        return filteredArray;
}

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)priceInCents {
    NSPredicate *allItemsWithMinimumPrice = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", priceInCents];
    NSArray *filteredArray = [self.items filteredArrayUsingPredicate:allItemsWithMinimumPrice];
    return filteredArray;
}
- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)priceInCents {
    NSPredicate *allItemsWithMaximumPrice = [NSPredicate predicateWithFormat:@"priceInCents <= %lu", priceInCents];
    NSArray *filteredArray = [self.items filteredArrayUsingPredicate:allItemsWithMaximumPrice];
    return filteredArray;

}

@end
