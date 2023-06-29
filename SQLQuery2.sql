
--Queries for Toy Dateset Collected form Maven Analytics

select products.Product_Category from products group by  products.Product_Category

--Available Product Category

select products.Product_Name from products group by  products.Product_Name

--Available Product Name

select Product_Category, count(Product_Category) as Number_of_Products from products group by Product_Category

--Number of Products in each Product_Category

Select Distinct products.Product_Category, products. Product_Name from products 

--Product Category And their Names

select sum (total_sales.Units *  (products.Product_price - products.Product_Cost)) as Total_Profit 
	from total_sales, products 
		where total_sales.Product_ID=products.Product_ID

-- Total Profit

Select count(Product_Name) As Total_Products from products

--Total Number of Available Products

select sum(Stock_On_Hand) As Available_Stock from inventory

--Total Available Stock

select distinct products.Product_Name, sum(inventory.Stock_On_Hand)  
	over ( partition by products.Product_Name)  as Stock
		from inventory inner join  products
			on products.Product_ID=inventory.Product_ID  
				group by  products.Product_Name, inventory.Stock_On_Hand 

--Availabe Stock Based on Product Name

select distinct products.Product_Category , sum(inventory.Stock_On_Hand) 
	over ( partition by products.Product_Category)  
		from inventory right outer join  products
			on products.Product_ID=inventory.Product_ID  
				group by  products.Product_Category, inventory.Stock_On_Hand 

--Availabe Stock Based on Product Category

select top 5 Product_Name As Top_Selling_Products from total_sales order by Units desc

--Top 5 Products based on Sale

select top 5 Product_Name As Bottom_Selling_Products from total_sales order by Units asc

--Bottom 5 Products based on Sale


Select Product_Name, Product_price - Product_Cost As Profit_Per_Product from products

--Profit for Per Product Sale

Select products.Product_Name, products.Product_price - products.Product_Cost 
	As Profit_Per_Product, sales.Units from products inner join 
		sales on products.Product_ID=sales.Product_ID

--Profit for Per Product  based on Units Sold

select products.Product_Name, (products.Product_price - products.Product_Cost) * sales.Units 
		As profit from products inner join 
			sales on products.Product_ID=sales.Product_ID 

--Profit for Per Product Sale based on Sales

select Store_Location, count (Store_Location) as Number_of_Stores 
		from stores group by Store_Location

--Store Locations

select products.Product_Name, sales.Product_ID, sum(sales.Units) as Total_sale 
	from products, sales where sales.Product_ID= products.Product_ID 
		group by products.Product_Name, sales.Product_ID

-- Total sales Of each Product

select Store_Open_Date, year(store_open_date) as year, count(year(Store_Open_Date))
	over ( partition by year(store_open_date)) as Number_Of_Years from stores

--Store Open Date by Years

select distinct Store_Location, count(Store_Location) over (partition by Store_Location) as Number_of_Stores from stores

-- Store Locations another type Query

select stores.Store_City, sum(sales.Units) as Total_Sale from sales inner join stores 
     on sales.Store_ID=stores.Store_ID group by stores.Store_City

-- Total sales by City

select stores.Store_City, datename(year, sales.Date), sum(sales.Units) as 
	Total_Sale from sales inner join stores 
     on sales.Store_ID=stores.Store_ID group by stores.Store_City, datename(year, sales.Date) 

-- Total sales in Cities by Year

select DATENAME(DW, Date) as Order_Day , count( distinct sale_Id) as 
	Total_Sales  from sales group by DATENAME(DW, Date) 

--Sales by Days

select DATENAME(MONTH, Date) as Order_Day , count( distinct sale_Id) as 
	Total_Sales from sales group by DATENAME(MONTH, Date) 

--Sales by Month

select DATENAME(YEAR, Date) as Order_Day , count( distinct sale_Id) as 
	Total_Sales  from sales group by DATENAME(YEAR, Date) 

--Sales by Year

select DATENAME(QUARTER, Date) as Order_Day , count( distinct sale_Id) as 
	Total_Sales from sales group by DATENAME(QUARTER, Date) 

--Sales by Quarters
