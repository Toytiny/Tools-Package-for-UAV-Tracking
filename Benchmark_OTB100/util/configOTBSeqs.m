function seqs=configOTBSeqs(dataPath)

dataset = dataPath;

seqsOTB ={struct('name','Basketball','path',[ dataset, '/Basketball/img/' ],'startFrame',1,'endFrame',725,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Biker','path',[ dataset, '/Biker/img/' ],'startFrame',1,'endFrame',142,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Bird1','path',[ dataset, '/Bird1/img/' ],'startFrame',1,'endFrame',408,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Bird2','path',[ dataset, '/Bird2/img/' ]','startFrame',1,'endFrame',99,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','BlurBody','path',[ dataset, '/BlurBody/img/' ]','startFrame',1,'endFrame',334,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','BlurCar1','path',[ dataset, '/BlurCar1/img/' ]','startFrame',247,'endFrame',988,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','BlurCar2','path',[ dataset, '/BlurCar2/img/' ],'startFrame',1,'endFrame',585,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','BlurCar3','path',[ dataset, '/BlurCar3/img/' ],'startFrame',3,'endFrame',359,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','BlurCar4','path',[ dataset, '/BlurCar4/img/' ],'startFrame',18,'endFrame',397,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','BlurFace','path',[ dataset, '/BlurFace/img/' ],'startFrame',1,'endFrame',493,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','BlurOwl','path',[ dataset, '/BlurOwl/img/' ],'startFrame',1,'endFrame',631,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Board','path',[ dataset, '/Board/img/' ],'startFrame',1,'endFrame',698,'nz',5,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Bolt','path',[ dataset, '/Bolt/img/' ]','startFrame',1,'endFrame',350,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Bolt2','path',[ dataset, '/Bolt2/img/' ],'startFrame',1,'endFrame',293,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Box','path',[ dataset, '/Box/img/' ],'startFrame',1,'endFrame',1161,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Boy','path',[ dataset, '/Boy/img/' ],'startFrame',1,'endFrame',602,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Car1','path',[ dataset, '/Car1/img/' ],'startFrame',1,'endFrame',1020,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Car2','path',[ dataset, '/Car2/img/' ],'startFrame',1,'endFrame',913,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Car4','path',[ dataset, '/Car4/img/' ],'startFrame',1,'endFrame',659,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Car24','path',[ dataset, '/Car24/img/' ],'startFrame',1,'endFrame',3059,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','CarDark','path',[ dataset, '/CarDark/img/' ],'startFrame',1,'endFrame',393,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','CarScale','path',[ dataset, '/CarScale/img/' ],'startFrame',1,'endFrame',252,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','ClifBar','path',[ dataset, '/ClifBar/img/' ],'startFrame',1,'endFrame',472,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Coke','path',[ dataset, '/Coke/img/' ],'startFrame',1,'endFrame',291,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Couple','path',[ dataset, '/Couple/img/' ],'startFrame',1,'endFrame',140,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Coupon','path',[ dataset, '/Coupon/img/' ],'startFrame',1,'endFrame',327,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Crossing','path',[ dataset, '/Crossing/img/' ],'startFrame',1,'endFrame',120,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Crowds','path',[ dataset, '/Crowds/img/' ],'startFrame',1,'endFrame',347,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Dancer','path',[ dataset, '/Dancer/img/' ],'startFrame',1,'endFrame',225,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Dancer2','path',[ dataset, '/Dancer2/img/' ],'startFrame',1,'endFrame',150,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...  
    struct('name','David','path',[ dataset, '/David/img/' ],'startFrame',300,'endFrame',770,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','David2','path',[ dataset, '/David2/img/' ],'startFrame',1,'endFrame',537,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','David3','path',[ dataset, '/David3/img/' ],'startFrame',1,'endFrame',252,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Deer','path',[ dataset, '/Deer/img/' ],'startFrame',1,'endFrame',71,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Diving','path',[ dataset, '/Driving/img/' ],'startFrame',1,'endFrame',215,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Dog','path',[ dataset, '/Dog/img/' ],'startFrame',1,'endFrame',127,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Dog1','path',[ dataset, '/Dog1/img/' ],'startFrame',1,'endFrame',1350,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Doll','path',[ dataset, '/Doll/img/' ],'startFrame',1,'endFrame',3872,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','DragonBaby','path',[ dataset, '/DrangonBaby/img/' ],'startFrame',1,'endFrame',113,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Dudek','path',[ dataset, '/Dudek/img/' ],'startFrame',1,'endFrame',1145,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Faceocc1','path',[ dataset, '/Faceocc1/img/' ],'startFrame',1,'endFrame',892,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Faceocc2','path',[ dataset, '/Faceocc2/img/' ],'startFrame',1,'endFrame',812,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Fish','path',[ dataset, '/Fish/img/' ],'startFrame',1,'endFrame',476,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Fleetface','path',[ dataset, '/Fleetface/img/' ],'startFrame',1,'endFrame',707,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Football','path',[ dataset, '/Football/img/' ],'startFrame',1,'endFrame',362,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Football1','path',[ dataset, '/Football1/img/' ],'startFrame',1,'endFrame',74,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Freeman1','path',[ dataset, '/Freeman1/img/' ],'startFrame',1,'endFrame',326,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Freeman3','path',[ dataset, '/Freeman3/img/' ],'startFrame',1,'endFrame',460,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Freeman4','path',[ dataset, '/Freeman4/img/' ],'startFrame',1,'endFrame',283,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Girl','path',[ dataset, '/Girl/img/' ],'startFrame',1,'endFrame',500,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Girl2','path',[ dataset, '/Girl2/img/' ],'startFrame',1,'endFrame',1500,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Gym','path',[ dataset, '/Gym/img/' ],'startFrame',1,'endFrame',767,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Human2','path',[ dataset, '/Human2/img/' ],'startFrame',1,'endFrame',1128,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Human3','path',[ dataset, '/Human3/img/' ],'startFrame',1,'endFrame',1698,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Human4','path',[ dataset, '/Human4/img/' ],'startFrame',1,'endFrame',667,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Human5','path',[ dataset, '/Human5/img/' ],'startFrame',1,'endFrame',713,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Human6','path',[ dataset, '/Human6/img/' ],'startFrame',1,'endFrame',792,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Human7','path',[ dataset, '/Human7/img/' ],'startFrame',1,'endFrame',250,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Human8','path',[ dataset, '/Human8/img/' ],'startFrame',1,'endFrame',128,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Human9','path',[ dataset, '/Human9/img/' ],'startFrame',1,'endFrame',305,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Ironman','path',[ dataset, '/Ironman/img/' ],'startFrame',1,'endFrame',166,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Jogging-1','path',[ dataset, '/Jogging-1/img/' ],'startFrame',1,'endFrame',307,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Jogging-2','path',[ dataset, '/Jogging-2/img/' ],'startFrame',1,'endFrame',307,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Jump','path',[ dataset, '/Jump/img/' ],'startFrame',1,'endFrame',122,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Jumping','path',[ dataset, '/Jumping/img/' ],'startFrame',1,'endFrame',313,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','KiteSurf','path',[ dataset, '/KiteSurf/img/' ],'startFrame',1,'endFrame',84,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Lemming','path',[ dataset, '/Lemming/img/' ],'startFrame',1,'endFrame',1336,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Liquor','path',[ dataset, '/Liquor/img/' ],'startFrame',1,'endFrame',1741,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Man','path',[ dataset, '/Man/img/' ],'startFrame',1,'endFrame',134,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Matrix','path',[ dataset, '/Matrix/img/' ],'startFrame',1,'endFrame',100,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Mhyang','path',[ dataset, '/Mhyang/img/' ],'startFrame',1,'endFrame',1490,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','MotorRolling','path',[ dataset, '/MotorRolling/img/' ],'startFrame',1,'endFrame',164,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','MountainBike','path',[ dataset, '/MountainBike/img/' ],'startFrame',1,'endFrame',228,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),... 
    struct('name','Panda','path',[ dataset, '/Panda/img/' ],'startFrame',1,'endFrame',1000,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','RedTeam','path',[ dataset, '/RedTeam/img/' ],'startFrame',1,'endFrame',1918,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Rubik','path',[ dataset, '/Rubik/img/' ],'startFrame',1,'endFrame',1997,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Shaking','path',[ dataset, '/Shaking/img/' ],'startFrame',1,'endFrame',365,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Singer1','path',[ dataset, '/Singer1/img/' ],'startFrame',1,'endFrame',351,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Singer2','path',[ dataset, '/Singer2/img/' ],'startFrame',1,'endFrame',366,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Skater','path',[ dataset, '/Skater/img/' ],'startFrame',1,'endFrame',160,'nz',4,'ext','jpg','init_rect', [0,0,0,0])...
    struct('name','Skater2','path',[ dataset, '/Skater2/img/' ],'startFrame',1,'endFrame',435,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Skating1','path',[ dataset, '/Skating1/img/' ],'startFrame',1,'endFrame',400,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Skating2-1','path',[ dataset, '/Skating2-1/img/' ],'startFrame',1,'endFrame',473,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Skating2-2','path',[ dataset, '/Skating2-2/img/' ],'startFrame',1,'endFrame',473,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Skiing','path',[ dataset, '/Skiing/img/' ],'startFrame',1,'endFrame',81,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Soccer','path',[ dataset, '/Soccer/img/' ],'startFrame',1,'endFrame',392,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Subway','path',[ dataset, '/Subway/img/' ],'startFrame',1,'endFrame',175,'nz',4,'ext','jpg','init_rect', [0 0 0 0]),...    
    struct('name','Surfer','path',[ dataset, '/Surfer/img/' ],'startFrame',1,'endFrame',376,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Suv','path',[ dataset, '/Suv/img/' ],'startFrame',1,'endFrame',945,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Sylvester','path',[ dataset, '/Sylvester/img/' ],'startFrame',1,'endFrame',1345,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Tiger1','path',[ dataset, '/Tiger1/img/' ],'startFrame',1,'endFrame',354,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Tiger2','path',[ dataset, '/Tiger2/img/' ],'startFrame',1,'endFrame',365,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Toy','path',[ dataset, '/Toy/img/' ],'startFrame',1,'endFrame',271,'nz',4,'ext','jpg','init_rect',[0,0,0,0])...
    struct('name','Trans','path',[ dataset, '/Trans/img/' ],'startFrame',1,'endFrame',124,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Trellis','path',[ dataset, '/Trellis/img/' ],'startFrame',1,'endFrame',569,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Twinnings','path',[ dataset, '/Twinnings/img/' ],'startFrame',1,'endFrame',472,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Vase','path',[ dataset, '/Vase/img/' ],'startFrame',1,'endFrame',271,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Walking','path',[ dataset, '/Walking/img/' ],'startFrame',1,'endFrame',412,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Walking2','path',[ dataset, '/Walking2/img/' ],'startFrame',1,'endFrame',500,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','Woman','path',[ dataset, '/Woman/img/' ],'startFrame',1,'endFrame',597,'nz',4,'ext','jpg','init_rect', [0,0,0,0])}; 

seqs =seqsOTB; % seqsDTB, seqsTest