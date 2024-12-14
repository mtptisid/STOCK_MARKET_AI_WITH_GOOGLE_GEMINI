
# Google Gemini LLM Text-to-SQL Project

This project demonstrates how to integrate **Google Gemini LLM** with a MySQL database using LangChain for natural language queries. It uses semantic similarity-based few-shot learning to generate accurate SQL queries and fetch results from the database.

---

## Features
- **Gemini LLM Integration**: Leverages Google's Vertex AI `gemini-1.5-pro` model.
- **Few-Shot Prompting**: Uses semantic similarity to dynamically select relevant examples for prompt engineering.
- **Text-to-SQL**: Converts natural language questions to SQL queries and executes them.
- **Database Support**: Currently supports MySQL with the ability to extend to other databases.
- **Vector Search**: Utilizes HuggingFace embeddings and Chroma for example selection.
- **Dynamic Prompting**: Builds a highly tailored prompt based on database schema and selected examples.

---

## Prerequisites
1. **Python 3.12 or higher**
2. **MySQL Database** with required schema and data.
3. Required Python packages:
   - `langchain`
   - `langchain-google-genai`
   - `pysqlite3`
   - `sentence-transformers`
   - `chromadb`
   - `mysql-connector-python`
   - `python-dotenv`

4. Google Vertex AI enabled with API keys stored in `.env`.

---

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Google-Gemini-LLM-Text-to-SQL.git
   cd Google-Gemini-LLM-Text-to-SQL
   ```

2. Create a virtual environment and activate it:
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # For Linux/Mac
   venv\Scripts\activate     # For Windows
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Set up the environment variables:
   - Create a `.env` file in the root directory:
     ```
     GOOGLE_API_KEY=your_google_api_key
     ```
   - Replace `your_google_api_key` with your actual Vertex AI API key.

5. Configure MySQL database:
   - Update the database credentials (`db_user`, `db_password`, `db_host`, `db_name`) in `langchain_helper.py`.

---

## How It Works
1. **Few-Shot Examples**:
   Predefined examples (question, SQL query, and results) are stored in `few_shots`. These are used to fine-tune the language model's output for SQL generation.

2. **Vector Embedding**:
   - Each example is converted into embeddings using HuggingFace's `sentence-transformers/all-MiniLM-L6-v2`.
   - These embeddings are stored in Chroma's vector store for semantic similarity search.

3. **Query Execution**:
   - User's question is matched with the most similar examples using the vector store.
   - A tailored prompt is created with the matched examples and database schema information.
   - The prompt is sent to Google Gemini LLM for SQL query generation.
   - The SQL query is executed on the MySQL database, and the results are returned.

---

## Usage
1. Run the main script:
   ```bash
   python main.py
   ```

2. Input a natural language question:
   ```
   How many shares of Meta Platforms Inc. are available?
   ```

3. Get the result:
   ```
   1500000
   ```

---

## Troubleshooting
- **Database Errors**:
  Ensure that the MySQL database is correctly configured and populated with the required schema and data.

- **Chroma Issues**:
  If encountering vector store errors, ensure that Chroma and HuggingFace embeddings are installed and configured correctly.

- **API Issues**:
  Ensure your Google Vertex AI API key is active and valid.

---

## Example Few-Shot Data
Here are a few examples used for few-shot learning:

| **Question**                                      | **SQL Query**                                                                                                    | **Answer** |
|---------------------------------------------------|------------------------------------------------------------------------------------------------------------------|------------|
| What is the total number of shares for Apple Inc.?| `SELECT total_shares FROM stocks WHERE company_name = 'Apple Inc.'`                                              | 1000000    |
| What is the current price of Tesla Inc. stock?    | `SELECT current_price FROM stocks WHERE company_name = 'Tesla Inc.'`                                             | 450.75     |
| What was the opening price of NVIDIA Corp. stock? | `SELECT open_price FROM price_history JOIN stocks ON price_history.stock_id = stocks.stock_id WHERE company_name='NVIDIA Corp.' AND date='2024-01-01'`| 120.00     |

---

## File Structure
```
Google-Gemini-LLM-Text-to-SQL/
│
├── main.py                     # Main entry point for the application
├── langchain_helper.py         # Contains the logic for LLM, embeddings, and SQL generation
├── requirements.txt            # Python dependencies
├── .env                        # Environment variables (not included in repo)
└── README.md                   # Documentation
```

---

## Future Enhancements
1. **Support for More Databases**:
   Extend functionality to support PostgreSQL, SQLite, etc.
2. **Advanced Query Handling**:
   Incorporate JOINs, GROUP BY, and other complex SQL operations.
3. **Web UI**:
   Create a Streamlit or Flask-based interface for easier usage.
4. **Error Correction**:
   Implement automatic SQL error correction for enhanced robustness.

---

## Acknowledgments
- **LangChain** for making LLM and SQL integration seamless.
- **Google Vertex AI** for powering Gemini LLM.
- **HuggingFace** for the sentence transformer embeddings.
- **Chroma** for semantic similarity search.

---

## License
This project is licensed under the MIT License. See the LICENSE file for details.
