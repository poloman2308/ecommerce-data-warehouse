import pandas as pd

date_range = pd.date_range(start="2020-01-01", end="2025-12-31")
df = pd.DataFrame({"date_day": date_range})
df["date_id"] = df["date_day"].dt.strftime("%Y%m%d").astype(int)
df["year"] = df["date_day"].dt.year
df["month"] = df["date_day"].dt.month
df["day"] = df["date_day"].dt.day
df["day_of_week"] = df["date_day"].dt.day_name()

# ✅ Reorder columns to match raw_date table definition
df = df[["date_id", "date_day", "year", "month", "day", "day_of_week"]]

# ✅ Save the corrected CSV
df.to_csv("data/dim_date.csv", index=False)

