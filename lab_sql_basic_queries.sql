use sakila; ### we write this to specify that we will use the same data for all queries that follow (otherwise need to write sakila.actor etc)

### 1. Display all available tables in the Sakila database. ###

show tables; 	# actor, actor_info, address, category, city, country, customer, customer_list, film, film_actor, film_category, film_list, film_text, inventory
				# language, nicer_but_slower_film_list, payment, rental, sales_by_film_category, sales_by_store, staff, staff_list, store

### 2. Retrieve all the data from the tables actor, film and customer. ###
select * 
from actor, film, customer;

### 3. Retrieve the following columns from their respective tables:

    # 3.1 Titles of all films from the film table
select title
from film; 

    # 3.2 List of languages used in films, with the column aliased as language from the language table
    select language_id, name as language 
    from language;
    
    # 3.3 List of first names of all employees from the staff table
    select first_name
    from staff;

### 4. Retrieve unique release years. ###
select distinct release_year
from film; 

##### 5. Counting records for database insights:

    # 5.1 Determine the number of stores that the company has.
    select count(store_id)
    from store; # company has 2 stores 
    
    # 5.2 Determine the number of employees that the company has.
	select count(staff_id)
    from staff;
    
    # 5.3 Determine how many films are available for rent and how many have been rented.
    select count(inventory_id) # 4581 currently available
    from inventory; 
    
    select count(rental_id) 
    from rental; # 16044 - higher than available one´s cos one movie could have been rented multiple times before 
    
    # 5.4 Determine the number of distinct last names of the actors in the database.
	select distinct last_name
	from actor;

### 6. Retrieve the 10 longest films.
select film_id, title
from film 
order by length desc 
limit 10; 

##### 7. Use filtering techniques in order to:

    # 7.1 Retrieve all actors with the first name "SCARLETT".
	select actor_id, first_name, last_name
	from actor
	where first_name = "Scarlett";
    
# BONUS:

    # 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes (Hint: use LIKE operator)
	select film_id, title
    from film 
    where title like '%Armageddon%';
	
    # 7.3 Determine the number of films that include Behind the Scenes content
	select count(film_id)
    from film
    where special_features like '%Behind the Scenes%'; # 538 films with this content 
	