# 📺 Netflix Dataset Analysis

This project explores and analyzes a **Netflix dataset** containing TV Shows and Movies with attributes like title, director, cast, country, release year, rating, and description.  
It focuses on **data cleaning, exploratory data analysis (EDA), and sentiment analysis** to uncover key insights about Netflix content.

---

## 🔑 Project Workflow
1. **Data Cleaning**
   - Removed duplicate rows  
   - Handled null values (visualized with heatmap)  
   - Exported cleaned dataset into a new CSV  

2. **Exploratory Data Analysis (EDA)**
   - Found show IDs and directors for specific titles (e.g., *House of Cards*)  
   - Analyzed yearly distribution of TV Shows & Movies (bar graphs)  
   - Counted number of TV Shows vs Movies  
   - Filtered content by year, country, category, and genre  
   - Identified **Top 10 directors** by number of contributions  
   - Explored ratings distribution (e.g., TV-14, R, etc.) across regions  
   - Measured maximum duration of TV Shows/Movies  
   - Determined which country produced the most TV Shows  
   - Sorted and filtered dataset for deeper insights  

3. **Sentiment Analysis**
   - Applied **TextBlob** sentiment analysis on `rating` and `description` columns  
   - Classified sentiments as Positive, Neutral, or Negative  

---

## 🛠️ Tech Stack
- **Python**  
- **Pandas, NumPy** – Data handling  
- **Matplotlib, Seaborn** – Data visualization  
- **TextBlob** – Sentiment analysis  

---

## 📊 Key Insights
- Certain years saw spikes in Netflix releases  
- Movies dominate the dataset compared to TV Shows  
- Top directors contributed significantly more titles  
- Ratings like **TV-14** and **R** were most frequent in specific regions  
- Sentiment analysis revealed overall positive tone in descriptions  

---
