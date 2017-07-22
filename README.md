# hair-salon


### Description
This is an application for salon owners where they can keep track of their stylists and clients. A salon owner can add stylists and assign clients to the stylist, He/She can also remove and update stylist names as well as clients.

### Database Setup Instruction

For the database you will need :
1. A hair_salon database for production
2. A hair_salon test database for development

Run the following code in psql

```psql
CREATE DATABASE hair_salon;
  CREATE TABLE clients (id serial PRIMARY KEY, names varchar, stylist_id serial);
  CREATE TABLE stylist (id serial PRIMARY KEY, name varchar);
  CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon
  ```
### License

This project is licenced under the terms of the MIT licenced

### Author

Mohammed Shariff
