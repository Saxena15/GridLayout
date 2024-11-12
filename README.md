# iOS Image Grid Assignment

## Overview
This repository contains an iOS application developed in SwiftUI, which efficiently loads and displays images in a scrollable grid. This project was created as part of an assignment, with strict requirements on using native technologies only, and implementing custom asynchronous image loading and caching mechanisms.

## Features
- **3-Column Image Grid**: Displays a center-cropped grid with images in a 3-column layout.
- **Asynchronous Image Loading**: Loads images from an API asynchronously.
- **Lazy Loading with Cancelation**: Cancel image loading for images that are off-screen when scrolling.
- **Memory & Disk Caching**: Implements both memory and disk cache to optimize load times and reduce redundant network calls.
- **Error Handling**: Provides error messages or placeholders for failed image loads.

## Setup and Installation

### Prerequisites
- **Xcode**: Ensure the latest version of Xcode is installed on your system.

### Running the App
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/ios-image-grid.git
   ```
2. **Open the Project**:
   - Navigate to the project folder and open the `.xcodeproj` file in Xcode.
3. **Build and Run**:
   - Select your simulator and click **Run** in Xcode to build and launch the app.

### Usage
Upon launch, the main screen displays a scrollable grid of images. Users can scroll through and view images, which load and cache on demand.

## Project Structure

- **Models**: Data models for parsing API responses.
- **Views**: SwiftUI views, including the 3-column grid layout.
- **ViewModels**: Handles data fetching, caching, and error management.
- **Networking**: Manages asynchronous image loading with `URLSession`.
- **Caching**: Custom memory and disk caching.

## Task Breakdown

1. **Image Grid Layout**: Display images in a 3-column grid with center-cropped images.
2. **Image Loading**:
   - Load images asynchronously from the API.
   - Construct the image URL with:
     ```
     imageURL = domain + "/" + basePath + "/0/" + key
     ```
   - Display at least 200 images.
3. **Caching Mechanism**:
   - Memory and disk caching.
   - Disk cache is used if an image is missing in memory.
   - Update memory cache with images retrieved from the disk.
4. **Error Handling**:
   - Handle network and image loading errors gracefully.
5. **Performance Optimization**:
   - Lazy load images.
   - Cancel image loading for off-screen images while scrolling.

##  Demo
[Demo link](https://drive.google.com/file/d/1_u_ZebTMpFyJdPJcM1i1etO8agHVH5J5/view?usp=sharing)
---
