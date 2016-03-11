//
//  DownListView.h
//  点击下拉菜单
//
//  Created by 唐宏 on 16/1/11.
//  Copyright © 2016年 唐宏. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^Dismiss)(void);

@protocol DownListViewDelegate <NSObject>
// 点击事件回调
- (void)clickListOption:(NSInteger)tag;
@end

@interface DownListView : UIView
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , assign) BOOL isSharp;//下拉菜单是否有上面的三角形符号
@property (nonatomic , assign) CGFloat layerSize;
@property (nonatomic , assign) CGPoint orign;
@property (nonatomic , assign) CGFloat width;
@property (nonatomic , assign) CGFloat rowHeight;
@property (nonatomic , strong) NSArray *nameArray;
@property (nonatomic , strong) UIColor *color;
@property (nonatomic , strong) Dismiss dismiss;


@property (nonatomic , assign) id<DownListViewDelegate>delegate;


- (instancetype)initWithNameArray:(NSArray *)nameArray andMenuOrigin:(CGPoint)orign andMenuWidth:(CGFloat)width andHeight:(CGFloat)rowHeight andLayer:(CGFloat)layer  andTableViewBackGroundColor:(UIColor *)color andIsSharp:(BOOL)sharp;

//下拉菜单消失事件
-(void)dismissWithCompletion:(void (^)(DownListView *create))completion;



@property (nonatomic , strong) NSArray *titleArray;

@end
