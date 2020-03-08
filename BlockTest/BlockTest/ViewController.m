//
//  ViewController.m
//  BlockTest
//
//  Created by 谢鑫 on 2020/3/8.
//  Copyright © 2020 Shae. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
typedef int (^MyBlock)(int,int);
typedef void (^myBlock)(void);
@interface ViewController ()
@property (nonatomic,copy)MyBlock myBlock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.无参数，无返回值，声明和定义
    void(^MyBlockOne)(void)=^(void){
        NSLog(@"无参数，无返回值");
    };
    MyBlockOne();//block的调用
    
    //2.有参数，无返回值，声明和定义
    void (^MyblockTwo)(int a)=^(int a){
        NSLog(@"a=%d我就是block,有参数，无返回值",a);
    };
    MyblockTwo(100);
    
    //3.有参数，有返回值
    int(^MyBlockThree)(int,int)=^(int a,int b){
        NSLog(@"%d我就是block,有参数，有返回值",a+b);
        return a+b;
    };
    NSLog(@"%@",MyBlockThree);
    NSLog(@"%d",MyBlockThree(12,1));
    
    //4.无参数，有返回值
    int (^MyBlockFour)(void)=^{
        NSLog(@"无参数，有返回值");
        return 45;
    };
    NSLog(@"%d",MyBlockFour());
    
    //实际使用
    self.myBlock = ^int(int a, int b) {
        NSLog(@"实际使用");
        return a+b;
    };
    NSLog(@"%d",self.myBlock(1,3));
    
    //block与外界变量,局部变量，默认情况
    int age=10;
    myBlock block=^{
        NSLog(@"age=%d",age);
    };
    age=18;
    block();
    
    //__block修饰的外部变量
    __block int ageOne=10;
    myBlock blockOne=^{
        NSLog(@"ageOne=%d",ageOne);
    };
    ageOne=18;
    blockOne();
    
    //---无参数传递的Block---调用
    [self testTimeConsume:^{
        //放入block中的代码
        NSLog(@"---无参数传递的Block---调用");
    }];
    
    //---有参数传递的Block---调用
    [self testTimeConsumeOne:^(NSString *name) {
        //放入block中的代码，可以使用参数name
        //参数name是实现代码中传入的，在调用时只能使用，不能传值
        NSLog(@"%@",name);
    }];
    
}
//---无参数传递的Block---
//实现
-(CGFloat)testTimeConsume:(void(^)(void))middleBlock{
    //执行前记录下当前的时间
    CFTimeInterval startime=CACurrentMediaTime();
    middleBlock();//这里调用block参数
    //执行后记录下当前的时间
    CFTimeInterval endTime=CACurrentMediaTime();
    return endTime-startime;
    
    
}

//---有参数传递的Block---
//实现
-(CGFloat)testTimeConsumeOne:(void(^)(NSString *name))middleBlock{
     //执行前记录下当前的时间
    CFTimeInterval startime=CACurrentMediaTime();
    NSString *name=@"有参数";
    middleBlock(name);
    //执行后记录下当前的时间
    CFTimeInterval endTime=CACurrentMediaTime();
    return endTime-startime;
}
- (IBAction)ABtnAct:(UIButton *)sender {
    BViewController*BVC=[[BViewController alloc]init];
    [self presentViewController:BVC animated:YES completion:^{
    }];
    __weak typeof(self) weakSelf=self;
    BVC.block = ^(NSString *string) {
        weakSelf.ALabel.text= string;
    };
}

@end
