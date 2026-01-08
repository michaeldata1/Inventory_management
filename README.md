# Inventory Management SQL Project

This repository contains a **SQL‑based Inventory Management system** designed to demonstrate database design, data manipulation, and business logic using MySQL. The project includes schema creation, sample data population, triggers, stored procedures, functions, and exploratory analysis queries — showcasing core SQL skills relevant for data analytics and database work.

---

## 🧱 Project Overview

This project models a simple inventory and order management system that supports the following:

- **Products** with prices and available quantities  
- **Customers** who place orders  
- **Orders** with detailed line items  
- **Automated business logic** via triggers for inventory updates  
- **Stored procedures** for inserting and modifying data  
- **User‑defined functions** for analytics and summarization  

These components illustrate both *transactional database design* and *data exploration* through SQL.  

---

## 📦 Database Structure

The database consists of four main tables:

- `products` — product catalog with stock levels  
- `customers` — customer information  
- `orders` — order headers  
- `order_details` — detailed line items for each order  

Refer to the SQL scripts in this repository for full table definitions, constraints, and relationships.  

---

## 🚀 Getting Started

### Requirements

- MySQL Server (8.x recommended) or compatible SQL environment  
- A SQL client (MySQL Workbench, DBeaver, PopSQL, etc.)  

### Setup

1. Clone this repository:

   ```sh
   git clone https://github.com/michaeldata1/Inventory_management.git
   cd Inventory_management
