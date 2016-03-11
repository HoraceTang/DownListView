//
//  DownListView.m
//  点击下拉菜单
//
//  Created by 唐宏 on 16/1/11.
//  Copyright © 2016年 唐宏. All rights reserved.
//

#import "DownListView.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define ALERTWIDTH 150
#define ALERTHEIGHT 50
#define BUTTONALERTVIEWWIDTH 280
#define BUTTONALERTVIEWHEIGHT (180)
#define CRACKWIDTH 50
#define COLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define HEIGHT [UIScreen mainScreen].bounds.size.height


#import "ViewController.h"

@interface DownListView ()
<UITableViewDataSource,
UITableViewDelegate>

@end

@implementation DownListView
- (void)awakeFromNib
{
    //
}

#pragma mark--自定义下拉菜单
- (instancetype)initWithNameArray:(NSArray *)nameArray andMenuOrigin:(CGPoint)orign andMenuWidth:(CGFloat)width andHeight:(CGFloat)rowHeight andLayer:(CGFloat)layer andTableViewBackGroundColor:(UIColor *)color andIsSharp:(BOOL)sharp{
    self = [super initWithFrame:CGRectMake(orign.x, orign.y, width, rowHeight*nameArray.count) ];
    if (self) {
        _isSharp = sharp;
        _layerSize = layer;
        _width = width;
        _orign = orign;
        _rowHeight = rowHeight;
        _nameArray = nameArray;
        _color = color;
        self.backgroundColor = [UIColor clearColor];
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, rowHeight*nameArray.count) style:UITableViewStylePlain];
        [self.tableView setBackgroundColor:color];
        [self.tableView setDelegate:self];
        [self.tableView setDataSource:self];
        self.tableView.rowHeight = rowHeight;
        [self.tableView.layer setMasksToBounds:YES];
        [self.tableView.layer setCornerRadius:layer];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"downMenuCell"];
        self.tableView.separatorColor = [UIColor whiteColor];
        //self.tableView.separatorColor = [UIColor redColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //设置下拉菜单边框颜色，如果不需要可以注掉 。
        [self.tableView.layer setMasksToBounds:YES];
        [self.tableView.layer setBorderWidth:1];
        [self.tableView.layer setBorderColor:color.CGColor];
        
        for (NSInteger i = 0; i < nameArray.count; i++) {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, (i+1)*rowHeight, self.tableView.frame.size.width-20, 1)];
            [view setBackgroundColor:[UIColor whiteColor]];
            [self.tableView addSubview:view];
        }
        [self addSubview:_tableView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

#pragma mark--消失事件
- (void)dismissWithCompletion:(void (^)(DownListView *))completion{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.6 animations:^{
//        weakSelf.tableView.frame = CGRectMake(0, 0, _width, 0); // 从下往上收起
//        weakSelf.tableView.frame = CGRectMake(0, 0, 0, _nameArray.count * _rowHeight); // 从右往左收起
        weakSelf.tableView.frame = CGRectMake(0, 0, 0, 0);
    } completion:^(BOOL finished) {
        if (weakSelf.dismiss) {
            weakSelf.dismiss();
        }
    }];
}
- (void)animation{
    if (self.dismiss) {
        self.dismiss();
    }
}


#pragma mark - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = COLOR(109, 109, 109);
    cell.textLabel.text = _nameArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"__点击了cell");
    if ([self.delegate respondsToSelector:@selector(clickListOption:)]) {
        [self.delegate clickListOption:indexPath.row];
    }
}


#pragma mark - 图形需要裁剪
- (void)drawRect:(CGRect)rect{
    if (_isSharp) {
        
        // 裁剪图形
        
//        CGContextRef context=UIGraphicsGetCurrentContext();
//        CGContextBeginPath(context);
//        CGContextMoveToPoint(context, _orign.x+20+_width/2, _orign.y-10);
//        CGContextAddLineToPoint(context, _orign.x+20+_width/2-8, _orign.y);
//        CGContextAddLineToPoint(context, _orign.x+_width/2+8+20, _orign.y);
//        CGContextClosePath(context);
//        [self.tableView.backgroundColor setFill];
//        [_color setStroke];
//        CGContextDrawPath(context, kCGPathFillStroke);
    }
}














/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
