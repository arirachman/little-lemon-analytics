# Little Lemon Database Client App

This project is a database client application that connects to a MySQL database using Python. It is designed to be run in a Jupyter Notebook environment and includes a Docker setup for running a MySQL server.

## Project Structure

```
python-msql-dbclient
├── notebooks
│   └── python-msql-dbclient.ipynb  # Jupyter Notebook for database operations
├── docker
│   └── mysql
│       └── my.cnf                   # MySQL configuration file
├── requirements.txt                  # Python dependencies
└── README.md                         # Project documentation
```

## Setting Up MySQL Container

To set up a MySQL container, follow these steps:

1. **Install Docker**: Ensure that Docker is installed on your machine. You can download it from [Docker's official website](https://www.docker.com/get-started).

2. **Create a Docker Network** (optional): This step is optional but recommended if you want to manage multiple containers easily.
   ```
   docker network create mysql-network
   ```

3. **Create a MySQL Configuration File**: The `my.cnf` file is located in the `docker/mysql` directory. You can customize it as needed. Here’s a basic example:
   ```
   [mysqld]
   character-set-server=utf8mb4
   collation-server=utf8mb4_unicode_ci
   ```

4. **Run the MySQL Container**: Use the following command to run the MySQL container. Replace `your_password` with a secure password of your choice.
   ```
   docker run --name mysql-container --network mysql-network -e MYSQL_ROOT_PASSWORD=your_password -e MYSQL_DATABASE=testdb -p 3306:3306 -d mysql:latest
   ```

5. **Verify the MySQL Container**: Check if the container is running with:
   ```
   docker ps
   ```

## Connecting to MySQL from Jupyter Notebook

1. **Install Required Python Packages**: Make sure to install the required packages listed in `requirements.txt`. You can do this by running:
   ```
   pip install -r requirements.txt
   ```

2. **Open the Jupyter Notebook**: Launch Jupyter Notebook and open `notebooks/python-msql-dbclient.ipynb`.

3. **Modify Connection Parameters**: In the notebook, ensure that the connection parameters (host, user, password, database) match your MySQL setup. For example:
   ```python
   connection = connector.connect(
       host="127.0.0.1",
       user="root",
       password="your_password",
       database="testdb",
       port=3306
   )
   ```

4. **Run the Notebook**: Execute the cells in the notebook to connect to the MySQL database and perform operations.

## Acknowledgements
This project is one of the assignment in [Meta Database Engineering Professional Certificate on Coursera](https://www.coursera.org/professional-certificates/meta-database-engineer)