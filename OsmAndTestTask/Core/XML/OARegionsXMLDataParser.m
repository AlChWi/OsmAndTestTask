//
//  OARegionsXMLDataParser.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "OARegionsXMLDataParser.h"

#define kSelfNameString @"$name"

typedef NS_ENUM(NSUInteger, OARegionsXMLRegionLevel) {
    OARegionsXMLRegionLevelContinent,
    OARegionsXMLRegionLevelCountry,
    OARegionsXMLRegionLevelArea,
};

@interface OARegionsXMLDataParser ()

@property(strong, nonatomic) NSXMLParser *xmlParser;
@property(strong, nonatomic) OARegionsList *regionsList;
@property(nonatomic) OARegionsXMLRegionLevel regionLevel;

@end

@implementation OARegionsXMLDataParser

#pragma mark - Singleton object

+ (instancetype)shared {
    static dispatch_once_t pred = 0;
    static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

# pragma mark - Starting execution

- (void)parseXMLWithName:(NSString *)name {
    NSURL *url = [[NSBundle mainBundle] URLForResource:name withExtension:@"xml"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO]; 
    self.xmlParser = parser;
    [parser setDelegate:self];
    [self.xmlParser parse];
}

#pragma mark - Getting the result

- (OARegionsList *)getParsingResult {
    return self.regionsList;
}

#pragma mark - NSXMLParserDelegate methods.

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"parserDidStartDocument");
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"regions_list"]) {
        self.regionsList = [[OARegionsList alloc] init];
    } else if ([elementName isEqualToString:@"region"]) {
        // Parse region based on nesting level
        if ([[attributeDict objectForKey:@"type"] isEqualToString:@"continent" ]) {
            [self parseContinentWithAttributes:attributeDict];
        } else if (self.regionLevel == OARegionsXMLRegionLevelContinent && [elementName isEqualToString:@"region"]) {
            [self parseCountryWithAttributes:attributeDict];
        } else if (self.regionLevel == OARegionsXMLRegionLevelCountry && [elementName isEqualToString:@"region"]) {
            [self parseCountryAreaWithAttributes:attributeDict];
        }
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if (self.regionLevel == OARegionsXMLRegionLevelContinent) {
        NSLog(@"Stopped parsing continent");
    } else if ([elementName isEqualToString:@"region"]) {
        self.regionLevel -= 1;
    }
}

#pragma mark - Parsing different region types based on nesting level

- (void)parseContinentWithAttributes:(NSDictionary *)attributeDict {
    NSString *name = [attributeDict objectForKey:@"name"];
    OARegionsListContinent *continent = [[OARegionsListContinent alloc] init];
    
    NSString *correctedName = [name.capitalizedString stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    correctedName = [correctedName stringByReplacingOccurrencesOfString:@"-" withString:@" "];
    continent.name = correctedName;
    if (self.regionsList.continents == nil) {
        self.regionsList.continents = [[NSMutableArray alloc] init];
    }
    NSString *suffix = [attributeDict objectForKey:@"inner_download_suffix"];
    if (suffix == nil) {
        suffix = [attributeDict objectForKey:@"download_suffix"];
    }
    continent.downloadSuffix = suffix;
    NSString *prefix = [attributeDict objectForKey:@"inner_download_prefix"];
    if (prefix == nil) {
        prefix = [attributeDict objectForKey:@"download_prefix"];
    }
    continent.downloadPrefix = [attributeDict objectForKey:@"inner_download_prefix"];
    if ([continent.downloadSuffix isEqualToString:kSelfNameString]) {
        continent.downloadSuffix = continent.name;
    }
    if ([continent.downloadPrefix isEqualToString:kSelfNameString]) {
        continent.downloadPrefix = continent.name;
    }
    [self.regionsList.continents addObject:continent];
    self.regionLevel = OARegionsXMLRegionLevelContinent;
}

- (void)parseCountryWithAttributes:(NSDictionary *)attributeDict {
    NSString *name = [attributeDict objectForKey:@"name"];
    OARegionsListCountry *country = [[OARegionsListCountry alloc] init];
    NSString *correctedName = [name.capitalizedString stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    correctedName = [correctedName stringByReplacingOccurrencesOfString:@"-" withString:@" "];
    country.name = correctedName;
    NSString *suffix = [attributeDict objectForKey:@"inner_download_suffix"];
    if (suffix == nil) {
        suffix = [attributeDict objectForKey:@"download_suffix"];
    }
    country.downloadSuffix = suffix;
    NSString *prefix = [attributeDict objectForKey:@"inner_download_prefix"];
    if (prefix == nil) {
        prefix = [attributeDict objectForKey:@"download_prefix"];
    }
    country.downloadPrefix = [attributeDict objectForKey:@"inner_download_prefix"];
    if ([country.downloadSuffix isEqualToString:kSelfNameString]) {
        country.downloadSuffix = country.name;
    }
    if ([country.downloadPrefix isEqualToString:kSelfNameString]) {
        country.downloadPrefix = country.name;
    }
    OARegionsListContinent *lastContinent = self.regionsList.continents.lastObject;
    if (lastContinent.countries == nil) {
        lastContinent.countries = [[NSMutableArray alloc] init];
    }
    [self.regionsList.continents.lastObject.countries addObject:country];
    self.regionLevel += 1;
}

- (void)parseCountryAreaWithAttributes:(NSDictionary *)attributeDict {
    NSString *name = [attributeDict objectForKey:@"name"];
    OARegionsListCountryArea *area = [[OARegionsListCountryArea alloc] init];
    NSString *correctedName = [name.capitalizedString stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    correctedName = [correctedName stringByReplacingOccurrencesOfString:@"-" withString:@" "];
    area.name = correctedName;
    area.downloadSuffix = [attributeDict objectForKey:@"download_suffix"];
    area.downloadPrefix = [attributeDict objectForKey:@"download_prefix"];
    OARegionsListCountry *lastCountry = self.regionsList.continents.lastObject.countries.lastObject;
    if (lastCountry.areas == nil) {
        lastCountry.areas = [[NSMutableArray alloc] init];
    }
    [self.regionsList.continents.lastObject.countries.lastObject.areas addObject:area];
    self.regionLevel += 1;
}

@end
