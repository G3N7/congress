If Mongo database is really new:

	rake create_indexes

If elasticsearch database is really new:

	rake elasticsearch:init

If lacking bill text:

	rake task:bills_bulk debug=1 year=2012 && rake task:bills_bulk debug=1 year=2011 && rake task:bills_bulk debug=1 year=2010 && rake task:bills_bulk debug=1 year=2009

Non-ES:

	rake task:legislators debug=1
	rake task:committees debug=1
	rake task:districts debug=1 cache=1 per_page=34000

	rake task:bills debug=1 congress=112 && rake task:bills debug=1 congress=112

elasticsearch:

	rake task:bills_text debug=1 congress=113 && rake task:bills_text debug=1 congress=112 && rake task:bills_text debug=1 congress=111

	rake task:regulations cache=1 debug=1 year=2014 && rake task:regulations cache=1 debug=1 year=2013 && rake task:regulations cache=1 debug=1 year=2012 && rake task:regulations debug=1 cache=1 year=2011

	rake task:gao_reports cache=1 debug=1 year=2014 && rake task:gao_reports cache=1 debug=1 year=2013 && rake task:gao_reports cache=1 debug=1 year=2012 && rake task:gao_reports cache=1 debug=1 year=2011

	rake task:videos archive=True captions=True && rake task:videos archive=True captions=True senate=True

Others that will take care of themselves:

	rake task:floor_house
	rake task:floor_senate
	rake task:upcoming_house
	rake task:upcoming_senate
	rake task:hearings_house
	rake task:hearings_senate
	rake task:bills_nicknames
