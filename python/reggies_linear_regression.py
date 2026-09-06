"""
Reggie's Linear Regression
==========================

A from-scratch Python implementation of a simple linear regression search.

Project goal:
Find the line y = m*x + b that best fits observed bouncy-ball data by
minimizing total absolute error.

The project uses a brute-force approach:
1. Generate possible slope (m) and intercept (b) values.
2. Test every possible m/b combination.
3. Calculate total absolute error for each candidate line.
4. Keep the line with the smallest error.
"""

# -------------------------------------------------------------------
# Part 1: Calculate predicted values and error
# -------------------------------------------------------------------

def get_y(m, b, x):
    """
    Calculate the predicted y-value for a line.

    Formula:
        y = m*x + b

    Args:
        m (float): Slope of the line.
        b (float): Y-intercept of the line.
        x (float): Input value.

    Returns:
        float: Predicted y-value.
    """
    return m * x + b


def calculate_error(m, b, point):
    """
    Calculate absolute error between a data point and a candidate line.

    Args:
        m (float): Slope of the candidate line.
        b (float): Y-intercept of the candidate line.
        point (tuple): An observed data point in the form (x, y).

    Returns:
        float: Absolute vertical distance between predicted and actual y.
    """
    x_point = point[0]
    y_point = point[1]

    # Calculate the y-value predicted by the candidate line.
    predicted_y = get_y(m, b, x_point)

    # Absolute error prevents negative and positive errors from cancelling out.
    return abs(predicted_y - y_point)


def calculate_all_error(m, b, points):
    """
    Calculate total absolute error for a line across all observed data points.

    A lower total error indicates that the candidate line fits the
    observed data more closely.

    Args:
        m (float): Slope of the candidate line.
        b (float): Y-intercept of the candidate line.
        points (list): List of observed (x, y) data points.

    Returns:
        float: Total absolute error across all observations.
    """
    total_error = 0

    for point in points:
        total_error += calculate_error(m, b, point)

    return total_error


# -------------------------------------------------------------------
# Part 2: Search for the line of best fit
# -------------------------------------------------------------------

# Observed data points: (ball width in cm, bounce height in meters).
datapoints = [
    (1, 2),
    (2, 0),
    (3, 4),
    (4, 4),
    (5, 3)
]

# Create candidate slope values from -10.0 to 10.0 in 0.1 increments.
possible_ms = [m / 10 for m in range(-100, 101)]

# Create candidate intercept values from -20.0 to 20.0 in 0.1 increments.
possible_bs = [b / 10 for b in range(-200, 201)]

# Initialize the best result.
# Infinity ensures the first calculated error is always smaller.
smallest_error = float("inf")
best_m = 0
best_b = 0

# Test every possible combination of m and b.
for m in possible_ms:
    for b in possible_bs:
        current_error = calculate_all_error(m, b, datapoints)

        # Update the best line when a lower total error is found.
        if current_error < smallest_error:
            smallest_error = current_error
            best_m = m
            best_b = b


# -------------------------------------------------------------------
# Part 3: Make a prediction with the best-fit line
# -------------------------------------------------------------------

# Codecademy identifies the best-fit equation as y = 0.4x + 1.6.
# Use the values found in the search to make the prediction.
ball_width = 6
predicted_bounce_height = get_y(best_m, best_b, ball_width)


# -------------------------------------------------------------------
# Results
# -------------------------------------------------------------------

print("Reggie's Linear Regression Results")
print("-" * 40)
print(f"Best slope (m): {best_m:.1f}")
print(f"Best intercept (b): {best_b:.1f}")
print(f"Best-fit equation: y = {best_m:.1f}x + {best_b:.1f}")
print(f"Minimum total absolute error: {smallest_error:.1f}")
print(f"Predicted bounce height for width {ball_width}: "
      f"{predicted_bounce_height:.1f} meters")