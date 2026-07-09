# Overview

Similar Face Recognition Using IE-CNN is a MATLAB-based face recognition system designed to identify and classify similar human faces by extracting and analyzing facial features. The system integrates image processing techniques with an Interactive Graphical User Interface (GUI) to provide an efficient and user-friendly recognition process.

The application detects facial regions, extracts significant facial components, performs feature-based classification, and evaluates the recognition performance using standard performance metrics.



# Objectives

- Detect human faces from input images.
- Extract internal facial features such as eyes, nose, and mouth.
- Perform feature-based face classification.
- Recognize similar faces with improved accuracy.
- Evaluate system performance using quantitative metrics.
- Provide an easy-to-use MATLAB GUI for users.



# Features

- Interactive MATLAB GUI
- Automatic Face Detection
- Facial Feature Extraction
- Similar Face Recognition
- Performance Evaluation
- Image Processing-Based Classification
- User-Friendly Interface



# Technologies Used

- MATLAB
- Image Processing Toolbox
- Computer Vision Toolbox
- GUI Development (GUIDE/App Designer)
- Digital Image Processing Techniques



## Project Structure


Similar-Face-Recognition-Using-IE-CNN/
│
├── Main_GUI.m                # Main GUI implementation
├── Main_GUI.fig              # GUI design file
├── Run_prog.m                # Executes recognition process
├── Run_prog.fig              # Recognition GUI
├── Classification_own.m      # Face classification algorithm
├── detectfaceparts.m         # Facial feature detection
├── Performance_Analysis.m    # Performance evaluation
├── kappa1.m                  # Performance metric calculation
├── Images/
│   └── fg.jpg
├── README.md
└── .gitignore
```


# System Workflow

1. Load an input face image.
2. Detect the facial region.
3. Extract facial features.
4. Perform feature classification.
5. Compare extracted features with the stored dataset.
6. Display the recognized face.
7. Evaluate recognition performance.



# How to Run

1. Open MATLAB.
2. Download or clone this repository.
3. Open the project folder in MATLAB.
4. Run **Main_GUI.m**.
5. Upload an input face image.
6. Execute the recognition process through the GUI.
7. View the recognition result and performance analysis.



# Performance Evaluation

The system evaluates recognition performance using standard performance metrics including:

- Recognition Accuracy
- Precision
- Recall
- F1-Score
- Kappa Coefficient



# Applications

- Biometric Authentication
- Security and Surveillance
- Identity Verification
- Smart Attendance Systems
- Criminal Identification
- Access Control Systems



# Future Enhancements

- Deep Learning-based Face Recognition
- Real-Time Camera Integration
- Support for Large-Scale Face Datasets
- Cloud-Based Recognition System
- Mobile Application Integration
- Enhanced Recognition Accuracy



