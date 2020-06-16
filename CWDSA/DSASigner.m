//
//  DSASigner.m
//  CWDSA
//
//  Created by Mathieu Janneau on 16/06/2020.
//  Copyright © 2020 Cityway. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSASigner.h"
#import <openssl/dsa.h>
#import <openssl/pem.h>


@implementation DSASigner : NSString

- (NSString *)DSASignatureStringWithPublicKey:(NSString *)publicKey privateKey:(NSString *)privateKey {
    const char *message = [self UTF8String];
    
    BIO *publicBIO = BIO_new_mem_buf((void *)[publicKey UTF8String], -1);
    DSA *publicDSA = PEM_read_bio_DSA_PUBKEY(publicBIO, NULL, NULL, NULL);
    BIO_free_all(publicBIO);
    BIO *privateBIO = BIO_new_mem_buf((void *)[privateKey UTF8String], -1);
    if (privateBIO == NULL) {
        return nil;
    }

    DSA *dsa = PEM_read_bio_DSAPrivateKey(privateBIO, &publicDSA, NULL, NULL);
    BIO_free_all(privateBIO);
    if (dsa == NULL) {
        return nil;
    }

    // Sign
    unsigned int sign_length;
    unsigned char *signature = (unsigned char *)calloc(DSA_size(dsa), sizeof(unsigned char));
    int result = DSA_sign(0, (const unsigned char*)message, (int)strlen(message), signature, &sign_length, dsa);
    if (result != 1) {
        return nil;
    }

    DSA_free(dsa);
    
    return [[[NSData alloc] initWithBytes:signature length:sign_length] base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
@end
