# A Bike Share Navigate Speedy Success? - A Case Study on Cyclistic Bike Share
Welcome to the Cyclistic bike-share analysis case study! In this case study, you work for a fictional company, Cyclistic, along with some key team members. In order to answer the business questions, follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act. 

### Introduction

Welcome to the Cyclistic bike-share analysis case study! In this case study, all the resources required for analyzing how Cyclistic, a fictional bike-share company in Chicago, can maximize annual memberships by understanding the differences in bike usage between casual riders and annual members. As a junior data analyst in the Cyclistic marketing analytics team, you'll follow a structured data analysis process—Ask, Prepare, Process, Analyze, Share, and Act—to draw insights and inform marketing strategies.

### Background

In this case study, I am assuming the position of ‘Jr. Data Analyst’ at Cyclistic, a bike-share company based in Chicago. Cyclistic offers over 5800 bikes at 600 docking stations spread around Chicago. At the moment they offer classic bikes and electric bikes for use and they have two customer segments: Casuals and Members. Casuals are classified as customers who either buy a single-trip pass or a full-day pass, whereas Members are classified as customers who buy annual memberships.

### Ask

The finance department at Cyclistic has determined that Members are the more profitable customer segment and has tasked the marketing department with creating a campaign aimed at converting Casuals to Annual Members. To help them complete this business task, the marketing team has assigned me to answer the following questions : 

a.	How do annual members and casual riders use Cyclistic bikes differently? 

b.	Why would casual riders buy Cyclistic annual memberships? 

c.	How can Cyclistic use digital media to influence casual riders to become members?

### Prepare

To answer this question I will be analyzing historical Cyclistic bike trip data for all 12 months in 2022 To 2023. The data is reliable, free of any bias, and has been collected by Cyclistic and stored on the company’s database separated by month in CSV format. For the purpose of this project, I have saved the 12 relevant CSV files in my local drive.

The data collection team at Cyclistic has outlined some key facts and constraints about the data:

1.	Each month contains every single trip that took place during that period.
   
2.	All personal customer information has been removed for privacy issues.
   
3.	Classic bikes were previously labeled ‘docked bikes’, they refer to the same thing.
   
4.	Classic bikes must start and end at a docking station, whereas electric bikes have a bike lock attached to them; thus, electric bikes can also start and end their trip locked up anywhere in the general vicinity of a docking station.
   
5.	The data should have no trips shorter than 1 minute or longer than 1 day. Any data that does not fit these constraints should be removed as it is a maintenance trip carried out by the Cyclistic team, or the bike has been stolen.
   
### Process

To combine and clean the data I'm using RStudio (an integrated development environment designed for the programming language R) for this project, for two main reasons: Because of the large dataset and to gather experience with the language.
