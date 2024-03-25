import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
from sklearn.ensemble import RandomForestClassifier
from imblearn.over_sampling import SMOTE

# Read the dataset
df = pd.read_csv("/content/Dataset.txt", header=None)

# Split the dataset into features (x) and target (y)
x = df.iloc[:, :-1].values
y = df.iloc[:, -1].values

# Apply SMOTE to handle class imbalance
smote = SMOTE(random_state=42)
x_resampled, y_resampled = smote.fit_resample(x, y)

# Split the resampled data into training and testing sets
x_train, x_test, y_train, y_test = train_test_split(x_resampled, y_resampled, test_size=0.2, random_state=75)

# Instantiate and train the RandomForestClassifier
classifier = RandomForestClassifier(n_estimators=50, random_state=10)
classifier.fit(x_train, y_train)

# Generate predictions
y_pred = classifier.predict(x_test)

# Calculate evaluation metrics using classification report
evaluation_report = classification_report(y_test, y_pred)

# Print evaluation report
print(evaluation_report)
