# Brazilian E-Commerce Analysis Project

This project contains comprehensive SQL queries and analysis for the Brazilian E-Commerce dataset from Olist. The dataset includes information about 100,000 orders made at multiple marketplaces in Brazil between 2016 and 2018.

## About the Dataset

The dataset includes various aspects of e-commerce operations:
- Customer and seller information across Brazilian states
- Product details with categorization
- Order status and delivery performance
- Payment transactions and methods
- Customer reviews and satisfaction scores

All sensitive information has been anonymized, and monetary values are in Brazilian Reals (BRL).

## Project Structure

```
brazilian-e-commerce/
├── data/
│   └── raw/                     # Original CSV files
├── sql/
│   ├── schema/                  # Database structure
│   │   ├── tables.sql          # Table definitions
│   │   └── indexes.sql         # Index definitions
│   ├── queries/                # Analysis queries
│   │   ├── sales/             # Sales analysis
│   │   ├── customers/         # Customer analysis
│   │   ├── sellers/           # Seller analysis
│   │   ├── orders/            # Order analysis
│   │   ├── payments/          # Payment analysis
│   │   └── reviews/           # Review analysis
│   └── views/                  # Reusable views
├── visualizations/            # Data visualizations
│   ├── notebooks/            # Jupyter notebooks
│   │   └── e_commerce_analysis.ipynb
|       
└── docs/                      # Documentation
    ├── schema.md             # Schema documentation
    ├── queries.md            # Query documentation
    └── data_dictionary.md    # Field descriptions
```

## Getting Started

1. Create the database schema:
   ```sql
   psql -f sql/schema/tables.sql
   psql -f sql/schema/indexes.sql
   ```

2. Import the data from CSV files in the `data/raw` directory

3. Run the analysis queries from the `sql/queries` directory based on your needs:
   - Sales analysis
   - Customer analysis
   - Seller analysis
   - Order analysis
   - Payment analysis
   - Review analysis

## Quick Start

1. Set up the database and import data:
   ```bash
   cd scripts
   chmod +x setup_database.sh
   ./setup_database.sh
   ```

2. Generate analysis reports:
   ```bash
   chmod +x generate_reports.sh
   ./generate_reports.sh
   ```

Reports will be generated in the `reports/` directory, organized by date.

## Query Categories

- **Sales Analysis**: 
  - Monthly sales trends and growth rates
  - Category performance analysis
  - Seasonal patterns and year-over-year comparisons
  - Revenue distribution across product categories

- **Customer Analysis**: 
  - Geographic distribution of customers
  - Customer lifetime value calculations
  - Purchase frequency patterns
  - Customer retention and churn analysis

- **Seller Analysis**: 
  - Seller performance metrics
  - Geographic distribution of sellers
  - Revenue and order volume rankings
  - Delivery efficiency analysis

- **Order Analysis**: 
  - Delivery time performance
  - Order status distribution
  - Fulfillment rate analysis
  - Estimated vs. actual delivery times

- **Payment Analysis**: 
  - Payment method distribution
  - Installment pattern analysis
  - Transaction value trends
  - Payment type preferences by region

- **Review Analysis**: 
  - Customer satisfaction scores
  - Review sentiment analysis
  - Response time metrics
  - Product category satisfaction levels

## Visualization

The project includes two types of visualizations:

### 1. Jupyter Notebook Visualizations

The project includes comprehensive data visualizations created using Python and Jupyter notebooks:

#### Setup Visualization Environment

1. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Start Jupyter notebook:
   ```bash
   cd visualizations/notebooks
   jupyter notebook
   ```

#### Available Visualizations

1. **Sales Analysis**
   - Monthly sales trends
   - Category performance
   - Revenue distribution
   - Year-over-year growth

2. **Customer Analysis**
   - Geographic distribution
   - Purchase frequency
   - Customer retention
   - Lifetime value analysis

3. **Seller Analysis**
   - Performance metrics
   - Geographic distribution
   - Revenue rankings
   - Delivery efficiency

4. **Order Analysis**
   - Delivery time distribution
   - Order status breakdown
   - Fulfillment rates
   - Seasonal patterns

5. **Payment Analysis**
   - Payment method distribution
   - Installment patterns
   - Transaction value trends
   - Regional preferences

6. **Review Analysis**
   - Score distribution
   - Response time analysis
   - Sentiment trends
   - Category satisfaction

All visualizations are interactive and can be modified or extended as needed.

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b new-feature`
3. Commit your changes: `git commit -am 'Add new feature'`
4. Push to the branch: `git push origin new-feature`
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Data provided by Olist Store
- Dataset available on Kaggle
- Brazilian E-commerce community for insights and feedback
