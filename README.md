# Coin-detection
This `README.md` provides clear instructions on implementing the `estim_coins` function and running the project using `test_main.m`.

This project focuses on detecting and recognizing coins in images using image calibration, geometric estimation, and MATLAB-based image processing techniques. The system leverages calibration images to eliminate noise and correct uneven lighting, enabling robust coin detection and recognition.

- `estim_coins.m`: Function to estimate coins in an input image.
- `test_main.m`: Main script to test and implement the coin detection and recognition model.
- Calibration Images:
  - `B_mean.JPG` (Bias Mean)
  - `D_mean.JPG` (Dark Mean)
  - `F_mean.JPG` (Flat Mean)
- Measurement Images:
  - `1.JPG`, `2.JPG`, ..., `12.JPG` (Images for coin detection).

### Step 1: Run `test_main.m`
