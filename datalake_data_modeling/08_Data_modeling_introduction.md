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

![E Commerce_Workflow](https://raw.githubusercontent.com/pengfei99/DataLakeForECommerce/main/img/e_commerce_workflow.jpg)

All these steps requires data to list the product or record the purchase transition. 

For example, when user want to find a product, he has mainly two ways:
- list product by categories: phone-> mobile phone -> appel -> iphone X -> Etc
- search by text keywords: "iphone X 64GB"

## 8.2 Important term and concept of E-commerce

In e-commerce, we have some important term/concept to understand: 
- SKU: Stock Keeping Unit（库存量基本单位）。现在已经被引申为产品统一编号的简称，每种产品均对应有唯一的SKU号。
- SPU（Standard Product Unit）：是商品信息聚合的最小单位，是一组可复用、易检索的标准化信息集合。

For example, Apple_iPhone_X is SPU. Apple_iPhone_X_Black_128GB is SKU. You can consider SKU is more detailed
product specification of SPU.


![business_logic_data_model](https://raw.githubusercontent.com/pengfei99/DataLakeForECommerce/main/img/business_logic_data_model.PNG)

![back_end_data_model](https://raw.githubusercontent.com/pengfei99/DataLakeForECommerce/main/img/back_end_data_model.PNG)

