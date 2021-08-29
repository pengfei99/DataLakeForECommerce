# 8 Modeling business logic data

## 8.1 E-commerce workflow
First we need understand the business logic of an E-commerce website. The Goal of a such website is to sell product.
In general, it has the following workflow :
- user list/search products
- user select the product which he is interested in.
- user submit an order that contains the product id, product number, payment, delivery address, etc.
- website backend verify the payment, product availability and validate the order
- website send the product, update the product inventory
- user receives the product, send back a receiving confirmation.

![Data warehouse architecture](https://raw.githubusercontent.com/pengfei99/DataLakeForECommerce/main/img/e_commerce_workflow.jpg)

All these steps requires data to list the product or record the purchase transition. 

For example, when user want to find a product, he has mainly two ways:
- list product by categories: phone-> mobile phone -> appel -> iphone X -> Etc
- search by text keywords: "iphone X 64GB"