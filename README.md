# CombinationAvatar
combination avatar or Discussion group head

* Usage

```
NSMutableArray *avatars = [[NSMutableArray alloc] initWithCapacity:0];
[avatars addObject:[UIImage imageNamed:@"000"]];

HJCombinationAvatar combinationAvatar = [HJCombinationAvatar combinationAvatarWithFrame:rect images:avatars];
[self.view addSubview:combinationAvatar];

```
    
* ScreenShot

   ![ScreenShot](Documents/Images/ScreenShot.jpg)