//
//  CTDataViewController.m
//  fuckVC
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTDataViewController.h"

@interface CTDataViewController ()
@property (nonatomic,strong) UILabel *headerL;
@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *headerL2;

@end

@implementation CTDataViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [[UITableView appearance] setSectionIndexBackgroundColor:[UIColor clearColor]];
 
    _headerL = [[UILabel alloc] init];
	_headerL.backgroundColor = [UIColor purpleColor];
	_headerL.lineBreakMode = NSLineBreakByWordWrapping;
	_headerL.numberOfLines = 10;
	_headerL.font = [UIFont systemFontOfSize:15.0];
//	_headerL.preferredMaxLayoutWidth = 270.0; //Notice! important, label not init from xib, must be set this property!
	[_headerL setTranslatesAutoresizingMaskIntoConstraints:NO];
	[self.view addSubview:_headerL];
    
    
    _headerL2 = [[UILabel alloc] init];
	_headerL2.backgroundColor = [UIColor purpleColor];
	_headerL2.lineBreakMode = NSLineBreakByWordWrapping;
	_headerL2.numberOfLines = 10;
	_headerL2.font = [UIFont systemFontOfSize:15.0];
	_headerL2.preferredMaxLayoutWidth = 270.0; //Notice! important, label not init from xib, must be set this property!
	[_headerL2 setTranslatesAutoresizingMaskIntoConstraints:NO];
	[self.view addSubview:_headerL2];
	
	_imageV = [[UIImageView alloc] init];
	[_imageV setTranslatesAutoresizingMaskIntoConstraints:NO];
	[self.view addSubview:_imageV];


    
    NSDictionary *dic2 = @{@"hPadding":@15,@"vPadding":@15};
    
    NSDictionary *dict = NSDictionaryOfVariableBindings(_headerL,_headerL2,
                                                        _imageV);
    NSString *vf1 = @"|-hPadding-[_headerL(200)]-hPadding-|";
    NSString *vf2 = @"V:|-vPadding-[_headerL]-[_headerL2]-vPadding-[_imageV(200)]";

    NSString *vf3 = @"|-hPadding-[_imageV(==_headerL)]";
    NSString *vf4 = @"|-hPadding-[_headerL2(==_headerL)]";
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vf1 options:0 metrics:dic2 views:dict]];
    
     [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vf2 options:NSLayoutFormatAlignAllLeading metrics:dic2 views:dict]];
    
     [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vf3 options:0 metrics:dic2 views:dict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vf4 options:0 metrics:dic2 views:dict]];
    
    
    _headerL.text = @"fuajfjajlfjalfjlajfajljflaj";
    _headerL2.text = @"abacabacabacabacabacabacabacabacabacabacabacabac";
    _imageV.image = [UIImage imageNamed:@"1.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

@end
