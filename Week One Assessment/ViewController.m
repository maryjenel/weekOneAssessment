//
//  ViewController.m
//  Week One Assessment
//
//  Created by Mary Jenel Myers on 1/9/15.
//  Copyright (c) 2015 Mary Jenel Myers. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h" //add the destination header
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *valueOneTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTwoTextField;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UILabel *finalAnswerLabel;
@property NSInteger finalResult; //declares final result
@property (weak, nonatomic) IBOutlet UIButton *webButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   self.valueOneTextField.placeholder =@"Enter Value 1️⃣";
    self.valueTwoTextField.placeholder =@"Enter Value 2️⃣"; //removes the text and replaces it with this text
}



- (IBAction)onCalculateButtonPressed:(id)sender
{
    NSString *valueOneText = self.valueOneTextField.text; //declares the value of NSString as valueOneTextfields text named valueOneText
    NSInteger valueOneNumber = valueOneText.intValue; //changes the string into an integer
    NSString *valueTwoText = self.valueTwoTextField.text; //declares the value of NSString as valueTwoTextfields text named valueTwoText
    NSInteger valueTwoNumber = valueTwoText.intValue; //changes the string into an integer
    self.finalResult = valueTwoNumber * valueOneNumber; //main calculation

     NSString *finalResultText = [NSString stringWithFormat:@"%lu", self.finalResult]; // converts int into a string}

    self.finalAnswerLabel.text = finalResultText; // show number result on answer label

    if (!(self.finalResult % 5 == 0))
    {
        [self.webButton setEnabled:NO];
    }
}
//-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//    if (!(self.finalResult % 5 == 0))
//    {
//        [self.webButton setEnabled:NO];
//    }
//    return YES;
//
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *vc = segue.destinationViewController;
    vc.finalResultAnswer = self.finalAnswerLabel;
}

@end
