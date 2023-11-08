# Health Card Scanner

This system was developed at a hackathon to digitize health passports in disadvantaged communities and allow for seamless sharing of medical records in hospitals. It also helps prevent the loss of patient data, enabling doctors to provide better treatment by knowing the patients' illnesses. The ERP system facilitates easy appointments, thereby easing the workload for the understaffed medical teams in public hospitals and ultimately improving healthcare quality in disadvantaged communities.

## Overview

This repository contains the following components:

1. QR Code Scanner and Generator
2. Website
3. ERP System ([Link to the ERP System Repository](https://github.com/slic-rick/mobil-health/tree/main))
4. API and Database

## QR Code Scanner and Generator

To run the QR code scanner, follow these steps:
git stati
1. Download a zip file of the code or clone the repository.
2. Open the project folder in your terminal.
3. Run the following command (assuming you have the required Flutter environment):
   
   ```shell
   flutter run
   ```
# QR Code Scanner
![Screenshot 2023-11-08 094906](https://github.com/shecode-hue/health_card_scanner/assets/73517078/bded312d-5aeb-4902-bb5c-b10139a7b112)

## Website

To run the website, follow these steps:

1. Open the 'website' folder.
2. Double-click on 'index.html'.

# Website Dashboard 

![Screenshot 2023-11-08 103944](https://github.com/shecode-hue/health_card_scanner/assets/73517078/6b06a592-8f09-4b4c-82d9-81db4e8b36d4)

# Patient Authorization

![Screenshot 2023-11-08 104033](https://github.com/shecode-hue/health_card_scanner/assets/73517078/8f52b820-3984-4dcd-9d16-2cd3a2158cf9)


## Accessing the ERP System

You can access the ERP system in two ways:

1. Access the code directly from the repository: [ERP System Repository](https://github.com/slic-rick/mobil-health/tree/main).
2. Simply click "Connect to Management System" on the sidebar of the website.

![ERP System](images_of_erp_system.png)

## Setting Up the Database

To set up the database, follow these steps:

1. Open the "health app API" folder in the code.
2. Copy the 'database.sql' file to import it into your MySQL database.
3. Add the PHP files to your API and reconfigure the database in 'config.php' (we used XAMPP's htdocs).

## Application Workflow

Here's a simplified workflow of the application:

1. Register a new patient.
2. Generate a QR code in the app.
3. Scan the QR code.
4. Authenticate the practitioner by entering the user's PIN (whose QR code was generated) on the website.
5. Once the PIN is entered, patient data is pulled from the database and displayed.
6. The system proceeds to the ERP system.
7. The admin sends this data to the doctor.
8. The doctor accesses the medical records through the ERP system.
9. The doctor records the treatment information, which is added to the patient's account. The data is saved and backed up.
10. After treatment, the patient receives their updated health card.

For more information and queries about this system, please contact us at shainkampasi@gmail.com.
