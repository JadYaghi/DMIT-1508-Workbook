# Lab Template

## Customer Details View

### 0NF - 

**Customer :** <span class= "md"><b class= "pk">Customer#</b>, FirstName, LastName, Address,City, Province, PostalCode, HomePhone</span>

### 1NF-3NF

*No changes to entity/table in 1NF to 3NF*

### ERD

![Customers View](./ERD-CustomerView.png)

## Customer Orders View

### 0NF

**Order :** <span class="md"><b class= "pk">Order#</b>, Customer#, FirstName, LastName, Address, City, Province, PostalCode, Phone, Date, <b class= "rg">Item#, Description, Quantity, CurrentPrice, Amount</b>, Subtotal, GST, Total</span>

### 2NF 

**OrderDetails :** <span class= "md"><b class="pk"><u class= "fk">Order#</u><u class= "fk">Item#</u></b>, Quantity, SellingPrice, Amount</span>

**Item** <span class="md"><b class="pk">Item#</b>, Description, CurrentPrice</span>

### 3NF 

**Order** <span class= "md"><b class="pk">Customer#</b>, <u class="fk">Customer#</u>, Date, Subtotal, GST, Total

**Customer** <span class="md"><b class="pk">Customer#</b>,FirstName, LastName, Address, City, Province, PostalCode, Phone

### ERD

![Customers Order View](./ERD-CustomerOrderView.png)

-----

> Your lab is to be submitted as a **Markdown** (`*.md`) file using the following legend. The recommended text editor for these files is [**Visual Studio Code**](https://code.visualstudio.com), as this editor allows you to preview your markdown document as HTML. ERDs can be created using [**Lucidchart**](https://www.lucidchart.com/) and exported as `*.png` files. Check with your instructor about getting a free *Lucidchart* account to use during this course.

## Legend

This legend is a guide to reading and interpreting the table listings under 0NF through 3NF.

- **TableName:** - Table names will be bolded and end with a colon. (e.g.: `**TableName:**`)
- (Column, Names) - Column names for a table will be enclosed in (rounded parenthesis).
- <b class="pk">PrimaryKeyFields</b> - Primary key fields will be bold and inside a box. (e.g: `<b class="pk">PrimaryKeyFields</b>`)
- <u class="fk">ForeignKeyFields</u> - Foreign key fields will be a wavy underline in italic and green. (e.g.: `<u class="fk">ForeignKeyFields</u>`)
- <b class="rg">{</b>Repeating Groups<b class="rg">}</b> - Groups of repeating fields will be identified in 0NF stage, and will be enclosed in orange curly braces. (e.g.: `<b class="rg">{</b>Repeating, Group, Fields<b class="rg">}</b>`)



----

<style type="text/css">
.md {
    display: inline-block;
    vertical-align: top;
    white-space: normal;
}

.md:before {
    content: '(';
    font-size: 1.25em;
    font-weight: bold;
}

.md:after {
    content:')';
    font-size: 1.25em;
    font-weight: bold;
}

.pk {
    font-weight: bold;
    display: inline-block;
    border: solid thin blue;
    padding: 0 1px;
    position: relative;    
}

pk:before {
    content:'P';
    font-size: .55em;
    font-weight:bold;
    color:white;
    background-color: #72c4f7;
    position: absolute;
    left:-5px;
    top:-15px;
    border-radius:50%;
    border:solid thin blue;
    width: 1.4em;
    height: 1.4em;
    padding: 3px;
    text-align: center;
}

.fk {
    color: green;
    font-style: italic;
    text-decoration: wavy underline green;    
    padding: 0 2px;
    position: relative;
}

.fk:before {
    content: 'L';
    font-size: .65em;
    position: absolute;
    left: -1px;
    bottom: -17px;
    color: darkgreen;
    background-color: #a7dea7;
    border-radius: 50%;
    border: dashed thin green;
    width: 1.4em;
    height: 1.4rm;
    padding: 3px;
    text-align: center;
}

.rg {
    display:inline-block;
    color: inherit;
    font-size: 1em;
    font-weight: normal;
}

.rg:before {
    content: '\007B';
    color: darkorange;   
    font-size: 1.2em;
    font-weight: bold;
}

.rg:after {
    content: '\007D';
    color: darkorange;
    font-size: 1.1em;
    font-weight: bold;
}

.note {
    font-weight: bold;
    color: brown;
    font-size: 1.1em;
}
</style>