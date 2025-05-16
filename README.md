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
├── .env                      # Environment variables
├── .git/                     # Git repository metadata
├── .gitattributes            # Git attributes configuration
├── .gitignore                # Git ignore rules
├── .vscode/                  # VS Code workspace settings
├── README.md                 # Project documentation
├── requirements.txt          # Python dependencies
├── venv/                     # Python virtual environment
├── data/                     # Raw data files
│   └── raw/                  # Original CSV files
├── docs/                     # Documentation
│   ├── data_dictionary.md    # Field descriptions
│   ├── queries.md            # Query documentation
│   └── schema.md             # Schema documentation
├── scripts/                  # Utility scripts
│   └── load_data.sh          # Data loading script
├── sql/                      # SQL scripts
│   ├── queries/              # Analysis queries
│   │   ├── customers/        # Customer analysis queries
│   │   ├── orders/           # Order analysis queries
│   │   ├── payments/         # Payment analysis queries
│   │   ├── reviews/          # Review analysis queries
│   │   ├── sales/            # Sales analysis queries
│   │   └── sellers/          # Seller analysis queries
│   ├── schema/               # Database structure
│   │   ├── indexes.sql       # Index definitions
│   │   └── tables.sql        # Table definitions
│   └── views/                # Reusable views
│       ├── customer_overview.sql
│       ├── order_details.sql
│       ├── payment_analysis.sql
│       ├── review_metrics.sql
│       ├── sales_overview.sql
│       └── seller_performance.sql
├── visualizations/           # Data visualizations
│   ├── notebooks/            # Jupyter notebooks
│   │   └── e_commerce_analysis.ipynb
│   └── plots/                # Generated plots
└── LICENSE                   # License information
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
