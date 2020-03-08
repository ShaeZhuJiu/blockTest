//
//  BViewController.m
//  BlockTest
//
//  Created by 谢鑫 on 2020/3/8.
//  Copyright © 2020 Shae. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}
- (IBAction)btnBAct:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    self.block(self.BVCTxtF.text);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
