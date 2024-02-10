# The Fjelstul World Cup MySQL Database

This repository contains a MySQL port of the [Fjelstul World Cup Database](https://github.com/jfjelstul/worldcup), a comprehensive database about the FIFA World Cup created by Joshua C. Fjelstul that covers all `22` men's tournaments (1930-2022) and all `8` women's tournaments (1991-2019). The database includes `27` datasets (over 1.58  million data points) that cover all aspects of the World Cup.

The data and original structure of the database tables and their relationships were not altered. However, modifications have been made to fields' data types to make them MySQL compliant.  

## Documentation

To know more about the structure of the tables and the meaning of their content, you can refer to the [Codebook](docs/world-cup-codebook.pdf).

However, to read the full documentation and have access to the raw data, please visit the [Fjelstul World Cup Database](https://github.com/jfjelstul/worldcup) repository.

## Installing the Database

Using your favorite MySQL GUI client, import the following files in order:

1. `worldcup.schema.sql` contains the table structure
2. `worldcup.data.sql` contains the INSERT statements

Alternatively, you can import the `World Cup` database using MySQL's CLI by executing the following commands:

```bash
mysql -u <username> -p <password> < worldcup.schema.sql
```

Then,

```bash
mysql -u <username> -p <password> worldcup < worldcup.data.sql
```

**NOTE**: There is no need to create a database prior to importing the above .sql scripts as a `worldcup` MySQL database will be created automatically.

## Crediting/Citing the Database

If you use the database in a paper or a project, please cite the database:

> Fjelstul, Joshua C. "The Fjelstul World Cup Database v.1.2.0." July 19, 2023. https://www.github.com/jfjelstul/worldcup.

## License

The copyright for the original structure and organization of the [Fjelstul World Cup Database](https://www.github.com/jfjelstul/worldcup) and for all of the documentation and replication code for the database is owned by Joshua C. Fjelstul, Ph.D.

The Fjelstul World Cup Database and the `worldcup` package are both published under a [CC-BY-SA 4.0 license](https://creativecommons.org/licenses/by-sa/4.0/legalcode). This means that you can distribute, modify, and use all or part of the database for commercial or non-commercial purposes as long as (1) you provide proper attribution and (2) any new works you produce based on this database also carry the CC-BY-SA 4.0 license.

To provide proper attribution, according to the CC-BY-SA 4.0 license, you must provide the name of the author ("Joshua C. Fjelstul, Ph.D."), a notice that the database is copyrighted ("© 2023 Joshua C. Fjelstul, Ph.D."), a link to the CC-BY-SA 4.0 license (https://creativecommons.org/licenses/by-sa/4.0/legalcode), and a link to the original repository (https://www.github.com/jfjelstul/worldcup). You must also indicate any modifications you have made to the database.

Consistent with the CC-BY-SA 4.0 license, I provide this database as-is and as-available, and make no representations or warranties of any kind concerning the database, whether express, implied, statutory, or other. This includes, without limitation, warranties of title, merchantability, fitness for a particular purpose, non-infringement, absence of latent or other defects, accuracy, or the presence or absence of errors, whether or not known or discoverable.