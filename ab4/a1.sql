SELECT * FROM db_ws_23.zip;
desc zip; #geht wenn db als default gesetzt

select count(*) 
from zip;

select CITY, zip_code as ZIP 
from db_ws_23.zip; #ich brauch kein "as" wenn es um groß/klein -schreibung geht
