Using MySQL as key-value storage
================================


Querying
--------

Features

```
Feature.each {|t| print "#{t.id} #{t.name} \n"}
1 Shoots from distance 
2 Cuts inside 
3 Runs with ball often 
4 Runs with ball less 
5 Tries long range freekicks 
6 Argues with referee 
7 Tries killer balls
```

Details

```
Detail.each {|t| print "#{t.id}  #{t.feature_id}  #{t.title} \n"}
1  1  When no teammates around him 
2  2  When a wrong footed player on him 
3  7  When opponent team's defence is not blah blah 
4  3  He thinks he is portuguese num. 7 winger 
5  5  He is Juninho Some to titles.
```

Titles

```
Title.each {|t| print "#{t.id} #{t.name} \n"}
1 Lord 
2 Marquisse 
3 Duke 
4 Duchess 
5 Baron 
6 Baronesse 
7 Chevalier 
```

Relational Queries

```
> john = Root.get(1) 
 => #<Root @id=1 @name="John"> 

> john.list_of_titles 
 => ["Marquisse", "Duke", "Duchess"] 

> john.list_of_features 
 => ["Shoots from distance", "Cuts inside", "Runs with ball often", "Tries long range freekicks", "Tries killer balls"] 

> john.list_of_features_with_details # array of hashes
 => [{"Shoots from distance"=>"When no teammates around him"}, {"Cuts inside"=>"When a wrong footed player on him"}, {"Runs with ball often"=>"He thinks he is portuguese num. 7 winger"}, {"Tries long range freekicks"=>"He is Juninho"}, {"Tries killer balls"=>"When opponent team's defence is not blah blah"}] 

> john.full_description 
 => {"titles"=>["Marquisse", "Duke", "Duchess"], "features"=>[{"Shoots from distance"=>"When no teammates around him"}, {"Cuts inside"=>"When a wrong footed player on him"}, {"Runs with ball often"=>"He thinks he is portuguese num. 7 winger"}, {"Tries long range freekicks"=>"He is Juninho"}, {"Tries killer balls"=>"When opponent team's defence is not blah blah"}]} 

> print john.full_json 
{"titles":["Marquisse","Duke","Duchess"],"features":[{"Shoots from distance":"When no teammates around him"},{"Cuts inside":"When a wrong footed player on him"},{"Runs with ball often":"He thinks he is portuguese num. 7 winger"},{"Tries long range freekicks":"He is Juninho"},{"Tries killer balls":"When opponent team's defence is not blah blah"}]} 
```



TODO: Make a sinatra based web interface
 