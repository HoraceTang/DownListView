//
//  ViewController.m
//  点击下拉菜单
//
//  Created by 唐宏 on 16/1/11.
//  Copyright © 2016年 唐宏. All rights reserved.
//

#import "ViewController.h"
#import "DownListView.h"
#define COLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@interface ViewController ()
<DownListViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *dragBtn;
- (IBAction)dragBtnAction:(id)sender;
@property (nonatomic , strong) DownListView *menu;
@property (nonatomic , strong) NSArray *titleNameArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)dragBtnAction:(id)sender {
    __weak typeof(self)weakSelf=self;
    if (!_menu) {
        _titleNameArray = [NSArray arrayWithObjects:@"土木工",@"水电工",@"木工",@"修手机滴",@"修马桶滴",@"治病滴", nil];
        _menu = [[DownListView alloc]initWithNameArray:_titleNameArray andMenuOrigin:CGPointMake(50 , 100) andMenuWidth:[UIScreen mainScreen].bounds.size.width - 100 andHeight:45 andLayer:4 andTableViewBackGroundColor:COLOR(207, 207, 207) andIsSharp:YES];
        _menu.delegate = self;
        _menu.dismiss = ^(){
            [weakSelf.menu removeFromSuperview];
            _menu = nil;
        };
        [self.view addSubview:_menu];
    } else {
        [_menu dismissWithCompletion:^(DownListView *create) {
            [weakSelf.menu removeFromSuperview];
            weakSelf.menu = nil;
        }];
    }
}



#pragma mark - delegate
- (void)clickListOption:(NSInteger)tag
{
    NSLog(@"_____点击了第%ld个选项___: 点击的title是%@" , tag + 1 , _titleNameArray[tag]);
}





@end
