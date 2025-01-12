Project Overview

This project involves deploying a static website on AWS S3 using Terraform. The website consists of an HTML file (index.html) and a CSS file (styles.css).

Step-by-Step Guide

Create an S3 Bucket: Create an S3 bucket to store the website files.
Create a Terraform Configuration File: Create a Terraform configuration file (main.tf) to define the infrastructure.
Define the S3 Bucket and Website Configuration: Define the S3 bucket and website configuration in the Terraform configuration file.
Upload the Website Files: Upload the website files (index.html and styles.css) to the S3 bucket.
Configure Public Access: Configure public access to the website files.
Issues Faced and Resolved

Issue 1: CSS File Not Loading: The CSS file was not loading due to a mismatch between the file path in the HTML file and the actual location of the file in the S3 bucket.
Resolution: Update the file path in the HTML file to match the actual location of the file in the S3 bucket.
Issue 2: Public Access Not Configured: Public access to the website files was not configured.
Resolution: Update the S3 bucket policy to grant public read access to the website files.
Issue 3: Object ACL Not Configured: The object ACL was not configured to grant public read access to the website files.
Resolution: Update the object ACL to grant public read access to the website files.
Lessons Learned

Ensure that the file paths in the HTML file match the actual location of the files in the S3 bucket.
Configure public access to the website files by updating the S3 bucket policy and object ACL.
Use Terraform to manage infrastructure as code and ensure consistency and reproducibility.
Future Improvements

Implement a CI/CD pipeline to automate the deployment of the website.
Use a more secure way to manage public access to the website files, such as using AWS IAM roles and policies.
Add more features to the website, such as a contact form or a blog.

