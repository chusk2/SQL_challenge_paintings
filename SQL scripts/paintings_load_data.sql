/* SQL script to load the csv files
into the different tables.
Tables are populated in the same order
as they were previously created. */

use paintings ;

LOAD DATA INFILE '/var/lib/mysql-files/paintings_csv/museum.csv'
INTO TABLE museum
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
        
LOAD DATA INFILE '/var/lib/mysql-files/paintings_csv/artist.csv'
INTO TABLE artist
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
        
LOAD DATA INFILE '/var/lib/mysql-files/paintings_csv/work.csv'
INTO TABLE work
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
                
LOAD DATA INFILE '/var/lib/mysql-files/paintings_csv/canvas_size.csv'
INTO TABLE canvas_size
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
        
LOAD DATA INFILE '/var/lib/mysql-files/paintings_csv/product_size.csv'
INTO TABLE product_size
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(work_id, size_id, sale_price, regular_price) ;

LOAD DATA INFILE '/var/lib/mysql-files/paintings_csv/subject.csv'
INTO TABLE subject
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/var/lib/mysql-files/paintings_csv/museum_hours.csv'
INTO TABLE museum_hours
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/var/lib/mysql-files/paintings_csv/image_link.csv'
INTO TABLE image_link
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
        
        
        
        
        
        
        
        
        
        
        
        
        

        
