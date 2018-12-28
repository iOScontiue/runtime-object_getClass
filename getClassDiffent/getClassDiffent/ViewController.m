//
//  ViewController.m
//  getClassDiffent
//
//  Created by 卢育彪 on 2018/12/27.
//  Copyright © 2018年 luyubiao. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) Person *per1;
@property (nonatomic, strong) Person *per2;

@end

//自定义
struct lyb_objc_class {
    Class _Nonnull isa;
};

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //实例对象
    self.per1 = [[Person alloc] init];
    self.per2 = [[Person alloc] init];
    
    //类对象
    Class perClass1 = [self.per1 class];
    Class perGetClass2 = object_getClass(self.per1);
    struct lyb_objc_class *perGetClass3 = (__bridge struct lyb_objc_class *)object_getClass(self.per1);
    Class person = [Person class];
    
    //还是perGetClass2
    Class perMeta1 = [perGetClass2 class];
    //元类对象
    Class perMeta2 = object_getClass(perGetClass2);
    struct lyb_objc_class *perMeta3 = (__bridge struct lyb_objc_class *)object_getClass(perGetClass2);
    
    //还是perMeta2
    Class rootMeta1 = [perMeta2 class];
    //基类(NSObject)的元类对象
    Class rootMeta2 = object_getClass(perMeta2);
    
    //打断点
    NSLog(@"---");
}

@end

@implementation Person

@end
