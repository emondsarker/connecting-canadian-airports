# Canadian Airports Flight Network Analysis

## Objective

This project analyzes the flight network connecting Canadian airports. It identifies direct flight connections between pairs of Canadian airports by querying real-time flight data from the AviationStack API. The results can be used for network science analysis to understand the connectivity patterns of Canadian air transportation.

## Code Walkthrough

The project consists of the following components:

1. **Data Loading**: The code reads a list of Canadian airports from `canadian_airports.csv`, which contains airport codes (IATA) and corresponding city names.

2. **Pair Generation**: The code generates all possible pairs of departure and arrival airports, excluding self-loops (flights from an airport to itself).

3. **API Integration**: The project uses the AviationStack API to fetch real-time flight data between airport pairs. API keys are managed through the `api_keys.txt` file, with the system rotating through keys to handle API rate limits.

4. **Data Collection**: For each airport pair, the code queries the API to find if there are direct flights. Results are logged to CSV files (`flights_found_dep_arr_log.csv`), both locally and on Google Drive when running on Colab.

5. **Progress Tracking**: The code includes functionality to resume from where it left off if the process is interrupted, by checking which airport pairs have already been processed.

6. **Verification**: There's a verification step to check if all possible airport combinations have been processed.

## Running on Google Colab

To run this project on Google Colab:

1. Create a new Colab notebook or upload the `network_science_assignment1.ipynb` file.

2. Upload the `canadian_airports.csv` file to Colab's file system (or to your Google Drive).

3. Create an `api_keys.txt` file with your AviationStack API keys (one key per line). You can obtain API keys by signing up at [AviationStack](https://aviationstack.com/).

4. If using Google Drive for storage:

   - Mount your Google Drive:
     ```python
     from google.colab import drive
     drive.mount('/content/drive')
     ```
   - Update file paths in the code to point to your Drive if needed.

5. Run the cells in order. The code will:

   - Load the Canadian airports
   - Generate all possible airport pairs
   - Query the API for each pair
   - Log the results

6. The results will be saved to `flights_found_dep_arr_log.csv` both locally and on Google Drive.

## Running Locally

To run this project locally:

1. Clone or download the project files to your local machine.

2. Install the required Python packages:

   ```bash
   pip install pandas requests
   ```

3. Prepare your API keys:

   - Sign up for an AviationStack API key at [AviationStack](https://aviationstack.com/)
   - Add your API keys to the `api_keys.txt` file (one key per line)

4. Modify the file paths in the code:

   - Change `/content/canadian_airports.csv` to the local path of your CSV file
   - Remove or comment out the Google Drive-specific code sections:
     ```python
     # Comment out or remove Google Drive logging
     # drive_log_path = '/content/drive/MyDrive/flights_found_dep_arr_log.csv'
     # ...
     ```

5. Run the notebook using Jupyter:

   ```bash
   jupyter notebook network_science_assignment1.ipynb
   ```

   Or run as a Python script if you've exported it:

   ```bash
   python network_science_assignment1.py
   ```

6. The results will be saved to `flights_found_dep_arr_log.csv` in your local directory.

## Notes

- The API has rate limits, especially on free tiers. The code includes sleep timers to respect these limits, but you may need to adjust them based on your API plan.
- Processing all possible airport pairs can take a significant amount of time due to API rate limits.
- The code includes functionality to resume from where it left off if the process is interrupted.
- For large datasets, consider running the code in batches or focusing on specific subsets of airports.
