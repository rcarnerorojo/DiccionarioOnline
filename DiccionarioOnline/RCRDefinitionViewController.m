//
//  RCRDefinitionViewController.m
//  DiccionarioOnline
//
//  Created by Ramón Carnero Rojo on 16/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRDefinitionViewController.h"

@interface RCRDefinitionViewController ()

@end

@implementation RCRDefinitionViewController


-(id) initWithModel:(NSString *)aModel{
    
    if (self = [super initWithNibName:nil bundle:nil]){
        
        _wordModel = aModel;
    }
    
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //Asignamos delegado
    self.browser.delegate = self;
    self.title = self.wordModel;
    
    //sincronizar la vista
    [self.browser loadRequest:[self definitionRequestForWord:self.wordModel]];
    
}


-(NSURLRequest *) definitionRequestForWord: (NSString *) aWord{
    NSURL *url = [NSURL URLWithString:
                  [NSString stringWithFormat:@"http://www.merriam-webster.com/dictionary/%@", aWord]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    return request;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    
    //decirle al activityView que pare. Se ocultará sólo por haber marcado la opción
    [self.activityView stopAnimating];
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //no podemos eliminarlo por completo porque es necesario cargar el link inicial
    if ((navigationType == UIWebViewNavigationTypeLinkClicked) || (navigationType == UIWebViewNavigationTypeFormSubmitted)){
        return NO;
    }
    
    return YES;
}

#pragma mark - UISplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden){
        
        //Hay que poner el botón en mi barra de navegación
        self.navigationItem.rightBarButtonItem = svc.displayModeButtonItem;
        
    }else if (displayMode == UISplitViewControllerDisplayModeAllVisible){
        
        //Hay que quitar el botón de la barra de navegación
        self.navigationItem.rightBarButtonItem = nil;
    }
}

#pragma mark - RCRWordsTableViewControllerDelegate

-(void) wordsTableViewController:(RCRWordsTableViewController *)wVC didWord:(NSString *)word{
    
    self.wordModel = word;
//    [self syncWithModel];
    //sincronizar la vista
    [self.browser loadRequest:[self definitionRequestForWord:self.wordModel]];
    
}


@end
