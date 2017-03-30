//
//  PhoneNumberTableViewCell.h
//  Restaurants
//
//  Created by AppsFoundation on 1/26/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneNumberTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic,assign) IBOutlet UITextField *phoneField;

@end