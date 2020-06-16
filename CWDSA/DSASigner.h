//
//  DSASigner.h
//  CWDSA
//
//  Created by Mathieu Janneau on 16/06/2020.
//  Copyright © 2020 Cityway. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DSASigner : NSString
- (NSString *)DSASignatureStringWithPublicKey:(NSString *)publicKey privateKey:(NSString *)privateKey;
@end

NS_ASSUME_NONNULL_END
