//
//  WebViewController.m
//  Week One Assessment
//
//  Created by Mary Jenel Myers on 1/9/15.
//  Copyright (c) 2015 Mary Jenel Myers. All rights reserved.
//

#import "WebViewController.h"
#import "ViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UINavigationItem *finalPreviousAnswer;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *networkActivityIndicator;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *addressString = @"http://mobilemakers.co"; //declares the string of the text bar
    NSURL *addressURL = [NSURL URLWithString:addressString]; //changes the string into a URL
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressURL]; // changes the URL into a request
    [self.webView loadRequest:addressRequest];
    self.webView.delegate = self; //declare the delegate
      self.urlTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.finalPreviousAnswer.title = self.finalResultAnswer;
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.networkActivityIndicator startAnimating];
    self.networkActivityIndicator.hidden = false;

}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.networkActivityIndicator stopAnimating];
    self.networkActivityIndicator.hidden = true;
    ;
    self.urlTextField.text = webView.request.URL.absoluteString;
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
