# 1.1 What is data lake?

A data lake is a central repository that stores data in its natural/raw format, usually object blobs or files. A data 
lake is usually a single store of data including raw copies of source system/business data, sensor data, social data 
etc., and transformed data used for tasks such as reporting, visualization, advanced analytics and machine learning. 

A data lake must be able to store structured data from relational databases (rows and columns), semi-structured data 
(CSV, logs, XML, JSON), unstructured data (emails, documents, PDFs) and binary data (images, audio, video).

A data lake can be established: 
- **on premises**: (within an organization's data centers)
- **in cloud**: public cloud (such as Amazon, Microsoft, or Google).

# 1.2 Why an enterprise need a data lake?

An enterprise has many departments, and they all produce data. For the CEO to understand what's going on inside his 
enterprise, he needs to 
- store these data in a central repository
- can analyse these data
- provide report on what's happened, why its happened.
- provide possible solutions on how to prevent bad things or increase good things to happen.

# 1.3 Common pitfalls of a data lake

To build a successful data lake, you must address non-functional requirements of a data lake
- security: Without it, no one will upload their data to the data lake 
- data governance/management: Without it, data will be not exploitable after upload. Hence data lake become a 
data swamp. Check this [paper](https://camps.aptaracorp.com/AuthorDashboard/dashboard.html?key=0&val=8b339ee9-d377-11eb-8d84-166a08e17233) for more details

# 1.4 Overview of the data lake layers of an E-commerce  

## 1.4.1 Data sources layer 
In this project, we will build a data lake for an E-commerce enterprise. The first step is to identify the data source. 
Normally we can divide data sources into 3 categories:
- business transaction data: such as product description, inventory, user order, shipment, etc. Business Transaction data
  are the most import data for an e-commerce. They are often stored in a RDMS (e.g. oracle, postgres). 

- User behavior data: such as which product has been viewed (Visits), how much time the user spend on a specific section(Time On Site), 
  the number of unique visitor(Visitor), Page Views, Bounce Rate. These data are often stored in a log server in the 
  format of file or document based databased(e.g. mongo).
    
- web scraping data: such as the product prices of your competitors. This kind of data must be collected and used with 
  caution. You may encounter legal problems in some countries.
  
## 1.4.2 Data ingestion layer
In this project, we use flume to ingest user behavior data. Note it does exist many other framework/tool 


# 1.5 Overview of the data warehouse architecture


