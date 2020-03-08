//
//  BViewController.h
//  BlockTest
//
//  Created by 谢鑫 on 2020/3/8.
//  Copyright © 2020 Shae. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef定义一下block，为了更好用
typedef void(^BMyBlock)(NSString*string);
NS_ASSUME_NONNULL_BEGIN

@interface BViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *BVCTxtF;
@property (nonatomic,copy)BMyBlock block;
@end

NS_ASSUME_NONNULL_END
