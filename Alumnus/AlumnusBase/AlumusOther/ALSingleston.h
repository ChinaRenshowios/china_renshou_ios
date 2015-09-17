//.h文件

#define ZGSingletonH(name) + (instancetype)shared##name;

//.m文件

#if __has_feature(objc_arc)
// ARC
#define ZGSingletonM(name)\
static id _instance;\
\
\
+ (instancetype)shared##name\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [[self alloc]init];\
    });\
    return _instance;\
}\
\
- (id)copyWithZone:(NSZone *)zone\
{\
    return _instance;\
}

#else
// MRC
#define ZGSingletonM(name)\
\
static id _instance;\
\
+ (id)allocWithZone:(struct _NSZone *)zone\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
\
+ (instancetype)shared##name\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [[self alloc]init];\
    });\
    return _instance;\
}\
\
- (id)copyWithZone:(NSZone *)zone\
{\
    return _instance;\
}\
\
- (oneway void)release {}\
- (id)autorelease {return self;}\
- (id)retain {return self;}\
- (NSUInteger)retainCount {return 1;}

#endif
