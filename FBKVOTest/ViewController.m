//
//  ViewController.m
//  FBKVOTest
//
//  Created by 石峰铭 on 15/11/26.
//  Copyright © 2015年 shifengming. All rights reserved.
//

#import "ViewController.h"
#import <KVOController/FBKVOController.h>
#import "Person.h"

@interface ViewController ()
{
    Person *personOne;
    FBKVOController *fbKVO;
    NSMutableArray *listArray;
    UILabel *lbl;
    UILabel *age;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"test";
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 200, 44)];
    lbl.backgroundColor = [UIColor lightGrayColor];
    lbl.text= @"test";
    [self.view addSubview:lbl];
    
    age = [[UILabel alloc]initWithFrame:CGRectMake(20, 450, 200, 44)];
    age.backgroundColor = [UIColor lightGrayColor];
    age.text= @"age";
    [self.view addSubview:age];
    
    UILabel *oldAge = [[UILabel alloc]initWithFrame:CGRectMake(20, 300, 200, 44)];
    oldAge.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:oldAge];
    
//    listArray = [[NSMutableArray alloc]init];
//    [listArray addObject:@"FBKVOController"];
    
    personOne = [[Person alloc]init];
    personOne.pName = @"defaultName";
    personOne.pAge = @"24";
    
    fbKVO = [FBKVOController controllerWithObserver:self];
    [fbKVO observe:personOne keyPath:@"pName" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        lbl.text = change[NSKeyValueChangeNewKey];
    }];
    
    [fbKVO observe:personOne keyPath:@"pAge" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        age.text = change[NSKeyValueChangeNewKey];
        oldAge.text = change[NSKeyValueChangeNewKey];

    }];
    
    [fbKVO observe:personOne keyPath:@"pColour" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        lbl.backgroundColor = change[NSKeyValueChangeNewKey];
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    int red = arc4random()%255;
    int green = arc4random()%255;
    int blue = arc4random()%255;
//    self.view.backgroundColor = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
    
    lbl.backgroundColor = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
    age.backgroundColor = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
    
    int nums = arc4random()%10;
    personOne.pName = [NSString stringWithFormat:@"name%d",nums];

    int numsTwo = arc4random()%100;
    personOne.pAge = [NSString stringWithFormat:@"age%d",numsTwo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
