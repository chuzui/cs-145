DROP TABLE IF EXISTS Items;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Bids;
DROP TABLE IF EXISTS Category;

CREATE TABLE Items (
  Item_ID INTEGER NOT NULL PRIMARY KEY,
  Seller_ID VARCHAR(100) NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Buy_Price NUMERIC(10,2),
  First_Bid NUMERIC(10,2) NOT NULL,
  Currently NUMERIC(10,2) NOT NULL,
  Number_of_Bids INTEGER NOT NULL,
  Started TIMESTAMP NOT NULL,
  Ends TIMESTAMP NOT NULL,
  Description VARCHAR(5000) NOT NULL,
  FOREIGN KEY (Seller_ID) REFERENCES Users
);

CREATE TABLE Users (
  User_ID VARCHAR(100) NOT NULL PRIMARY KEY,
  Rating INTEGER NOT NULL,
  Location VARCHAR(200),
  Country VARCHAR(100)
);

CREATE TABLE Category (
  Item_ID INTEGER NOT NULL,
  Category VARCHAR(100) NOT NULL,
  FOREIGN KEY (Item_ID) REFERENCES Items
);

CREATE TABLE Bids (
  Item_ID INTEGER NOT NULL,
  User_ID VARCHAR(100) NOT NULL,
  Time TIMESTAMP NOT NULL,
  Amount NUMERIC(10,2) NOT NULL,
  CONSTRAINT Bid_ID PRIMARY KEY (Item_ID, User_ID, Amount),
  FOREIGN Key (Item_ID) REFERENCES Items,
  FOREIGN Key (User_ID) REFERENCES Users
);








