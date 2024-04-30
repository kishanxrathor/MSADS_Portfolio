



 

IST 652 – SCRIPTING FOR DATA ANALYSIS


FINAL PROJECT REPORT
INSIGHTS FROM A LOCAL BOOK STORE SALES DATA
 
Kishan Rathor

















Professor: 
Angela Ramnarine Rieks



Objective
As an individual researcher delving into the realm of data analytics, this project represents a significant endeavor to apply analytical skills to a real-world business context. The aim is to dissect and understand the multifaceted nature of a local bookstore's operations in Syracuse through the lens of data. Key objectives include:

1.	Uncovering Sales Trends and Patterns: Analyzing transaction data to identify key drivers of sales and customer purchasing behaviors.
2.	Enhancing Inventory Management: Utilizing data insights to optimize stock levels and manage inventory more effectively.
3.	Developing Strategic Business Recommendations: Drawing actionable insights from data to assist the bookstore in making informed decisions that could lead to improved profitability and customer engagement.

This project seeks to blend theoretical knowledge with practical application, providing a comprehensive analysis that is both insightful and directly applicable to the bookstore's unique context.

Background
The analysis is grounded in the examination of two detailed datasets, each offering a different perspective on the bookstore's transactions and operations:

1.	Old Data: This dataset comprises 801 entries, each representing a distinct transaction. Spanning 22 columns, it includes data on transaction dates, times, gross sales, discounts, service charges, net sales, payment methods, and more. This dataset gives a transaction-level view of the bookstore's sales, allowing for an analysis of sales trends, payment preferences, and customer spending behaviors.
2.	New Data: Complementing the first, this dataset is more extensive, with 4,448 entries. It covers 10 different columns, focusing on the date and time of transactions, item details, quantities, SKU, gross sales, discounts, net sales, tax, and units. This dataset offers a deeper dive into the specifics of what items are being sold, in what quantities, and their sales performance.

Together, these datasets provide a rich, multi-dimensional view of the bookstore's sales and operations, encompassing a wide array of transactional details and customer interactions. The analysis aims to synthesize these datasets to draw a holistic picture of the bookstore's business dynamics, identifying patterns and opportunities for strategic improvements.

Scope
The analysis encompasses two datasets, categorized into sales transactions and customer interactions. The 'New Data' set includes 4,448 entries with a focus on sales details such as item descriptions, quantities, and financials, while the 'Old Data' set comprises 801 entries detailing historical sales patterns, payment methods, and overall business performance before implementing new strategies.

Old Data Set Information:
•	Date and Time: When transactions took place.
•	Sales Data: Including Gross Sales, Discounts, Net Sales, and Tax.
•	Payment Methods: Including Card, Cash, and Other Tender Types.
•	Transaction Details: Such as Service Charges, Total Collected, Fees, and Net Total.
•	Miscellaneous: Including Card Brand, Description, and various Fee-related columns.

New Data Set Information:
•	Date and Time: When transactions took place.
•	Item Details: Item name, Quantity, and SKU.
•	Financials: Gross Sales, Discounts, Net Sales, and Tax.
•	Unit: Unit of measurement for items sold.

Business Questions
1.	Promotional Strategy Tailoring: How can we tailor promotional strategies to encourage the use of payment methods that are less frequently used?
2.	Staffing and Inventory Adjustments: How could staffing and inventory management be adjusted to accommodate the weekly sales cycle?
3.	Analysis of Sales Peaks and Troughs: What are the potential causes of sales peaks and troughs throughout the period?
4.	Alignment of Sales Trends with Marketing: How do monthly sales trends align with marketing efforts and inventory changes?
5.	Holiday Marketing Strategy Improvements: How can holiday marketing strategies be improved based on sales on Holidays?
6.	Pricing Strategy Optimization: How can we use the variability in quantity and total collected to optimize pricing strategies and inventory stocking?
7.	Promotional Activities Scheduling: Can promotional activities or special events be scheduled during lower-activity times to increase sales?

Data Analysis

Data Acquisition
For this project, I was furnished with two datasets by the bookstore owner, which encapsulate a comprehensive record of the store’s sales and customer interactions. The datasets were imported into the Python environment using the Pandas library, a powerful tool for data manipulation and analysis. The first dataset, referred to as 'Old Data', consists of 801 entries across 22 columns, while the second dataset, 'New Data', contains 4,448 entries spanning 10 columns.

Data Cleaning
An initial examination of the structure of the datasets was undertaken to understand the types of data and to identify any immediate cleaning or transformation requirements.

Old Data Structure:
•	Entries: 801
•	Columns: 22
•	Non-Null Count: The dataset is largely complete with few missing values.
•	Data Types: Primarily object (string) types, with one float column.
•	Columns of Note: The data includes transaction details such as 'Date', 'Time', 'Gross Sales', various fees, and payment methods ('Card', 'Cash', etc.).

New Data Structure:
•	Entries: 4,448
•	Columns: 10
•	Non-Null Count: A higher count of missing values in 'SKU' column.
•	Data Types: A mix of datetime, float, integer, and object types.
•	Columns of Note: This dataset includes 'Item', 'Qty', 'Gross Sales', 'Net Sales', and 'Tax'.

I checked for missing values in both datasets:

Checking for missing values
Old Data Missing Values:
•	'Other Tender Type' and 'Other Tender Note' had a significant number of missing values (799 out of 801).
•	'Card Brand', 'Fee Plan', 'Fee Percentage Rate', and 'Fee Fixed Rate' had 342 missing values.

New Data Missing Values:
•	'SKU' had 1,989 missing values, indicating incomplete tracking of stock keeping units.
•	Singular missing values in 'Date', 'Time', 'Item', and 'Unit'.

Given the missing values in the 'SKU' column, which includes important information such as the names of books sold, it was decided not to use this column for the current stage of analysis, although it was not deleted in case it could be useful for future analysis. 
Additionally, a row nmber 4447 had multiple missing values, hence it was removed to maintain data integrity.
 

 

Unique values were also explored, particularly in the 'Card Brand' column from the Old Data, which revealed that payments were made using Discover, American Express, MasterCard, and Visa. NaN values in this column were confirmed by the bookstore owner to indicate cash payments.

 

 

In assessing data quality, I checked for duplicate values and found none, which suggests that transactions were sufficiently unique, even when similar transactions occurred close in time. This is important as it reflects genuine customer behavior and sales patterns.

Furthermore, the 'Gross Sales' column was dropped since its values were identical to those in the 'Net Sales' column, and the 'Unit' column was removed as it only contained the value "EA" (each). 
 

The 'Time' and 'Date' columns were converted to datetime format for more accurate temporal analysis. 
 

One particular row in the New Data was dropped due to it lacking any values, and a new column, 'Total Collected', was computed by adding 'Net Sales' and 'Tax' together.
 
 

Upon converting the 'Time' column from string to datetime, a default date of 1900-01-01 was added, which was unnecessary and subsequently removed. A new column named 'Day' was added corresponding to the dates to facilitate analysis based on the day of the week.
 
Visualisations
Preferred mode of payment
I delved into the payment methods data. By visualizing the modes of payment used for transactions, I observed varying usage across different payment methods.

Two visual representations were created: a bar chart and a pie chart. The bar chart displays the number of transactions for each payment method, while the pie chart provides a percentage distribution of the transactions.

 
Bar Chart Observations:
•	Cash is the most utilized payment method, with 342 transactions.
•	Visa follows with 252 transactions.
•	MasterCard and Discover have a moderate usage with 167 and 22 transactions respectively.
•	American Express is the least used, with only 18 transactions recorded.

 
Pie Chart Observations:
•	Cash payments constitute 42.7% of all transactions.
•	Visa transactions account for 31.5%.
•	MasterCard is used in 20.8% of transactions.
•	Discover and American Express have minimal use at 2.7% and 2.2% respectively.

From the transaction data analysis, it’s evident that cash and Visa are the preferred payment methods, with significant leads over other types. This preference provides an opportunity to introduce targeted marketing strategies such as cash-back offers or loyalty programs, particularly for Visa users. Such initiatives could potentially enhance customer retention and boost sales by leveraging existing consumer behavior trends.

Sales per day of the week
 
In the pursuit of understanding the bookstore's business flow throughout the week, I analyzed the number of sales per day. This analysis aimed to discern patterns that could inform strategic decision-making in terms of promotions and staffing.

The data was visualized in a bar chart representing the number of sales for each day of the week. 

The following observations were made:
•	Sales exhibit variability across the week, with certain days attracting more customers than others.
•	Saturday stands out as the busiest day, with sales nearly reaching the 1000 transactions mark.
•	In contrast, Monday is the quietest, with the lowest number of sales.

Based on these insights, strategic initiatives can be implemented to maximize profitability and improve customer engagement:
•	Weekend Promotions: Considering the surge in traffic on Saturdays, weekend-specific promotions or events could be introduced to further increase sales. These could include limited-time offers or special discounts that encourage more transactions.
•	Monday Marketing: To counteract the lull in sales on Mondays, special deals or marketing campaigns could be launched to attract more customers. These could take the form of 'Monday Deals', early-week discounts, or loyalty program incentives that encourage repeat business.

By tailoring marketing and promotional efforts to the observed sales patterns, the bookstore can better align its strategies with customer behavior, thereby increasing the potential for higher sales volume and overall store performance.

Time Series Analysis
 
In the course of examining the bookstore's sales data, a time series analysis was conducted to discern daily sales patterns and trends over time. This analysis is instrumental in understanding the dynamics of sales and can significantly influence strategic planning.

The time series plot, which outlines the number of sales across several months, reveals notable fluctuations in daily sales, indicating variability inherent in consumer purchasing behavior.

Key Observations from the Time Series Graph:
•	Sales do not remain constant; they vary significantly from day to day.
•	The graph exhibits consistent patterns of peaks and troughs, suggesting regular cycles in consumer behavior.
•	A significant observation is that sales tend to spike around mid-week. These spikes suggest increased activity that could be attributed to various factors such as weekly routines, marketing efforts, or external events.

Strategic Implications:
•	The mid-week sales spikes present an opportunity to schedule impactful marketing initiatives. By aligning marketing campaigns with these natural sales peaks, the bookstore can leverage existing customer traffic to maximize reach and conversion rates.
•	Promotions, events, or special deals could be timed to coincide with the anticipated peaks to further amplify sales numbers.
•	Understanding the sales troughs is equally important. Investigating the causes of these dips and addressing them through targeted strategies could help in smoothing out sales over time, ensuring steadier revenue streams.

This time series analysis underlines the importance of adaptive business strategies that respond to observable sales patterns. By aligning promotional activities with the natural ebb and flow of consumer purchasing, the bookstore can more effectively drive sales and enhance its overall business performance.

Monthly Sales Analysis

Analysis of Sales Distribution and Cumulative Sales Over Time
To gain insights into the bookstore's performance and identify potential seasonal trends, a detailed analysis of the monthly sales data was conducted. The investigation involved both a point-in-time assessment of monthly sales distribution and a longitudinal view via cumulative sales over time.

 
Monthly Sales Distribution Observations:
•	The monthly sales data, represented in a bar chart, highlighted significant variations in the number of sales across different months.
•	September stood out as the month with the highest sales volume, exceeding 1500 transactions.
•	However, there was a notable downward trend as the year progressed into November. It's important to note that data for November was only available for half the month, which may affect the interpretation of this trend.

 
Cumulative Sales Over Time Observations:
•	A cumulative sales plot over the same period depicted a declining trend in total sales.
•	This trend line is critical for understanding the overall sales trajectory and for assessing the long-term sustainability of current business strategies.

Strategic Planning Implications:
•	The peak in September, followed by a decline, suggests that certain factors or events may have driven a temporary increase in sales, which were not sustained.
•	The observed sales dip post-September necessitates strategic planning to counteract this trend. This could involve analyzing specific factors that contributed to the September peak and devising methods to replicate such success.
•	Considering the festive season and end-of-year holidays, there is an opportunity to implement targeted marketing and sales promotions. These initiatives could aim to recapture the high sales activity seen in September and to mitigate the decline in the following months.

Recommendations:
•	Develop and deploy targeted marketing campaigns designed to harness the sales momentum of September.
•	Plan and execute holiday sales promotions to capitalize on seasonal shopping behaviors, with a focus on maximizing sales during what is traditionally a high-revenue period for retail businesses.

Holiday Sales Analysis
Evaluating the Impact of Holidays on Sales
The influence of holidays on consumer behavior is a well-documented phenomenon, and this holds true for the bookstore in question as well. To quantify this effect, a comparative analysis was conducted between sales on holidays and average sales on other days.

  
 
Key Observations:
•	Sales data plotted for holidays versus average non-holiday weekdays shows a marked difference in customer activity.
•	Columbus Day exhibited a significant surge in sales, with totals almost 40 times the average of a typical Monday's sales figures.
•	Similarly, Veterans Day sales dramatically outpaced the sales of an average Thursday.
•	There was no data available for Thanksgiving Day, and it was marked as zero in the dataset, possibly indicating the store was closed on that day.

Strategic Considerations:
•	The stark contrast in sales on Columbus Day and Veterans Day as compared to average weekdays indicates that holidays are indeed significant drivers of traffic and sales.
•	This pattern suggests the potential for tailoring marketing strategies to these specific high-traffic occasions, utilizing them as opportunities to launch special promotions or events that could attract even more customers.

Recommendations for Future Planning:
•	Develop holiday-specific marketing campaigns that capitalize on the increased foot traffic during these days. Tactics could include limited-time offers, themed promotions, or special loyalty rewards that resonate with the celebratory nature of the holiday.
•	Inventory planning should also be adjusted to accommodate the expected increase in sales, ensuring popular items are well-stocked to meet customer demand.
•	Consider extending store hours or enhancing staffing on these peak days to provide the best customer experience and maximize sales opportunities.

Variability in Transaction Metrics
Analysis of Transaction Sizes and Values
An essential aspect of retail analytics is understanding the variability in transaction sizes and values to tailor the business approach to customer spending behaviors. In this analysis, we have created box plots to visualize the distribution and range of 'Quantity' and 'Total Collected' per transaction at the bookstore.

 
Box Plot Observations for Quantity:
•	The majority of transactions involve purchasing 1-2 items.
•	There are outliers where up to 8 items are sold in a single transaction.

 
Box Plot Observations for Total Collected:
•	Most transactions fall under the $50 mark.
•	There are notable outliers with transactions collecting up to $250.

Strategic Insights:
•	The data suggests a concentrated cluster of typical transaction sizes and values, with occasional larger purchases.
•	This pattern presents an opportunity to explore product bundling, which can incentivize customers to increase the number of items per transaction, potentially moving the median transaction size upward.
•	Implementing tiered pricing strategies could cater to the varying spending capacities of customers. By creating pricing tiers, the bookstore can encourage customers to spend more by offering incremental value at each tier.

Recommendations:
•	Develop bundle deals that combine high-selling items with complementary products to increase the average transaction size.
•	Consider implementing a rewards system where customers accumulate points or receive discounts as their purchase volume increases.
•	Analyze the outliers to understand the circumstances leading to higher-value transactions and replicate these conditions where possible.

Correlation Matrix Analysis
Understanding the Relationships Between Sales Metrics
A correlation matrix provides a visual and statistical summary of the relationships between different variables. In this case, a heatmap has been created to understand the interdependencies between various sales metrics such as 'Quantity', 'Gross Sales', 'Discounts', 'Net Sales', and 'Tax'.

 
Key Insights from the Correlation Matrix Heatmap:

Strong Positive Relationships:
•	There is a direct correlation between sales figures (both gross and net) and the amount of tax collected. As expected, when sales increase, so does the tax collected, suggesting that higher sales volumes lead to proportionally higher tax revenues.
•	Sales and Quantity have a strong positive relationship. This indicates that transactions involving higher quantities tend to have higher sales amounts, which is intuitive for retail operations.

Negative Impact of Discounts:
•	The data shows a negative correlation between discounts and net sales. An increase in discounts is associated with a decrease in net sales, which may suggest that while discounts can increase the volume of transactions, they might also be reducing the overall revenue.

Strategic Implications:
•	Optimizing Discounts: Careful consideration is needed when applying discounts. While they can be an effective tool for increasing the number of transactions, there's a delicate balance to strike to ensure that discounts do not significantly erode profit margins.
•	Leveraging Sales and Quantity Relationship: Bundling items or encouraging the purchase of multiple items through promotions could capitalize on the positive relationship between quantity and sales to boost the average transaction value.

Recommendations:
•	Evaluate the current discount strategy to determine the optimal balance between driving sales volume and maintaining revenue.
•	Implement promotional strategies that encourage customers to purchase in larger quantities, such as volume discounts, 'buy one get one' offers, or rewards for purchasing multiple items.
•	Continue to monitor the relationship between discounts and sales to understand the long-term impact on profitability.

Sales During Different Time Of The Day

Identifying Peak Sales Times to Optimize Operations
A critical aspect of retail management is understanding customer traffic patterns throughout the day to optimize staffing, inventory, and marketing efforts. The heatmap provided gives a clear visual representation of sales at different times throughout the day.

 

Key Insights from the Heatmap:
•	The midday period from 12 PM to 3 PM shows the highest sales activity, indicating this is the peak time for customer purchases.
•	The early hours of the morning and later in the evening display significantly lower sales volumes.

Operational Recommendations:
•	Staffing: Align staff schedules to ensure adequate coverage during peak times to handle the increased customer traffic and to enhance the customer service experience.
•	Inventory Management: Prepare for higher inventory turnover during these peak hours by ensuring that popular items are well-stocked and easily accessible.
•	Marketing Initiatives: Implement targeted marketing strategies such as lunchtime specials or midday flash sales to capitalize on the already high traffic and boost sales even further.

Strategic Marketing During Off-Peak Hours:
•	To address the lower sales volumes during the early morning and late evening, consider introducing special promotions during these hours. Early bird discounts or late-night deals could attract more customers during these typically slower periods.
•	Explore the potential for events or workshops during off-peak hours, which could draw in customers and create additional sales opportunities outside the busiest hours.

Conclusion
Synthesizing Insights from Transaction Data Analysis at Books End
This project entailed a comprehensive analysis of transaction data from Books End to gain a deeper understanding of customer purchasing behavior and sales trends. The insights drawn from the data have illuminated several key aspects of the bookstore's operations and customer engagement.

Key Findings:
•	Payment Methods: Cash and Visa emerged as the predominant payment methods used by customers. This finding points to the potential for developing strategic partnerships and crafting rewards programs that encourage repeat business and increase customer loyalty.
•	Sales Trends: Analysis revealed that Saturday is the peak day for sales, presenting a valuable opportunity to implement weekend-specific promotions aimed at boosting revenue.
•	Seasonal Variations: A notable slowdown in sales momentum was observed during October and November. This trend underscores the need for timely marketing interventions to revitalize sales during these months.

Strategic Recommendations:
•	Develop strategic partnerships with payment providers and introduce rewards programs that align with the payment preferences of cash and Visa users.
•	Launch weekend-specific marketing promotions, leveraging the high traffic on Saturdays to increase sales and enhance the shopping experience.
•	Implement targeted marketing campaigns during the identified slow months of October and November. These could include special discounts, events, or loyalty perks to re-engage customers and stimulate purchasing activity.
•	Introduce special incentives on slower business days to distribute the customer traffic more evenly throughout the week and optimize sales potential.

Moving Forward:
•	To maintain a competitive edge in the market, it is recommended that Books End engage in continuous data monitoring. This will enable the bookstore to remain agile, adapting its strategies in response to evolving sales patterns and market trends.

By embracing data-driven decision-making and continuously refining its approach based on the insights gained, Books End can better cater to the needs of its customers and secure its market position.

Future Scope
•	Predictive Analytics: Utilizing machine learning to forecast future sales trends and customer behavior.
•	Customer Segmentation: Targeted marketing based on genres sold
•	Inventory Optimization: Applying data analytics to optimize stock levels, reduce overstock, and avoid stockouts based on genres sold
•	Chat bot: Building a Chat bot using prompt engineering for specific queries of customers
•	Integration with Other Data Sources: Combining sales data with external data sources like market trends, demographic information, or economic indicators to gain a more comprehensive business insight.

References

Data Sources:
•	Books End Bookshop (2023). Transaction Data 2023.

Software and Libraries:
•	Python Software Foundation. (2023). Python Language Reference, version 3.9. Retrieved from https://www.python.org
•	McKinney, W. (2023). pandas: Powerful Python data analysis toolkit, version 1.3.1. Retrieved from https://pandas.pydata.org

Literature:
•	Severance, C. Python for Everybody: Exploring Data in Python 3 (ISBN : 978- 1530051120). https://www.py4e.com/book
Open version https://books.trinket.io/pfe/index.html

•	McKinney, W. Python for Data Analysis, 3rd Edition (ISBN- 9781098104030). https://www.oreilly.com/library/view/python-for-data/9781098104023/
Open version https://wesmckinney.com/book/
•	Data Wrangling with Python: Tips and Tools to Make Your Life Easier (ISBN-13: 978-1491948811) 
See https://www.oreilly.com/library/view/data-wrangling- with/9781491948804/

